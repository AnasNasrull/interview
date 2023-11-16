import 'package:flutter/material.dart';
import 'package:interview_task/src/constant/config.dart';
import 'package:interview_task/src/helpers/date_time_format.dart';
import 'package:interview_task/src/helpers/scalable_dp_helper.dart';
import 'package:interview_task/src/models/home_event.dart';
import 'package:interview_task/src/ui/shared/colors.dart';
import 'package:interview_task/src/ui/shared/dimens.dart';
import 'package:interview_task/src/ui/shared/styles.dart';
import 'package:interview_task/src/ui/shared/ui_helpers.dart';

class HomeEventMenu extends StatelessWidget {
  final HomeEvent item;

  const HomeEventMenu({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Padding(
      padding: EdgeInsets.only(top: SDP.sdp(10)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.coverImage == null || item.coverImage == ''
                ? Container(
                    width: screenWidth(context),
                    height: SDP.sdp(140),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SDP.sdp(14)),
                      border: Border.all(
                        width: 0.3,
                      ),
                    ),
                    child: Icon(
                      Icons.image_outlined,
                      size: SDP.sdp(40),
                      color: BaseColors.black.withOpacity(0.5),
                    ),
                  )
                : Container(
                    width: screenWidth(context),
                    height: SDP.sdp(140),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SDP.sdp(14)),
                      image: DecorationImage(
                        image: NetworkImage(item.coverImage ?? ''),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
            verticalSpace(SDP.sdp(space)),
            Text(
              item.name ?? '',
              style: interBlackSemiBoldTextStyle.copyWith(
                fontSize: SDP.sdp(headline55),
              ),
            ),
            verticalSpace(SDP.sdp(space)),
            Text(
              item.eventType ?? '',
              style: poppinsBlackRegularTextStyle.copyWith(
                fontSize: SDP.sdp(headline55),
              ),
            ),
            verticalSpace(SDP.sdp(space)),
            Text(
              FormatDate().formatDate(
                item.dateStart ?? DateTime.now().toString(),
                context: context,
                format: Config.dateFormat,
              ),
              style: poppinsBlackRegularTextStyle.copyWith(
                fontSize: SDP.sdp(headline55),
              ),
            ),
            verticalSpace(SDP.sdp(10)),
            Divider(
              color: BaseColors.black,
              thickness: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
