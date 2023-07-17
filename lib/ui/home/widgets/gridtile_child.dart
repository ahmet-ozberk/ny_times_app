import 'package:flutter/material.dart';

import '../../../app/components/custom_image.dart';
import '../../../app/ny_times_api/response/ny_times_model.dart';

class GridtileChild extends StatelessWidget {
  final NyTimesModelResults? item;
  const GridtileChild({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    final image = item?.media?.isNotEmpty == true ? item?.media?.first?.mediaMetadata?.last?.url : '';
    return CustomImage(
      path: image,
      fit: BoxFit.cover,
    );
  }
}
