import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding paddingAll(double e) =>
      Padding(padding: EdgeInsets.all(e), child: this);

  Padding paddingSymmetric({double? vertical, double? horizontal}) => Padding(
      padding: EdgeInsets.symmetric(
          vertical: vertical ?? 0.0, horizontal: horizontal ?? 0.0),
      child: this);

  Padding paddingOnly(
          {required double left,
          required double right,
          required double top,
          required double bottom}) =>
      Padding(
          padding: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
          child: this);

  Padding paddingBottom(double e) =>
      Padding(padding: EdgeInsets.only(bottom: e), child: this);

  Padding paddingLeft(double e) =>
      Padding(padding: EdgeInsets.only(left: e), child: this);

  Padding paddingRight(double e) =>
      Padding(padding: EdgeInsets.only(right: e), child: this);

  Padding paddingTop(double e) =>
      Padding(padding: EdgeInsets.only(top: e), child: this);

  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);
}
