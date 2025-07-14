
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/addNewUser/widgets/projects_multi_picker.dart';
import 'package:shiftapp/presentation/adminFeatures/usersManagement/presentation/addNewUser/widgets/shifts_multi_picker.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/index.dart';
import '../../../../../shared/models/common_list_item.dart';
import '../../../../focusPoints/domain/entities/shifts_by_project.dart';
import '../../../../focusPoints/presentations/add_focus_point/pages/focus_point_data/widgets/projects_picker.dart';
import '../../../data/models/index.dart';
import '../../../domain/entities/index.dart';
import 'areas_user_multi_picker.dart';
import 'brands_multi_picker.dart';
import 'company_picker.dart';

///  Created by harbey on 7/11/2023.
class AddUserPermissions extends BaseStatelessWidget {
  final InitializedAddNewUser state;
  final UserManagement? initialData;
  final StreamStateInitial<List<ShiftsByProject>?> shiftsStream;
  final StreamStateInitial<List<CommonListItem>?> projectsStream;
  final StreamStateInitial<List<Brand>?> brandsStream;
  final Function(int) onFetchShifts;
  final Function(int) onFetchBrands;
  final Function(int) onFetchProjects;
  final Function(AddNewUserParams) onChanged;

  AddUserPermissions({
    Key? key,
    required this.state,
    this.initialData,
    required this.shiftsStream,
    required this.projectsStream,
    required this.brandsStream,
    required this.onFetchShifts,
    required this.onFetchBrands,
    required this.onFetchProjects,
    required this.onChanged,
  }) : super(key: key);

  StreamStateInitial<UserPermissionsStatus>? userPermissionsStream =
      StreamStateInitial<UserPermissionsStatus>();

  AddNewUserParams params = AddNewUserParams();
  String projectInitValue = '';

