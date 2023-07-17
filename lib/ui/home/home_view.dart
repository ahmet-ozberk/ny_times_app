import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/components/home_appbar_widget.dart';
import 'package:ny_times_app/app/components/loading_widget.dart';
import 'package:ny_times_app/app/extensions/num_extension.dart';
import 'package:ny_times_app/ui/home/widgets/most_popular_item.dart';

import '../../app/components/error_widget.dart';
import '../../app/ny_times_api/response/ny_times_model.dart';
import 'home_view_provider.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  List<NyTimesModelResults?>? sortDate(List<NyTimesModelResults?>? list) {
    list?.sort((a, b) {
      final aDate = DateTime.parse(a?.publishedDate ?? '');
      final bDate = DateTime.parse(b?.publishedDate ?? '');
      return bDate.compareTo(aDate);
    });
    return list;
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(mostPopularProvider);
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: api.when(
        data: (data) {
          final searchValue = ref.watch(homeViewProvider).searchValue;
          final itemData = sortDate(data.results);
          final itemCount = itemData
                  ?.where((element) =>
                      ((element?.title?.toLowerCase().trim().contains(searchValue.toLowerCase().trim()) ?? false) ||
                          (element?.byline?.toLowerCase().trim().contains(searchValue.toLowerCase().trim()) ?? false)))
                  .length ??
              0;
          return SafeArea(
            top: false,
            child: ListView.separated(
              itemCount: itemCount,
              separatorBuilder: (context, index) => 12.height,
              padding: 12.paddingVertical,
              itemBuilder: (context, index) {
                final item = itemData
                    ?.where((element) =>
                        ((element?.title?.toLowerCase().trim().contains(searchValue.toLowerCase().trim()) ?? false) ||
                            (element?.byline?.toLowerCase().trim().contains(searchValue.toLowerCase().trim()) ?? false)))
                    .elementAt(index);
                return MostPopularItem(item: item);
              },
            ),
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrWidget(error: error),
      ),
    );
  }
}
