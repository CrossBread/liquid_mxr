import 'dart:ui';

import 'package:equatable/equatable.dart';

class ColorMix extends Equatable{
  final int r, g, b;
  Color get color => Color.fromRGBO(r, g, b, 1);
  List<Color> get components => [Color.fromRGBO(r, 0, 0, 1), Color.fromRGBO(0, g, 0, 1), Color.fromRGBO(0, 0, b, 1)];
  double get intensity => 1-color.computeLuminance();

  const ColorMix(this.r, this.g, this.b);

  @override
  List<Object> get props => [r, g, b];

  ColorMix copyWith({
    int? r,
    int? g,
    int? b,
  }) => ColorMix(
      r = r ?? this.r,
      g = g ?? this.g,
      b = b ?? this.b,
    );
}