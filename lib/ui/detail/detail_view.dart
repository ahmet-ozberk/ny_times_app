import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ny_times_app/app/components/custom_image.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';

import '../../app/ny_times_api/response/ny_times_model.dart';

class DetailView extends ConsumerStatefulWidget {
  final NyTimesModelResults? item;
  const DetailView({super.key, this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailViewState();
}

class _DetailViewState extends ConsumerState<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SC.newsDetail),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: widget.item!.id!,
                transitionOnUserGestures: true,
                child: CustomImage(
                  path: widget.item?.media?.first?.mediaMetadata?.last?.url ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: widget.item?.title != null
                    ? Text(
                        widget.item?.title ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
                subtitle: Text(
                  widget.item?.updated ?? '',
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.item?.theAbstract ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
