import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/icons/icon_text.dart';
import 'package:shiftapp/presentation/shared/components/texts/list_row_texts_icons.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/image_builder.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../../shared/components/texts/read_more_text.dart';
import '../../../domain/entities/user_management.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../addNewUser/pages/add_new_user_page.dart';
import '../../changeUserPassword/pages/change_user_password_page.dart';

///  Created by harbey on 7/4/2023.
class UsersManagementItem extends BaseStatelessWidget {
  final UserManagement item;
  final int type;
  final Function() onRefresh;
  final Function(String) onChangeStatus;
  final Function(String) onDeleteUser;

  UsersManagementItem({Key? key, required this.item, required this.type, required this.onRefresh, required this.onChangeStatus, required this.onDeleteUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _OptionsMenuButton(
            item: item,
            onRefresh: onRefresh,
            onChangeStatus: onChangeStatus,
            onDeleteUser: onChangeStatus,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, top: 16, end: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: kTextSemiBold.copyWith(fontSize: 24, color: kPrimary),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _Body(
                      phone: item.phoneNumber ?? '',
                      email: item.email ?? '',
                    ),
                  ],
                ),
              ),
              _Footer(
                item: item,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final UserManagement item;
  final Function() onRefresh;
  final Function(String) onChangeStatus;
  final Function(String) onDeleteUser;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
    required this.onChangeStatus,
    required this.onDeleteUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit_user_profile,
          iconPath: AppIcons.editPenOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: item.isActive ?? true ? strings.deactivate_account : strings.activate_account,
          iconPath: AppIcons.statusChange,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.edit_password,
          iconPath: AppIcons.lockOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          AddNewUserPage.push(context, userInfo: item, onSuccess: () {
            print('isTrue');
            onRefresh();
          });
        } else if (value == 1) {
          onChangeStatus(item.id ?? '');
        } else if (value == 2) {
          Navigator.pushNamed(context, Routes.changeUserPasswordPage, arguments: item);
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  final String phone;
  final String email;

  _Body({
    Key? key,
    required this.phone,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconText(
          icon: AppIcons.phone,
          text: phone,
        ),
        SizedBox(
          height: 4,
        ),
        iconText(
          icon: AppIcons.email,
          text: email,
        ),
      ],
    );
  }

  Widget iconText({required String icon, required String text}) => IconText(
        icon: icon,
        text: text,
        crossAxisAlignment: CrossAxisAlignment.center,
        sizedBoxWidth: 14,
        isExpanded: true,
        iconSize: 16,
        textStyle: kTextRegular.copyWith(fontSize: 16, color: kGreen_7B),
      );
}

class _Footer extends BaseStatelessWidget {
  final UserManagement item;

  _Footer({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = kTextRegular.copyWith(fontSize: 14, color: kBlack_0B);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 4, bottom: 16, end: 16, start: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          item.role?.roleName == null
              ? SizedBox()
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalDivider(
                        color: kYellow_00,
                        thickness: 1,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              strings.permissions + ':',
                              style: kTextMedium.copyWith(fontSize: 16, color: kYellow_00),
                            ),
                            if (item.role?.roleName != null && item.role!.roleName!.isNotEmpty) ...[
                              Text(
                                item.role?.roleName ?? '',
                                style: style,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                            if (item.companyName != null && item.companyName!.isNotEmpty) ...[
                              Text(
                                item.companyName ?? '',
                                style: style,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                            if (item.projects != null && item.projects!.isNotEmpty)
                              ReadMoreText(
                                text: item.projects?.map((e) => e.name ?? '').join(', ') ?? '',
                              ),
                            if (item.brands != null && item.brands!.isNotEmpty)
                              ReadMoreText(
                                text: item.brands?.map((e) => e.name ?? '').join(', ') ?? '',
                              ),
                            if (item.shifts != null && item.shifts!.isNotEmpty)
                              ReadMoreText(
                                text: item.shifts?.map((e) => e.shiftName ?? '').join(', ') ?? '',
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
