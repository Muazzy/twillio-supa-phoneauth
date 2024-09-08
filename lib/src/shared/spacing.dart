import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VerticalSpacing extends SizedBox {
  const VerticalSpacing([double height = 8, Key? key])
      : super(key: key, height: height);
}

class HorizontalSpacing extends SizedBox {
  const HorizontalSpacing([double width = 8, Key? key])
      : super(key: key, width: width);
}
