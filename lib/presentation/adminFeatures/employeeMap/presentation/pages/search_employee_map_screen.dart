import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/adminFeatures/employeeMap/presentation/widgets/emp_map_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../domain/entities/EmpMap.dart';

class SearchEmployeeMapScreen extends BaseStatelessWidget {
  final EmpMap data;
  bool isShow = false;
 final String  city ;
  final String   job ;
  SearchEmployeeMapScreen( {super.key, required this.data,required this.city,required this.job});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SearchEmployeeMapWidget(
          locations: data.freeLncerLocations ?? [],
        ),
        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(7),
              decoration: Decorations.decorationTabs,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextValueV2(
                        text: strings.city,
                        value: city,
                      ),

                      TextValueV2(text: strings.jobs, value:job),
                      IconButton(
                          onPressed: () {
                            isShow=!isShow;
                            setState(() {});
                          },
                          icon: Icon(Icons.keyboard_arrow_down))
                    ],
                  ),
                    if (isShow == true)
                    Row(
                      children: [
                        Expanded(
                          child: totalWidget(
                              bag: kPrimary.withOpacity(.1),
                              textColor: kPrimary,
                              label: strings.total_male,
                              value: data.malesCount.toString(),
                              type: strings.male),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: totalWidget(
                              bag: kOrange00.withOpacity(.1),
                              textColor: kOrange00,
                              label: strings.total_female,
                              value: data.femalesCount.toString(),
                              type: strings.female),
                        ),
                      ],
                    )
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  TextValueV2({
    required String text,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          text,
          style: kTextRegular.copyWith(fontSize: 12),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: kTextRegular.copyWith(fontSize: 12, color: kGreen_65),
        ),
      ],
    );
  }

  totalWidget({
    required Color bag,
    required Color textColor,
    required String label,
    required String value,
    required String type,
  }) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: kTextMedium.copyWith(fontSize: 12, color: Colors.black),
          ),
          SizedBox(height: 7,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: kTextMedium.copyWith(fontSize: 16, color: textColor),
              ),
              SizedBox(width: 5,),
              Text(
                type,
                style: kTextRegular.copyWith(fontSize: 12, color: textColor),
              ),
            ],
          ),
        ],
      ),
      decoration: Decorations.decorationOnlyRadius(color: bag),
    );
  }
}
