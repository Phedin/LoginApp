part of 'frame_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FrameOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class FrameOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the FrameOne widget is first created.
class FrameOneInitialEvent extends FrameOneEvent {
  @override
  List<Object?> get props => [];
}
