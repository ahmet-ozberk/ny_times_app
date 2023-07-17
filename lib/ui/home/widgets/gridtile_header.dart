import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ny_times_app/app/constants/string_constant.dart';

import '../../../app/ny_times_api/response/ny_times_model.dart';

class GridtileHeader extends StatelessWidget {
  final NyTimesModelResults? item;
  const GridtileHeader({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        item?.title ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
 
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: const Text(SC.copyLink),
              onTap: () {
                copyMethod(item?.url);
                successSnackBar(context);
              },
            ),
          ];
        },
        child: const Icon(Icons.more_vert_rounded),
      ),
    );
  }

  void copyMethod(String? item) {
    Clipboard.setData(
      ClipboardData(
        text: item ?? '',
      ),
    );
  }

  void successSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(SC.copiedToClipboard),
      ),
    );
  }
}
