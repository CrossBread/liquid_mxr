import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:liquid_mxr/color_mixer/domain/entities/color_mix.dart';

part 'mixer_event.dart';
part 'mixer_state.dart';

class MixerBloc extends Bloc<MixerEvent, MixerState> {
  static const defaultColorMix = ColorMix(100, 100, 100);

  MixerBloc() : super(const MixerInitial(colorMix: defaultColorMix, status: MixerStatus.initial)) {
    on<MixerChangedEvent>((event, emit) {
      emit(MixerSuccess(colorMix: event.newColorMix, status: MixerStatus.success));
    });
    on<MixerResetEvent>((event, emit) {
      emit(const MixerSuccess(colorMix: defaultColorMix, status: MixerStatus.success));
    });
    on<MixerStartEvent>((event, emit) {
      emit(const MixerSuccess(colorMix: defaultColorMix, status: MixerStatus.success));
    });
  }
}
