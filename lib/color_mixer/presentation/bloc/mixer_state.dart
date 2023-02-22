part of 'mixer_bloc.dart';

enum MixerStatus {initial, loading, success, failure}

abstract class MixerState extends Equatable {
  final ColorMix colorMix;
  final MixerStatus status;

  const MixerState({required this.colorMix, required this.status});

  @override
  List<Object> get props => [colorMix];
}

class MixerInitial extends MixerState {
  const MixerInitial({required super.colorMix, required super.status});
}

class MixerLoading extends MixerState {
  const MixerLoading({required super.colorMix, required super.status});
}
class MixerSuccess extends MixerState {
  const MixerSuccess({required super.colorMix, required super.status});
}
class MixerFailures extends MixerState {
  const MixerFailures({required super.colorMix, required super.status});
}
