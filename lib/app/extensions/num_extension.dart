import 'package:flutter/material.dart';

extension NumExtension on num {
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get height => SizedBox(height: toDouble());
  BorderRadius get borderRadius => BorderRadius.circular(toDouble());
  EdgeInsets get padding => EdgeInsets.all(toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: toDouble());
}
