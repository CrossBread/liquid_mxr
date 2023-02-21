part of 'mixer_bloc.dart';

abstract class MixerEvent extends Equatable {
  final ColorMix newColorMix;
  const MixerEvent(this.newColorMix);

  @override
  List<Object?> get props => [newColorMix];

}

class MixerStartEvent extends MixerEvent {
  const MixerStartEvent(super.newColorMix);
}
class MixerChangedEvent extends MixerEvent {
  const MixerChangedEvent(super.newColorMix);
}
class MixerResetEvent extends MixerEvent {
  const MixerResetEvent(super.newColorMix);
}
