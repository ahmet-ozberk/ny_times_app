import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';
import 'package:ny_times_app/ui/home/home_view_provider.dart';

class HomeAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const HomeAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final r = ref.read(homeViewProvider);
    final w = ref.watch(homeViewProvider);
    return AppBar(
      title: w.isSearching ? _searchBar : _title,
      centerTitle: false,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () => r.changeSearchState(),
          tooltip: SC.search,
          icon: Icon(
            w.isSearching ? Icons.close : Icons.search,
          ),
        ),
      ],
    );
  }

  Consumer get _searchBar => Consumer(builder: (context, ref, child) {
        final r = ref.read(homeViewProvider);

        return TextField(
          focusNode: r.focusNode,
          cursorColor: Colors.white,
          onChanged: r.setSearchValue,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            hintText: '${SC.search}...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      });

  Text get _title {
    return const Text(
      SC.homeAppBarTitle,
    );
  }
}
