import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/helpers/validator/validator.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/images.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/chip.dart';
import 'package:interview_task/src/ui/widgets/textfield.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<SignUpViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.secondary,
        body: Container(
          height: screenHeight(context),
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                width: screenWidth(context),
                height: SDP.sdp(144),
                color: BaseColors.brown,
                padding: EdgeInsets.all(SDP.sdp(smallPadding)),
                child: InkWell(
                  onTap: vm.toLandingPage,
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeightPercentage(context, percentage: 0.9),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: screenWidth(context),
                          height:
                              screenHeightPercentage(context, percentage: 0.84),
                          padding: EdgeInsets.symmetric(
                            vertical: SDP.sdp(bigPadding),
                            horizontal: SDP.sdp(smallPadding),
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [shadow],
                            color: BaseColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(SDP.sdp(radius)),
                              topLeft: Radius.circular(SDP.sdp(radius)),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: interBlackBoldTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline2),
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(bigSpace * 2)),
                                  Form(
                                    key: vm.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        KTextField(
                                          isDense: true,
                                          maxLines: 1,
                                          borderRadius:
                                              SDP.sdp(textfieldRadius),
                                          controller: vm.emailController,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          borderColor: BaseColors.brown,
                                          placeholder: 'Email / Phone Number',
                                          placeholderStyle:
                                              interBlackRegularTextStyle
                                                  .copyWith(
                                            fontSize: SDP.sdp(headline5),
                                            color: BaseColors.hint,
                                          ),
                                          validator: Validator.emailValidator,
                                        ),
                                        verticalSpace(SDP.sdp(space)),
                                        KTextField(
                                          isDense: true,
                                          maxLines: 1,
                                          borderRadius:
                                              SDP.sdp(textfieldRadius),
                                          textInputAction: TextInputAction.go,
                                          controller: vm.passwordController,
                                          borderColor: BaseColors.brown,
                                          placeholder: 'Password',
                                          onFieldSubmitted: (val) =>
                                              vm.toLogin(),
                                          placeholderStyle:
                                              interBlackRegularTextStyle
                                                  .copyWith(
                                            fontSize: SDP.sdp(headline5),
                                            color: BaseColors.hint,
                                          ),
                                          suffixIcon: IconButton(
                                            padding: EdgeInsets.only(
                                                right: SDP.sdp(20)),
                                            onPressed: () {
                                              setState(() {
                                                vm.obscure = !vm.obscure;
                                              });
                                            },
                                            icon: vm.obscure
                                                ? SvgPicture.asset(keyIcon)
                                                : Icon(
                                                    Icons.key_off_outlined,
                                                    size: SDP.sdp(20.0),
                                                    color: BaseColors.primary,
                                                  ),
                                          ),
                                          obscure: vm.obscure,
                                          validator:
                                              Validator.passwordValidator,
                                        ),
                                      ],
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(40)),
                                  SizedBox(
                                    width: screenWidthPercentage(context,
                                        percentage: 0.7),
                                    child: KChip(
                                      isLoading: vm.isBusy,
                                      isDisabled: vm.isBusy,
                                      padding: EdgeInsets.symmetric(
                                        vertical: SDP.sdp(16.0),
                                        horizontal: SDP.sdp(space),
                                      ),
                                      loadingColor: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        SDP.sdp(radius),
                                      ),
                                      color: BaseColors.primary,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(width: SDP.sdp(20)),
                                          Text(
                                            'Continue',
                                            style: interBlackRegularTextStyle
                                                .copyWith(
                                              fontSize: SDP.sdp(headline5),
                                              color: BaseColors.white,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: BaseColors.white,
                                            size: SDP.sdp(20),
                                          ),
                                        ],
                                      ),
                                      onPressed: () => vm.toLogin(),
                                    ),
                                  ),
                                  verticalSpace(SDP.sdp(20)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Already have an account?',
                                        style:
                                            interBlackRegularTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: vm.toLogin,
                                        child: Text(
                                          ' Login',
                                          style: interPrimaryRegularTextStyle
                                              .copyWith(
                                            fontSize: SDP.sdp(headline55),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create your free account',
                                    style: interBlackRegularTextStyle.copyWith(
                                      fontSize: SDP.sdp(headline55),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      ' Sign Up',
                                      style:
                                          interPrimaryRegularTextStyle.copyWith(
                                        fontSize: SDP.sdp(headline55),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: SDP.sdp(120),
                          width: SDP.sdp(120),
                          padding: EdgeInsets.symmetric(
                            vertical: SDP.sdp(space),
                            horizontal: SDP.sdp(space),
                          ),
                          child: Image.asset(logo),
                          decoration: BoxDecoration(
                            color: BaseColors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
