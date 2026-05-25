import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../presentationUser/resources/colors.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../data/models/add_job_uniform_params.dart';
import '../../data/models/uniform_dto.dart';

class JobUniformItem extends BaseStatelessWidget {
  final Function() onEditJobUniform;
  final Function() onRemoveJobUniform;
  final JobUniformDetail uniformDetail;

  JobUniformItem({
    Key? key,
    required this.onEditJobUniform,
    required this.onRemoveJobUniform,
    required this.uniformDetail,
  }) : super(key: key);

  AddJobUniformParams params = AddJobUniformParams();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 180,
      margin: EdgeInsetsDirectional.only(end: 10, bottom: 25),
      padding: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
      decoration: Decorations.shapeDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:   kBuildImage(
                width: 70,
                uniformDetail.uniFormImage ?? '',
                showFullImage: true
              ),

          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  uniformDetail.description ?? '',
                  style: kTextSemiBold.copyWith(
                    color: kBlack,
                    fontSize: 12,
                  ),
                ),
              ),
              InkWell(
                  onTap: () {
                    onRemoveJobUniform();
                  },
                  child: kLoadSvgInCirclePath(
                    AppIcons.deleteOutline,
                  )),
            ],
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
