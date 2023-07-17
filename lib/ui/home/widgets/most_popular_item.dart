import 'package:flutter/material.dart';
import 'package:ny_times_app/app/extensions/context_extension.dart';
import 'package:ny_times_app/app/extensions/num_extension.dart';
import 'package:ny_times_app/services/navigate_services.dart';
import 'package:ny_times_app/ui/detail/detail_view.dart';

import '../../../app/ny_times_api/response/ny_times_model.dart';
import 'gridtile_child.dart';
import 'gridtile_footer.dart';
import 'gridtile_header.dart';

class MostPopularItem extends StatelessWidget {
  final NyTimesModelResults? item;
  const MostPopularItem({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.4,
      child: GestureDetector(
        onTap: () => Navigate.to(DetailView(item: item)),
        child: Card(
          child: ClipRRect(
            borderRadius: 12.borderRadius,
            child: GridTile(
              header: GridtileHeader(item: item),
              footer: GridtileFooter(item: item),
              child: Hero(
                  tag: item!.id!,
                  transitionOnUserGestures: true,
                  child: GridtileChild(item: item)),
            ),
          ),
        ),
      ),
    );
  }
}
