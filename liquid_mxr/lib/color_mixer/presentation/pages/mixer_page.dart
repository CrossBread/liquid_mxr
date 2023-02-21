import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider_nnbd/flutter_fluid_slider_nnbd.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class MixerPage extends StatelessWidget {
  static const _backgroundColor = Color(0xFFF15BB5);

  static const _colors = [
    Color(0xFFFEE440),
    Color(0xFF00BBF9),
  ];

  static const _durations = [
    5000,
    4000,
  ];

  static const _heightPercentages = [
    0.65,
    0.66,
  ];
  const MixerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 10 , fit: FlexFit.loose,child: WaveWidget(config: CustomConfig(
            colors: _colors,
            durations: _durations,
            heightPercentages: _heightPercentages,
          ), size: Size.infinite, backgroundColor: Colors.purpleAccent, isLoop: true,),),
          Flexible(flex: 1, child: Container(color: Colors.red, child: FluidSlider(value: 127, min: 0, max: 255, sliderColor: Colors.red, thumbColor: Colors.redAccent, onChanged:(value) {

          }),),),
          Flexible(flex: 1, child: Container(color: Colors.green, child: FluidSlider(value: 127, min: 0, max: 255, sliderColor: Colors.green, thumbColor: Colors.greenAccent, onChanged:(value) {

          }),),),
          Flexible(flex: 1, child: Container(color: Colors.blue, child: FluidSlider(value: 127, min: 0, max: 255, sliderColor: Colors.blue, thumbColor: Colors.blueAccent, onChanged:(value) {

          }, ),),),

        ],
      ),

    );
  }
}
