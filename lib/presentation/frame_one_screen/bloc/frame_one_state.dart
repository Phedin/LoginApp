part of 'frame_one_bloc.dart';

/// Represents the state of FrameOne in the application.

// ignore_for_file: must_be_immutable
class FrameOneState extends Equatable {
  FrameOneState(
      {this.emailInputController,
      this.passwordInputController,
      this.frameOneModelObj});

  TextEditingController? emailInputController;

  TextEditingController? passwordInputController;

  FrameOneModel? frameOneModelObj;

  @override
  List<Object?> get props =>
      [emailInputController, passwordInputController, frameOneModelObj];
  FrameOneState copyWith({
    TextEditingController? emailInputController,
    TextEditingController? passwordInputController,
    FrameOneModel? frameOneModelObj,
  }) {
    return FrameOneState(
      emailInputController: emailInputController ?? this.emailInputController,
      passwordInputController:
          passwordInputController ?? this.passwordInputController,
      frameOneModelObj: frameOneModelObj ?? this.frameOneModelObj,
    );
  }
}
