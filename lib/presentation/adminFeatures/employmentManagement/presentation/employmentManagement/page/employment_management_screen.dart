import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/common/data/exceptions/empty_list_exception.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/error_handler_widget.dart';
import '../../../../../../common/components/pagination/custom_footer_builder.dart';
import '../../../data/models/add_block_employee_params.dart';
import '../../../domain/entities/employee_data.dart';
import '../../../domain/entities/popup_employment_management.dart';
import '../widgets/employment_management_item.dart';

class EmploymentManagementScreen extends BaseStatelessWidget {
  final PopupEmploymentManagement popups;
  final Function() onRefresh;
  final Function(List<EmployeeData>) onLoading;
  final RefreshController refreshController;
  final StreamStateInitial<List<EmployeeData>?> employeeDataStream;
  final Function(AddBlockEmployeeParams) onBlockEmployee;
  final Function(int) onAllowEditFaceRecognition;

  EmploymentManagementScreen({
    Key? key,
    required this.popups,
    required this.onRefresh,
    required this.onLoading,
    required this.employeeDataStream,
    required this.refreshController,
    required this.onBlockEmployee,
    required this.onAllowEditFaceRecognition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EmployeeData>?>(
      stream: employeeDataStream.stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        return
          (data != null && data!.isEmpty)
            ? ErrorPlaceHolderWidget(
                exception: EmptyListException(),
                onClickReload: () {
                  onRefresh();
                },
              )
            : SmartRefresher(
                enablePullUp: true,
                footer: CustomFooterBuilder(),
                controller: refreshController,
                onRefresh: () => onRefresh(),
                onLoading: () => onLoading(data ?? []),
                child: Material(
                  color: kBackground,
                  child: ListView.builder(
                    itemCount: data?.length ?? 0,
                    shrinkWrap: true,
                    controller: ScrollController(),
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
                    itemBuilder: (context, index) {
                      print(data![index].freeLanceId);
                      return EmploymentManagementItem(
                        item: data[index],
                        popups: popups,
                        onRefresh: onRefresh,
                          onBlockEmployee: onBlockEmployee,
                        onAllowEditFaceRecognition: onAllowEditFaceRecognition,
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
