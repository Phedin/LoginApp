import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/frame_one_model.dart';
part 'frame_one_event.dart';
part 'frame_one_state.dart';

/// A bloc that manages the state of a FrameOne according to the event that is dispatched to it.
class FrameOneBloc extends Bloc<FrameOneEvent, FrameOneState> {
  FrameOneBloc(FrameOneState initialState) : super(initialState) {
    on<FrameOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FrameOneInitialEvent event,
    Emitter<FrameOneState> emit,
  ) async {
    emit(
      state.copyWith(
        emailInputController: TextEditingController(),
        passwordInputController: TextEditingController(),
      ),
    );
  }
}
