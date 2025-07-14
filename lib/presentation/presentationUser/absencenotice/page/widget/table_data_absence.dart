


import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/data/models/absence_notation/index.dart';

import '../../../../../common/data/exceptions/empty_list_exception.dart';
 import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/error_handler_widget.dart';
import '../../../resources/constants.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';

import '../../../../../common/components/underline_widget.dart';
import 'list_day_absence.dart';


class TableDataAbsenceWidget extends BaseStatelessWidget {

    final List<AbsenceDateParams> absenceDateParams;

  TableDataAbsenceWidget(this.absenceDateParams, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15.0),
        child: Container(
          width: double.infinity,
          decoration: Decorations.boxDecorationShaded(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  strings.days_absence,
                  style: kTextMedium.copyWith(
                    color: kPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const UnderlineWidget(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        strings.date_absence,
                        style: kTextMedium.copyWith(
                          color: kPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        strings.reasons_for_absence,
                        style: kTextMedium.copyWith(
                          color: kPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                absenceDateParams.isEmpty
                    ? ErrorPlaceHolderWidget(
                  exception: EmptyListException(),
                )
                    :
                ListDayAbsence(absenceDateParams: absenceDateParams  ),
              ],
            ),
          ),
        ),
      ),
    );
  }





}
