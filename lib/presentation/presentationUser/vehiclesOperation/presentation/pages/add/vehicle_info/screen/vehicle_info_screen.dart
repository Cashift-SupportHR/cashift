import '../../../../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../../../../adminFeatures/focusPoints/domain/entities/shifts_by_project.dart';
import '../../../../../../../adminFeatures/vehicles/domain/entities/vehicle_details.dart';
import '../../../../../../../../common/components/index.dart';
import '../../../../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../../common/stream_data_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

class VehicleInfoScreen extends BaseStatelessWidget {
  final Function(int shiftId) onNext;
  final Function() onCancel;
  final VehicleDetails vehicleDetails;
  final StreamDataState<List<ShiftsByProject>?> shiftsStream;
  VehicleInfoScreen(
      {super.key,
      required this.vehicleDetails,
      required this.onNext,
      required this.shiftsStream,
      required this.onCancel});
  int? shiftId;
  final _formKey = GlobalKey<FormState>();
  TextEditingController shiftController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: RowButtons(
        onCancel: () => onCancel(),
        onSave: () {
          if(_formKey.currentState!.validate()){
            onNext(shiftId ?? 0);
          }
        },
        textSaveButton: strings.next_button,
        textCancelButton: strings.previous_button,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              headerVehicles(),
              infoVehicles(),
              infoPlateAndLicense(),
              additionalSpecifications(context: context),
              Form(
                  key: _formKey,
                  child: shiftsPickerStream()),
            ],
          )),
    );
  }

  Widget headerVehicles() {
    return Row(
      children: [
        kBuildCircleImage(vehicleDetails.vehicleImage ?? "", size: 40),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehicleDetails.vehicleBrandName ?? "",
                style: kTextBold.copyWith(fontSize: 16),
              ),
              Text(
                vehicleDetails.model ?? "",
                style: kTextRegular.copyWith(fontSize: 12, color: kPrimaryDark),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget infoVehicles() {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      decoration: Decorations.decorationTabs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlineText(text: strings.vehicles_info, fontSize: 15),
          SizedBox(
            height: 10,
          ),
          ListRowTexts(
              valueStyle:
                  kTextMedium.copyWith(fontSize: 12, color: Colors.black),
              titles: [
                strings.vehicle_type,
                strings.company_name,
                strings.project_name,
                strings.model,
                strings.year_crate,
              ],
              values: [
                vehicleDetails.vehicleBrandName ?? "",
                vehicleDetails.companyName ?? "",
                vehicleDetails.projectName ?? "",
                vehicleDetails.model ?? "",
                vehicleDetails.yearOfManufacture.toString() ?? "",
              ]),
        ],
      ),
    );
  }

  Widget infoPlateAndLicense() {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      decoration: Decorations.decorationTabs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlineText(text: strings.plate_license_info, fontSize: 15),
          SizedBox(
            height: 10,
          ),
          ListRowTexts(
              valueStyle:
                  kTextMedium.copyWith(fontSize: 12, color: Colors.black),
              titles: [
                strings.license_number,
                strings.number_plate,
                strings.expair_date_license,
              ],
              flex: 2,
              values: [
                vehicleDetails.licenseNumber ?? "",
                vehicleDetails.plateNumber ?? "",
                DateFormatter.formatDateString(
                    vehicleDetails.licenseExpiryDate.toString() ?? "",
                    DateFormatter.TIME_STAMP,
                    DateFormatter.DATE_UI)
              ]),
        ],
      ),
    );
  }

  Widget additionalSpecifications({context}) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: Decorations.decorationTabs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlineText(text: strings.additional_specifications, fontSize: 15),
          SizedBox(
            height: 10,
          ),
          ListRowTexts(
              valueStyle:
                  kTextMedium.copyWith(fontSize: 12, color: Colors.black),
              titles: [
                strings.vehicle_specifications,
              ],
              flex: 2,
              values: [
                vehicleDetails.specifications ?? "",
              ]),
        ],
      ),
    );
  }

  StreamDataStateWidget<List<ShiftsByProject>?> shiftsPickerStream() {
    return StreamDataStateWidget<List<ShiftsByProject>?>(
        stream: shiftsStream,
        builder: (context, data) {
          return BuildTextFieldItem(
            title: strings.working_period,
            hintText: strings.select_working_period,
            suffixIcon: Icons.keyboard_arrow_down,
            controller: shiftController,
            onTap: () {
              ListPickerWidget.showPicker(
                  context: context,
                  title: strings.select_working_period,
                  setSearch: true,
                  searchHint: strings.search,
                  items: ShiftsByProject.toItemsListPicker(data ?? []),
                  onSelectItem: (item) async {
                    shiftController.text = item.value;
                    shiftId = item.index;
                  });
            },
          );
        });
  }
}
