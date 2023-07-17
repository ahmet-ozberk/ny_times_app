import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ny_times_app/app/ny_times_api/response/ny_times_model.dart';

class GridtileFooter extends StatelessWidget {
  final NyTimesModelResults? item;
  const GridtileFooter({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: GridTileBar(
         backgroundColor: Colors.black26,
          title: Text(
            item?.theAbstract ?? '',
            maxLines: 2,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
