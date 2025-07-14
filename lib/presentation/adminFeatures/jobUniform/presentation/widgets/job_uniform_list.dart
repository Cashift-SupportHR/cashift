import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/texts/underline_text.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../presentationUser/resources/colors.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/error_handler_widget.dart';
import '../../../../../common/components/helper_widgets.dart';
import '../../../../../common/components/loading_widget.dart';
import '../../data/models/add_job_uniform_params.dart';
import '../../data/models/uniform_dto.dart';
import '../../domain/entities/Uniform.dart';
import 'add_job_uniform_bottom_sheet.dart';
import 'job_uniform_item.dart';

class JobUniformList extends BaseStatelessWidget {
  final Function(AddJobUniformParams) onAddJobUniform;
  final Function(int) onRemoveJobUniform;
  List<Uniform> data;
  final int jobId;
  final int companyId;
  JobUniformList({
    Key? key,
    required this.onAddJobUniform,
    required this.onRemoveJobUniform,
    required this.data,
    required this.jobId,
    required this.companyId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnderlineText(
              text: data[index].name ?? '',
              fontSize: 16,
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: Row(
                children: [
                  addWidget(
                    context,
                    addJobUniformParams: AddJobUniformParams(
                      id: 0,
                      jobId: jobId,
                      companyId: companyId,
                      jobUniformCategoryId: data[index].id,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data[index].jobUniformDetails!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return JobUniformItem(
                          onEditJobUniform: () {
                            AddJobUniformParams params = AddJobUniformParams(
                              id:  data[index]
                                  .jobUniformDetails![i]
                                  .jobUniformId,
                              companyId: companyId,
                              jobUniformCategoryId: data[index].id,
                              jobId: jobId,
                            );

                            showAddJobUniformBottomSheet(context,
                                data: params,
                                jobUniformDetail:
                                    data[index].jobUniformDetails![i]);
                          },
                          onRemoveJobUniform: () {
                            onRemoveJobUniform(data[index]
                                .jobUniformDetails![i]
                                .jobUniformId!);
                          },
                          uniformDetail: data[index].jobUniformDetails![i],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  showAddJobUniformBottomSheet(BuildContext context,
      {required AddJobUniformParams data, JobUniformDetail? jobUniformDetail}) {
    return showAppModalBottomSheet(
      context: context,
      isCloseButton: false,
      isDivider: false,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
      child: AddJobUniformBottomSheet(
        uniform: jobUniformDetail,
        data: data,
        onAddJobUniform: (params) {
          Navigator.pop(context);
          params.id = data.id;
          params.jobUniformCategoryId = data.jobUniformCategoryId ?? 0;
          params.companyId = data.companyId ?? 0;
          print('paramsjhjhjjjh${params.toJson()}');
          onAddJobUniform(params);
        },
      ),
    );
  }

  addWidget(BuildContext context,
      {required AddJobUniformParams addJobUniformParams}) {
    return InkWell(
      onTap: () {
        print(addJobUniformParams.companyId);
        print(addJobUniformParams.jobId);
        print(addJobUniformParams.id);
        print("jkjkjkjkjkjkjkjk");
        showAddJobUniformBottomSheet(
          context,
          data: addJobUniformParams,
        );
      },
      child: Container(
        height: 180,
        width: 100,
        margin: EdgeInsetsDirectional.only(end: 10, bottom: 25),
        padding: EdgeInsets.all(16),
        decoration: Decorations.decorationOnlyRadius(color: kGrey_EF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: kPrimary,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              strings.add_photo,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
