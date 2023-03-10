import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_mxr/color_mixer/presentation/bloc/mixer_bloc.dart';
import 'package:liquid_mxr/color_mixer/presentation/pages/mixer_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MixerBloc(),
      child: const MixerPage(),
    );
  }
}
