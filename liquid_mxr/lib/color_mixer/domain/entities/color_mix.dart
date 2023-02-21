import 'dart:ui';

import 'package:equatable/equatable.dart';

class ColorMix extends Equatable{
  final int r, g, b;
  Color get color => Color.fromRGBO(r, g, b, 1);

  const ColorMix(this.r, this.g, this.b);

  @override
  List<Object> get props => [r, g, b];
}