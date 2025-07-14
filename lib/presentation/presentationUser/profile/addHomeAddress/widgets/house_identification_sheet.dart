import 'package:shiftapp/common/components/index.dart';
import '../../../../../common/domain/entities/resume/index.dart';
import '../../../common/stream_data_state.dart';
import '../../../resources/colors.dart';
import '../../../../../common/data/models/add-address/add_home_location_params.dart';

class HouseIdentificationSheet extends BaseStatelessWidget {
  final AddHomeLocationParams params;
  final List<CityItem> cities;
  final StreamDataStateInitial<List<DistrictItem>> districtsStream;
  final Function(int) onFetchDistricts;
  final Function(AddHomeLocationParams) onAddressAdded;

  HouseIdentificationSheet({
    Key? key,
    required this.params,
    required this.cities,
    required this.districtsStream,
    required this.onFetchDistricts,
    required this.onAddressAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      bottom: 0,
      end: 0,
      start: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: kPrimary.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kGray_C4,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            UnderlineText(text: 'تحديد المنزل',  fontSize: 16),
            const SizedBox(height: 20),
            citiesPicker(),
            districtsStreamPicker(),
            const SizedBox(height: 20),
            rowButtons(context),
          ],
        ),
      ),
    );
  }

  Widget citiesPicker() {
    return BottomSheetTextFieldRectangle(
      title: strings.city,
      hintText: strings.select_city,
      items: CityItem.toItems(cities, isRtl()),
      setSearch: true,
      isScrollControlled: true,
      // controller: cityController,
      initValue: params.cityName ?? '',
      onSelectItem: (item) {
        params.cityId = item.index;
        params.cityName = item.value ?? '';
        onFetchDistricts(item.index);
      },
    );
  }

  districtsStreamPicker() {
    return StreamDataStateWidget<List<DistrictItem>?>(
      stream: districtsStream,
      builder: (context, data) {
        return BottomSheetTextFieldRectangle(
          title: strings.district,
          hintText: strings.select_district,
          setSearch: true,
          isScrollControlled: true,
          // controller: districtController,
          initValue: params.districtName ?? '',
          items: DistrictItem.toListItem(data ?? []),
          onSelectItem: (item) async {
            params.districtName = item.value ?? '';
            params.districtid = item.index;
          },
        );
      }
    );
  }

  Widget rowButtons(BuildContext context) {
    return RowButtons(
      textSaveButton: strings.save_button,
      onSave: () {
        onSavePressed(context);
      },
      onCancel: () {
        Navigator.pop(context);
      },
    );
  }

  void onSavePressed(BuildContext context) {
    onAddressAdded(params,
    );
  }
}
