import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/images.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';
import 'package:interview_task/src/ui/widgets/home_event_menu.dart';
import 'package:interview_task/src/ui/widgets/loading.dart';
import 'package:interview_task/src/ui/widgets/textfield.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Loading(
          status: vm.isBusy ||
              vm.fetchingHomeEvent ||
              vm.fetchingUser ||
              vm.fetchingToken,
          child: SafeArea(
            child: Container(
              height: screenHeight(context),
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: screenWidth(context),
                    height: SDP.sdp(144),
                    color: BaseColors.brown,
                    padding: EdgeInsets.all(SDP.sdp(smallPadding)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          logo,
                          width: SDP.sdp(70),
                          color: BaseColors.black,
                        ),
                        horizontalSpace(SDP.sdp(2)),
                        Container(
                          width: SDP.sdp(200),
                          child: Text.rich(
                            TextSpan(
                              text: 'Making Memories',
                              children: [
                                TextSpan(
                                  text: ' of Those Giving Their Best',
                                  style: interBlackRegularTextStyle.copyWith(
                                    fontSize: SDP.sdp(headline44),
                                  ),
                                ),
                              ],
                            ),
                            style: interBlackBoldTextStyle.copyWith(
                              fontSize: SDP.sdp(headline44),
                            ),
                          ),
                        ),
                        horizontalSpace(SDP.sdp(bigSpace)),
                        SvgPicture.asset(
                          notifIcon,
                          color: BaseColors.black,
                        ),
                      ],
                    ),
                  ),
                  vm.token != null
                      ? menuLogin(vm, context)
                      : menuNotLogin(vm, context),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget menuLogin(HomeViewModel vm, BuildContext context) {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidth(context),
        height: screenHeightPercentage(context, percentage: 0.74),
        padding: EdgeInsets.symmetric(
          vertical: SDP.sdp(padding),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      vm.user?.profileImage == null ||
                              vm.user?.profileImage == ''
                          ? Container(
                              height: SDP.sdp(50),
                              width: SDP.sdp(50),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 0.3,
                                ),
                              ),
                              child: Icon(
                                Icons.person_outline,
                                size: SDP.sdp(30),
                                color: BaseColors.black.withOpacity(0.5),
                              ),
                            )
                          : Container(
                              height: SDP.sdp(50),
                              width: SDP.sdp(50),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(vm.user?.profileImage ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      horizontalSpace(SDP.sdp(space)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: interBlackRegularTextStyle.copyWith(
                              fontSize: SDP.sdp(headline55),
                            ),
                          ),
                          verticalSpace(SDP.sdp(6)),
                          Text(
                            vm.user?.fullname ?? '-',
                            style: poppinsBlackSemiBoldTextStyle.copyWith(
                              fontSize: SDP.sdp(headline5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(walletIcon),
                          horizontalSpace(SDP.sdp(4)),
                          Text(
                            formatCurrency.format(vm.user?.wallet ?? 0),
                            style: interPrimarySemiBoldTextStyle.copyWith(
                              fontSize: SDP.sdp(headline5),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(SDP.sdp(6)),
                      Text(
                        'Top Up',
                        style: interBlackSemiBoldTextStyle.copyWith(
                          fontSize: SDP.sdp(headline5),
                          color: BaseColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(SDP.sdp(bigSpace)),
              Divider(
                color: BaseColors.black,
                thickness: 0.2,
              ),
              verticalSpace(SDP.sdp(bigSpace)),
              KTextField(
                isDense: true,
                maxLines: 1,
                borderRadius: SDP.sdp(textfieldRadius),
                controller: vm.searchController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                borderColor: BaseColors.brown,
                placeholder: 'Search',
                placeholderStyle: interBlackRegularTextStyle.copyWith(
                  fontSize: SDP.sdp(headline5),
                  color: BaseColors.hint,
                ),
                suffixIcon: Container(
                  padding: EdgeInsets.all(SDP.sdp(12)),
                  child: SvgPicture.asset(
                    searchIcon,
                  ),
                ),
              ),
              verticalSpace(SDP.sdp(bigSpace)),
              Container(
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  textColor: BaseColors.black,
                  iconColor: BaseColors.black,
                  initiallyExpanded: true,
                  title: Text(
                    'Services',
                    style: interBlackBoldTextStyle.copyWith(
                      fontSize: SDP.sdp(headline3),
                    ),
                  ),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Wrap(
                        spacing: SDP.sdp(space),
                        runSpacing: SDP.sdp(space),
                        children: [
                          Container(
                            height: SDP.sdp(110),
                            width: screenWidthPercentage(context,
                                percentage: 0.44),
                            decoration: BoxDecoration(
                              color: BaseColors.brown,
                            ),
                            padding: EdgeInsets.all(SDP.sdp(space)),
                            child: Stack(
                              children: [
                                Container(
                                  width: SDP.sdp(90),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Get',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Photographer',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Image.asset(
                                      photographer,
                                      height: SDP.sdp(100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: SDP.sdp(110),
                            width: screenWidthPercentage(context,
                                percentage: 0.44),
                            decoration: BoxDecoration(
                              color: BaseColors.grey,
                            ),
                            padding: EdgeInsets.all(SDP.sdp(space)),
                            child: Stack(
                              children: [
                                Container(
                                  width: SDP.sdp(80),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Request',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Live',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Streaming',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Image.asset(
                                      live,
                                      height: SDP.sdp(100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: SDP.sdp(110),
                            width: screenWidthPercentage(context,
                                percentage: 0.44),
                            decoration: BoxDecoration(
                              color: BaseColors.brown2nd,
                            ),
                            padding: EdgeInsets.all(SDP.sdp(space)),
                            child: Stack(
                              children: [
                                Container(
                                  width: SDP.sdp(90),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rent',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Equipment',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Image.asset(
                                      camera,
                                      height: SDP.sdp(70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: SDP.sdp(110),
                            width: screenWidthPercentage(context,
                                percentage: 0.44),
                            decoration: BoxDecoration(
                              color: BaseColors.grey2nd,
                            ),
                            padding: EdgeInsets.all(SDP.sdp(space)),
                            child: Stack(
                              children: [
                                Container(
                                  width: SDP.sdp(90),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Offer',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Services',
                                        style: interBlackBoldTextStyle.copyWith(
                                          fontSize: SDP.sdp(headline55),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    child: Image.asset(
                                      videographer,
                                      height: SDP.sdp(100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(SDP.sdp(bigSpace)),
              Text(
                'Recent Event',
                style: interBlackBoldTextStyle.copyWith(
                  fontSize: SDP.sdp(headline3),
                ),
              ),
              verticalSpace(SDP.sdp(space)),
              Column(
                children: vm.eventList
                    .map((item) => HomeEventMenu(item: item))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuNotLogin(HomeViewModel vm, BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenHeightPercentage(context, percentage: 0.74),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth(context),
                height: screenHeightPercentage(context, percentage: 0.7),
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      KTextField(
                        isDense: true,
                        maxLines: 1,
                        borderRadius: SDP.sdp(textfieldRadius),
                        controller: vm.searchController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        borderColor: BaseColors.brown,
                        placeholder: 'Search',
                        placeholderStyle: interBlackRegularTextStyle.copyWith(
                          fontSize: SDP.sdp(headline5),
                          color: BaseColors.hint,
                        ),
                        suffixIcon: Container(
                          padding: EdgeInsets.all(SDP.sdp(12)),
                          child: SvgPicture.asset(
                            searchIcon,
                          ),
                        ),
                      ),
                      verticalSpace(SDP.sdp(bigSpace)),
                      Container(
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          childrenPadding: EdgeInsets.zero,
                          textColor: BaseColors.black,
                          iconColor: BaseColors.black,
                          initiallyExpanded: true,
                          title: Text(
                            'Services',
                            style: interBlackBoldTextStyle.copyWith(
                              fontSize: SDP.sdp(headline3),
                            ),
                          ),
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Wrap(
                                spacing: SDP.sdp(space),
                                runSpacing: SDP.sdp(space),
                                children: [
                                  Container(
                                    height: SDP.sdp(110),
                                    width: screenWidthPercentage(context,
                                        percentage: 0.44),
                                    decoration: BoxDecoration(
                                      color: BaseColors.brown,
                                    ),
                                    padding: EdgeInsets.all(SDP.sdp(space)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: SDP.sdp(90),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Get',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Photographer',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            child: Image.asset(
                                              photographer,
                                              height: SDP.sdp(100),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: SDP.sdp(110),
                                    width: screenWidthPercentage(context,
                                        percentage: 0.44),
                                    decoration: BoxDecoration(
                                      color: BaseColors.grey,
                                    ),
                                    padding: EdgeInsets.all(SDP.sdp(space)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: SDP.sdp(80),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Request',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Live',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Streaming',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            child: Image.asset(
                                              live,
                                              height: SDP.sdp(100),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: SDP.sdp(110),
                                    width: screenWidthPercentage(context,
                                        percentage: 0.44),
                                    decoration: BoxDecoration(
                                      color: BaseColors.brown2nd,
                                    ),
                                    padding: EdgeInsets.all(SDP.sdp(space)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: SDP.sdp(90),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Rent',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Equipment',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            child: Image.asset(
                                              camera,
                                              height: SDP.sdp(70),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: SDP.sdp(110),
                                    width: screenWidthPercentage(context,
                                        percentage: 0.44),
                                    decoration: BoxDecoration(
                                      color: BaseColors.grey2nd,
                                    ),
                                    padding: EdgeInsets.all(SDP.sdp(space)),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: SDP.sdp(90),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Offer',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Services',
                                                style: interBlackBoldTextStyle
                                                    .copyWith(
                                                  fontSize: SDP.sdp(headline55),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            child: Image.asset(
                                              videographer,
                                              height: SDP.sdp(100),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(SDP.sdp(bigSpace)),
                      Text(
                        'Recent Event',
                        style: interBlackBoldTextStyle.copyWith(
                          fontSize: SDP.sdp(headline3),
                        ),
                      ),
                      verticalSpace(SDP.sdp(space)),
                      Column(
                        children: vm.eventList
                            .map((item) => HomeEventMenu(item: item))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ElevatedButton(
                onPressed: vm.toLandingPage,
                style: ElevatedButton.styleFrom(
                  onPrimary: BaseColors.primary,
                  primary: BaseColors.primary,
                  elevation: 1,
                  padding: EdgeInsets.symmetric(
                    vertical: SDP.sdp(18),
                    horizontal: SDP.sdp(padding),
                  ),
                ),
                child: Container(
                  width: SDP.sdp(200),
                  child: Text(
                    'Login / Sign Up',
                    style: interBlackRegularTextStyle.copyWith(
                      fontSize: SDP.sdp(headline6),
                      color: BaseColors.white,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
