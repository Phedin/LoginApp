import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../domain/facebookauth/facebook_auth_helper.dart';
import '../../domain/googleauth/google_auth_helper.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/frame_one_bloc.dart';
import 'models/frame_one_model.dart';

// ignore_for_file: must_be_immutable
class FrameOneScreen extends StatelessWidget {
  FrameOneScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<FrameOneBloc>(
      create: (context) => FrameOneBloc(FrameOneState(
        frameOneModelObj: FrameOneModel(),
      ))
        ..add(FrameOneInitialEvent()),
      child: FrameOneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [appTheme.pink500, theme.colorScheme.primaryContainer],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 34.h,
                    top: 44.h,
                    right: 34.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 58.h),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup1,
                        height: 108.h,
                        width: 178.h,
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 8.h),
                        child: Text(
                          "msg_learn_graphic_and".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMedium15,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      BlocSelector<FrameOneBloc, FrameOneState,
                          TextEditingController?>(
                        selector: (state) => state.emailInputController,
                        builder: (context, emailInputController) {
                          return CustomTextFormField(
                            controller: emailInputController,
                            hintText: "lbl_email_address".tr,
                            textInputType: TextInputType.emailAddress,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 14.h,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_email";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      BlocSelector<FrameOneBloc, FrameOneState,
                          TextEditingController?>(
                        selector: (state) => state.passwordInputController,
                        builder: (context, passwordInputController) {
                          return CustomTextFormField(
                            controller: passwordInputController,
                            hintText: "lbl_password".tr,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.visiblePassword,
                            obscureText: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 14.h,
                            ),
                            validator: (value) {
                              if (value == null ||
                                  (!isValidPassword(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_password";
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomElevatedButton(
                        text: "lbl_login".tr,
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "msg_forgot_password".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 38.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_don_t_have_an_account2".tr,
                              style: theme.textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: "lbl_register_now".tr,
                              style: theme.textTheme.bodySmall!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 38.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 50.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgGoogle,
                              height: 50.h,
                              width: 52.h,
                              onTap: () {
                                onTapImgGoogleone(context);
                              },
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgFacebook,
                              height: 50.h,
                              width: 52.h,
                              onTap: () {
                                onTapImgFacebookone(context);
                              },
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgClose,
                              height: 50.h,
                              width: 52.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 52.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_by_signing_up_you2".tr,
                              style: theme.textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: "msg_terms_conditions".tr,
                              style: theme.textTheme.bodySmall!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapImgGoogleone(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapImgFacebookone(BuildContext context) async {
    await FacebookAuthHelper()
        .facebookSignInProcess()
        .then((facebookUser) {})
        .catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
