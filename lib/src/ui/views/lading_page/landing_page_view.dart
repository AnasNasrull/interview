import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/images.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'landing_page_viewmodel.dart';

class LandingPageView extends StatelessWidget {
  const LandingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<LandingPageViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        body: Container(
          height: screenHeight(context),
          child: Stack(
            children: <Widget>[
              Container(
                width: screenWidth(context),
                height: SDP.sdp(500),
                child: Stack(
                  children: [
                    Container(
                      width: screenWidth(context),
                      height: SDP.sdp(500),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bgLandingPage),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: vm.showDashboard,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: SDP.sdp(60),
                            right: SDP.sdp(30),
                          ),
                          child: Text(
                            'Skip',
                            style: interBlackBoldTextStyle.copyWith(
                              fontSize: SDP.sdp(headline4),
                              color: BaseColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: screenWidth(context),
                  height: SDP.sdp(300),
                  padding: EdgeInsets.symmetric(
                    vertical: SDP.sdp(smallPadding),
                    horizontal: SDP.sdp(smallPadding),
                  ),
                  decoration: BoxDecoration(
                    color: BaseColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(SDP.sdp(radius)),
                      topLeft: Radius.circular(SDP.sdp(radius)),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: SDP.sdp(120),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(logo),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(SDP.sdp(space)),
                      Text(
                        'Making Memories',
                        style: interBlackBoldTextStyle.copyWith(
                          fontSize: SDP.sdp(headline1),
                        ),
                      ),
                      verticalSpace(SDP.sdp(space)),
                      Text(
                        'of Those Giving Their Best',
                        style: interBlackRegularTextStyle.copyWith(
                          fontSize: SDP.sdp(headline44),
                        ),
                      ),
                      verticalSpace(SDP.sdp(bigSpace)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: vm.toSignUp,
                            style: ElevatedButton.styleFrom(
                              onPrimary: BaseColors.primary,
                              primary: BaseColors.primary,
                              elevation: 1,
                              padding: EdgeInsets.symmetric(
                                vertical: SDP.sdp(13),
                                horizontal: SDP.sdp(padding),
                              ),
                            ),
                            child: Container(
                              width: SDP.sdp(100),
                              child: Text(
                                'Sign Up',
                                style: interBlackSemiBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline6),
                                  color: BaseColors.white,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: vm.toLogin,
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: BaseColors.primary,
                                width: 1,
                              ),
                              onPrimary: BaseColors.white,
                              primary: BaseColors.white,
                              elevation: 1,
                              padding: EdgeInsets.symmetric(
                                vertical: SDP.sdp(13),
                                horizontal: SDP.sdp(padding),
                              ),
                            ),
                            child: Container(
                              width: SDP.sdp(100),
                              child: Text(
                                'Login',
                                style: interBlackSemiBoldTextStyle.copyWith(
                                  fontSize: SDP.sdp(headline6),
                                  color: BaseColors.primary,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LandingPageViewModel(),
    );
  }
}
