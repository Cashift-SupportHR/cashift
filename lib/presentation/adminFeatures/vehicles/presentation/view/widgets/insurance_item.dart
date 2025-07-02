import 'package:shiftapp/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/constract_add_insurance.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/core/utils/app_icons.dart';
import '../../../../../../core/services/routes.dart';
import '../../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../domain/entities/insurances.dart';

class InsuranceItem extends BaseStatelessWidget {
  final Insurances data;
  final Function() onRefresh;
  final Function(int id) onDelete;

  InsuranceItem({
    Key? key,
    required this.data,
    required this.onRefresh,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(5),
      decoration: Decorations.decorationTabs,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListRowTextsIcons(
                  flex: 2,
                  titleStyle:
                      kTextMedium.copyWith(fontSize: 12, color: kPrimary),
                  icons: [
                    AppIcons.car2,
                    AppIcons.buildingsOutline,
                    AppIcons.insurance,
                    AppIcons.calandery,
                  ],
                  titles: [
                    strings.type_insurance,
                    strings.company_name_insurance,
                    strings.number_insurance,
                    strings.expire_date
                  ],
                  values: [
                    data.vehicleInsuranceTypeName ?? "",
                    data.insuranceProvider ?? "",
                    data.insuranceNumber ?? "",
                    DateFormatter.formatDateString(
                        data.insuranceExpiryDate ?? "",
                        DateFormatter.TIME_STAMP,
                        DateFormatter.DATE_UI)
                  ]),
              Row(
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
                      style:
                          kTextMedium.copyWith(color: kPrimary, fontSize: 12)),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        // showImageViewer(
                        //   context,
                        //   Image.network(
                        //     data.insuranceImagePath ?? "",
                        //   ).image,
                        //   useSafeArea: true,
                        //   swipeDismissible: true,
                        //   doubleTapZoomable: true,
                        // );

                        Navigator.pushNamed(
                          context,
                          Routes.filesPreviewPage,
                          arguments: [data.insuranceImagePath ?? ""],
                        );
                      },
                      child: (data.insuranceImagePath ?? '').contains("pdf")
                          ? kLoadSvgInCirclePath(
                              AppIcons.pdf,
                            )
                          : kBuildImage(data.insuranceImagePath ?? "",
                              width: 60, height: 40)),
                ],
              )
            ],
          ),
          PositionedDirectional(
              top: 0,
              end: 0,
              child: _OptionsMenuButton(
                onDelete: () => onDelete(data.id ?? 0),
                insurancesDto: data,
                onRefresh: onRefresh,
              ))
        ],
      ),
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.vehiclesDetailsPage,
        );
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_details,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final Insurances insurancesDto;
  final Function() onDelete;
  final Function() onRefresh;

  _OptionsMenuButton({
    required this.insurancesDto,
    required this.onDelete,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 20;

    return OptionsMenuButton(
      options: [
        BuildPopupMenuItemContent(
          title: strings.delete,
          iconPath: AppIcons.deleteOutline,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
        BuildPopupMenuItemContent(
          title: strings.edit,
          iconPath: AppIcons.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
          isDivider: false,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          onDelete();
        }
        if (value == 1) {
          final isRefresh = await Navigator.pushNamed(
              context, Routes.addInsurancePage,
              arguments: ConstractAddInsurance(insurancesDto: insurancesDto));
          if (isRefresh == true) {
            onRefresh();
          }
        }
      },
    );
  }
}
