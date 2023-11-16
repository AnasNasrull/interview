import 'package:flutter/material.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return ViewModelBuilder<ProfileViewModel>.nonReactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.white,
        body: Center(
          child: ElevatedButton(
            onPressed: vm.logout,
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
                'Logout',
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
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
