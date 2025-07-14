import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/utils/app_icons.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../../common/domain/constants/codes_constants.dart';
import '../../../../shared/components/bottom_sheet/custom_bottom_sheets.dart';
import '../../../../shared/components/buttons/details_button.dart';
import '../../../../shared/models/common_list_item.dart';
import '../../data/models/reject_user_request_params.dart';
import '../../domain/entities/user_request.dart';
import '../pages/user_request_terms_builder.dart';

class UserRequestItem extends BaseStatelessWidget {
  final UserRequest data;
  final Function() onRefresh;
  final Function(RejectUserRequestParams) onReject;
  final CommonListItem? selectedTab;

  UserRequestItem({
    Key? key,
    required this.data,
    required this.onRefresh,
    required this.onReject,
    this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.shapeDecorationShadow(),
      child: Column(
        children: [
          userInfo(),
          listRowTextsIcons(),
          attachments(context),
          // detailsButton(context),
          if(selectedTab?.isShowActionButton == true)
          rowButtonsActions(context),
        ],
      ),
    );
  }

  UserInfoWidgetWithIcon userInfo() {
    return UserInfoWidgetWithIcon(
      image: data.imagePath ?? '',
      name: data.cashiftName ?? "",
      phone: data.oldPhoneNumber ?? "",
    );
  }

  ListRowTextsIconsV2 listRowTextsIcons() {
    return ListRowTextsIconsV2(
      isMark: true,
      isExpanded: false,
      paddingItem: EdgeInsets.symmetric(vertical: 5),
      items: data.toListRowTextItems(strings),
    );
  }

  Row attachments(BuildContext context) {
    return Row(
      children: [
        kLoadSvgInCirclePath(
          AppIcons.file,
          color: kPrimary,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(strings.attachments,
            style: kTextMedium.copyWith(color: kPrimary, fontSize: 12)),
        const SizedBox(
          width: 5,
        ),
        InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.filesPreviewPage,
                arguments: [data.attachmentDocument ?? ""],
              );
            },
            child: data.isPDFFile
                ? kLoadSvgInCirclePath(
                    AppIcons.pdf,
                  )
                : kBuildImage(data.attachmentDocument ?? "",
                    width: 60, height: 40)),
      ],
    );
  }

  DetailsButtons detailsButton(BuildContext context) {
    return DetailsButtons(
      title: strings.show_cashifter_data,
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.cv,
        );
      },
    );
  }

  RowButtons rowButtonsActions(BuildContext context) {
    return RowButtons(
      margin: EdgeInsets.symmetric(vertical: 18),
      textSaveButton: strings.accept,
      textCancelButton: strings.reject,
      onCancel: () {
        showRejectActionBottomSheet(context);
      },
      onSave: () {
        onAcceptPressed(context);
      },
    );
  }

  void onAcceptPressed(BuildContext context) {
    UsersRequestsBuilder.show(
      context,
      onRefresh: onRefresh,
      userRequest: data,
      codeTab: selectedTab?.code ?? '',
    );
  }

  showRejectActionBottomSheet(BuildContext context) {
    showRejectBottomSheet(
      context,
      title: strings.user_request_reject_title,
      subtitle: strings.user_request_reject_subtitle,
      isShowWaringText: false,
      onRejectPressed: (value) {
        Navigator.pop(context);
        onRejectPressed(value);
      },
    );
  }

  void onRejectPressed(String value) {
    onReject(RejectUserRequestParams(
      id: data.id,
      reason: value,
      statusId: CodesConstants.rejected,
    ));
  }
}