  @override
  Widget build(BuildContext context) {
    InfoUserManager initialTexts = state.infoUserManager;
    _initialValues();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tooltip(
            message: initialTexts.roleNameInfo ?? '',
            triggerMode: TooltipTriggerMode.tap,
            textStyle: kTextRegular.copyWith(fontSize: 12, color: kWhite),
            child: IconText(
              text: initialTexts.roleName ?? '',
              textStyle: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              icon: AppIcons.informationFill,
              iconSize: 16,
              isIconLift: true,
            ),
          ),
          const SizedBox(height: 10),
          RadioGridList(
            items: state.infoUserManager.roles
                    ?.map((e) => RadioItem(
                        value: e.id ?? '',
                        title: e.name ?? '',
                        tooltipMessage: e.description ?? ''))
                    .toList() ??
                [],
            groupValue: initialData?.role?.roleId ?? '',
            onChanged: (value) {
              print(value);
              onChangedRadio(value);
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<UserPermissionsStatus>(
              stream: userPermissionsStream?.stream,
              builder: (context, snapshot) {
                UserPermissionsStatus? userPermissionsStatus = snapshot.data;
                return Column(
                  children: [
                    if (userPermissionsStatus?.isCompany ?? false)
                      CompanyPicker(
                        title: initialTexts.companyNameInfo ?? '',
                        hintText: initialTexts.companyNameInfoPlaceHolder ?? '',
                        items: state.companies,
                        initialValue: initialData?.companyName ?? '',
                        onSelectItem: (item) {
                          onSelectItemCompany(item.index,
                              userPermissionsStatus ?? UserPermissionsStatus());
                          projectInitValue = '';
                        },
                      ),
                    if (userPermissionsStatus?.isBrand ?? false)
                      StreamStateWidgetV2(
                          stream: brandsStream,
                          isBottomSheetData: true,
                          builder: (context, brands) {
                            return BrandsMultiPicker(
                              title: initialTexts.brandNameInfo ?? '',
                              hintText:
                                  initialTexts.brandNameInfoPlaceHolder ?? '',
                              items: brands ?? [],
                              initialValue: initialData?.brands ?? [],
                              onSelectItem: (item) {
                                params.listBrand =
                                    item.map((e) => e.id ?? 0).toList();
                                onChanged(params);
                              },
                            );
                          }),
                    if (userPermissionsStatus?.isProject ?? false)
                      StreamStateWidgetV2(
                          stream: projectsStream,
                          isBottomSheetData: true,
                          builder: (context, projects) {
                            print(projects?.length);
                            return userPermissionsStatus?.isMultiProject == true
                                ? ProjectsMultiPicker(
                                    title: initialTexts.projectNameInfo ?? '',
                                    hintText:
                                        initialTexts.projectNameInfoPlaceHolder ??
                                            '',
                                    items: projects ?? [],
                                    initialValue: initialData?.projects ?? [],
                                    onMultiSelectItem: (item) {
                                      params.listProjects = item
                                          .map((e) => e.id ?? 0)
                                          .toList();
                                      initialData?.shifts = [];
                                      params.listShifts = [];
                                      onChanged(params);
                                    },
                                  )
                                :
                              ProjectsPicker(
                              title: initialTexts.projectNameInfo ?? '',
                              hintText:
                                  initialTexts.projectNameInfoPlaceHolder ?? '',
                              items: projects ?? [],
                              initialValue: projectInitValue,
                              onSelectItem: (item) {
                                params.listProjects = [item.index];
                                initialData?.shifts = [];
                                params.listShifts = [];
                                onFetchShifts(item.index);
                                onChanged(params);
                              },
                            );
                          }),
                    if (snapshot.data?.isShift ?? false)
                      ShiftsMultiPicker(
                        title: initialTexts.shiftNameInfo ?? '',
                        hintText: initialTexts.shiftNameInfoPlaceHolder ?? '',
                        shiftsStream: shiftsStream,
                        initialValue: initialData?.shifts ?? [],
                        onSelectItem: (item) {
                          params.listShifts =
                              item.map((e) => e.id ?? 0).toList();
                          onChanged(params);
                        },
                      ),
                    if (snapshot.data?.isArea ?? false)
                      AreasMultiPicker(
                        title: initialTexts.areaName ?? '',
                        hintText: initialTexts.areaNamePlaceHolder ?? '',
                        initialValue: initialData?.areas ?? [],
                        items: state.areas,
                        onSelectItem: (item) {
                          params.listArea =
                              item.map((e) => e.idString ?? '0').toList();
                          print(params.listArea);
                          onChanged(params);
                        },
                      ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  onChangedRadio(RadioItem radio) {
    params = AddNewUserParams();
    RoleDto role = state.infoUserManager.roles?.firstWhere(
            (element) => element.id == radio.value,
            orElse: () => RoleDto()) ??
        RoleDto(id: '', name: '', level: 0);
    params.roleId = role.id ?? '';
    params.level = role.level ?? 0;
    // params.companyId = 0;
    // params.listBrand = [];
    // params.listProjects = [];
    // params.listShifts = [];
    UserPermissionsStatus userPermissionsStatus = UserPermissionsStatus(
      isBrand: role.isBrand ?? false,
      isShift: role.isShift ?? false,
      isProject: role.isProject ?? false,
      isCompany: role.isCompany ?? false,
      isArea: role.isArea ?? false,
      isMultiShift: role.isMultiShift ?? false,
      isMultiProject: role.isMultiProject ?? false,
    );

    userPermissionsStream?.setData(userPermissionsStatus);
    print(role.toJson());

    onChanged(params);
  }

  onChangedRole() {
    onChanged(params);
  }

  _initialValues() {
    if (initialData != null) {
      print('dcsdcsd ${initialData?.projects?.map((e) => e.id ?? 0).toList()}');
      print('initialData  role ${initialData?.role?.roleId}');
      onChangedRadio(
          RadioItem(value: initialData?.role?.roleId ?? '', title: ''));
      params.roleId = initialData?.role?.roleId ?? '';
      params.level = initialData?.level ?? 0;
      params.companyId = initialData?.companyId ?? 0;
      params.listBrand =
          initialData?.brands?.map((e) => e.id ?? 0).toList() ?? [];
      params.listProjects =
          initialData?.projects?.map((e) => e.id ?? 0).toList() ?? [];
      if (initialData?.projects?.isNotEmpty == true) {
        projectInitValue = initialData?.projects?.first.name ?? '';
      }
      params.listShifts =
          initialData?.shifts?.map((e) => e.id ?? 0).toList() ?? [];
      params.listArea =
          initialData?.areas?.map((e) => e.id ?? '').toList() ?? [];
      RoleDto role = state.infoUserManager.roles?.firstWhere(
              (element) => element.id == initialData?.role?.roleId,
              orElse: () => RoleDto()) ??
          RoleDto(id: '', name: '', level: 0);
      if (role.isBrand == true) {
        onFetchBrands(params.companyId ?? 0);
      }
      if (role.isProject == true) {
        onFetchProjects(params.companyId ?? 0);
      }
      if (role.isShift == true) {
        onFetchShifts(params.listProjects?.first ?? 0);
      }
    }
  }

  onSelectItemCompany(
      int CompanyId, UserPermissionsStatus userPermissionsStatus) {
    params.companyId = CompanyId;
    onChanged(params);
    if (userPermissionsStatus.isBrand == true) {
      onFetchBrands(CompanyId);
    }
    if (userPermissionsStatus.isProject == true) {
      onFetchProjects(CompanyId);
    }
  }
}