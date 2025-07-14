import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/trackAttendanceDeparture/presentation/details/widgets/track_attendance_departure_details_item.dart';
import 'package:shiftapp/presentation/adminFeatures/trackAttendanceDeparture/presentation/details/widgets/track_user_item.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/texts/underline_text.dart';
import '../../../domain/entities/RequestAttendanceDepartureDetails.dart';
import '../../../domain/entities/index.dart';

class TrackAttendanceDepartureDetailsScreen extends BaseStatelessWidget {
  final RequestAttendanceDepartureDetails data;

  TrackAttendanceDepartureDetailsScreen({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrackUserItem(data:data),

        Padding(
            padding: const EdgeInsets.all(16),
            child: UnderlineText(text: strings.dta_service,fontSize: 14,)),
        data.trackFaceRecognitionDetailsList?.length==0?SizedBox():   Expanded(
          child: GridView.builder(
            itemCount: data.trackFaceRecognitionDetailsList?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return TrackAttendanceDepartureDetailsItem(
                item: data.trackFaceRecognitionDetailsList![index],
              );
            },
          ),
        ),
      ],
    );
  }
}
