import 'package:flutter/material.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
 import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/domain/entities/wallet/index.dart';
import '../../../../../../core/utils/app_icons.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../bloc/apply_details_cubit.dart';

import 'apply_details_screen.dart';

class ApplyDetailsListPage extends BaseBlocWidget<
    Initialized<List<ApplyDetails>>, ApplyDetailsCubit> {


  @override
  bool initializeByKoin() {
    return false;
  }
  static push(BuildContext context,{
    required int companyId, required int statusId, required int? headId ,required int type
}){
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      context: context,
      builder: (BuildContext context) {
        final strings = context.getStrings();

        return Container(
          height: 400,
          decoration: Decorations.createRectangleDecorationOnlyTop(
            color: kBackgroundColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 20,
                        width: 30,
                        child: kLoadSvgInCirclePath(
                          AppIcons.remove,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                   strings.opportunity_details_more,
                  style: kTextBoldSmall.copyWith(
                    color: kPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: kOrange,
                  height: 2,
                  width: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ApplyDetailsListPage(
                        companyId: companyId,
                        statusId: statusId,
                        headId:headId!, type: type,

                    )),
              ],
            ),
          ),
        );
      },
    );
  }
  final int type;
  final int statusId;
  final int companyId;
  final int? headId;

   ApplyDetailsListPage( {required this.statusId,required this.companyId,required this.headId,required this.type});
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadApplyDetails(query: BalanceDetailsQuery(statusId: statusId, companyId: companyId,headId: headId,type: type));
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<ApplyDetails>> state) {
    return ApplyDetailsListScreen(
      applyDetailsList: state.data, loan: type==3,
    );
  }
}


