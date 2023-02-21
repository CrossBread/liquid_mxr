import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fluid_slider_nnbd/flutter_fluid_slider_nnbd.dart';
import 'package:liquid_mxr/color_mixer/color_utils.dart';
import 'package:liquid_mxr/color_mixer/presentation/bloc/mixer_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class MixerPage extends StatelessWidget {
  static const _backgroundColor = Color(0xFFF15BB5);

  static const _colors = [
    Color(0xFFFEE440),
    Color(0xFF00BBF9),
  ];

  static const _durations = [
    7000,
    6000,
    5000,
  ];

  static const _heightPercentages = [
    0.65,
    0.66,
    0.67,
  ];
  const MixerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 10 , fit: FlexFit.loose,child: LiquidPullToRefresh(
            onRefresh: () async {  },
            child: GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              children: [
                BlocConsumer<MixerBloc, MixerState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return WaveWidget(config: CustomConfig(
                  colors: [darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],
                  durations: _durations,
                  heightPercentages: _heightPercentages,
                ), size: Size.infinite, backgroundColor: Colors.purpleAccent, isLoop: true,);
  },
),
              ],
            ),
          ),),
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
