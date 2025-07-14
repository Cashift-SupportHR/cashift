import 'package:flutter/material.dart';

import '../../../../../common/data/models/absence_notation/absencenotice.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
class ListDayAbsence extends StatelessWidget {
  const ListDayAbsence({Key? key, required this.absenceDateParams}) : super(key: key);
  final List< AbsenceDateParams> absenceDateParams;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        absenceDateParams[index].requestDate??"",
                        style: kTextMedium.copyWith(
                          color: kGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      flex: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        width: 2,
                        height: 20,
                        color: kGrey_3,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        absenceDateParams[index].notes??'',
                        style: kTextMedium.copyWith(
                          color: kGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width:double.infinity,
                  height: 2,
                  color: kGrey_3,
                ),
              ],
            ),
          );
        },
        itemCount:  absenceDateParams.length,
      ),
    );
  }
}
