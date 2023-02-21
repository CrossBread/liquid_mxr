import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fluid_slider_nnbd/flutter_fluid_slider_nnbd.dart';
import 'package:liquid_mxr/color_mixer/color_utils.dart';
import 'package:liquid_mxr/color_mixer/domain/entities/color_mix.dart';
import 'package:liquid_mxr/color_mixer/presentation/bloc/mixer_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class MixerPage extends StatefulWidget {
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
    0.45,
    0.56,
    0.67,
  ];
  const MixerPage({super.key});

  @override
  State<MixerPage> createState() => _MixerPageState();
}

class _MixerPageState extends State<MixerPage> {
  double _redValue = 0;
  double _greenValue = 0;
  double _blueValue = 0;

  @override
  void initState() {
    super.initState();
    context.read<MixerBloc>().add(const MixerStartEvent(MixerBloc.defaultColorMix));
    _redValue = MixerBloc.defaultColorMix.r.toDouble();
    _greenValue = MixerBloc.defaultColorMix.g.toDouble();
    _blueValue = MixerBloc.defaultColorMix.b.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 10 , fit: FlexFit.loose,child: LiquidPullToRefresh(
            onRefresh: () async {
              context.read<MixerBloc>().add(const MixerResetEvent(MixerBloc.defaultColorMix));
            },
            child: GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              children: [
                BlocBuilder<MixerBloc, MixerState>(
  builder: (context, state) {
    return WaveWidget(config: CustomConfig(
                  colors: [darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],
                  // colors: state.colorMix.components,
      durations: MixerPage._durations,
                  blur: const MaskFilter.blur(BlurStyle.solid, 3),
                  // gradients: [[darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],[darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],[darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],],
                  // gradients: [[darken(state.colorMix.color), darken(state.colorMix.color,20),darken(state.colorMix.color)],[lighten(state.colorMix.color), lighten(state.colorMix.color,20),lighten(state.colorMix.color)],[darken(state.colorMix.color), lighten(state.colorMix.color),state.colorMix.color],],
                  // durations: MixerPage._durations.map((value) {
                  //   print((value*(1-state.colorMix.color.computeLuminance())).toInt());
                  //   return (value*(1-state.colorMix.color.computeLuminance())).toInt();
                  // }).toList(),
                  heightPercentages: MixerPage._heightPercentages.map((e) => e*state.colorMix.intensity).toList(),
                ), size: Size.infinite,
      backgroundColor: darken(state.colorMix.color,30),
      // backgroundColor: state.colorMix.color,
      isLoop: true,
    );
  },
),
              ],
            ),
          ),),
          Flexible(flex: 1, child: Container(color: Colors.red, child: BlocBuilder<MixerBloc, MixerState>(
  builder: (context, state) {
    return FluidSlider(value: state.colorMix.r.toDouble(), min: 0, max: 255, sliderColor: Colors.red, thumbColor: state.colorMix.components[0], onChanged:(value) {
            _redValue = value;
addMixerChangedEvent(context);
          });
  },
),),),
          Flexible(flex: 1, child: Container(color: Colors.green, child: BlocBuilder<MixerBloc, MixerState>(
  builder: (context, state) {
    return FluidSlider(value: state.colorMix.g.toDouble(), min: 0, max: 255, sliderColor: Colors.green, thumbColor: state.colorMix.components[1], onChanged:(value) {
            _greenValue = value;
            addMixerChangedEvent(context);

          });
  },
),),),
          Flexible(flex: 1, child: Container(color: Colors.blue, child: BlocBuilder<MixerBloc, MixerState>(
  builder: (context, state) {
    return FluidSlider(value: state.colorMix.b.toDouble(), min: 0, max: 255, sliderColor: Colors.blue, thumbColor: state.colorMix.components[2], onChanged:(value) {
            _blueValue = value;
            addMixerChangedEvent(context);

          }, );
  },
),),),

        ],
      ),

    );
  }

  void addMixerChangedEvent(BuildContext context) {
    context.read<MixerBloc>().add(MixerChangedEvent(ColorMix(_redValue.round(), _greenValue.round(), _blueValue.round())));
  }
}
