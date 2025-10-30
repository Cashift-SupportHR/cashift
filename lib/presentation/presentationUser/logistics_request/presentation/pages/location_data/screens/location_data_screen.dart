import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shiftapp/presentation/adminFeatures/projectsManagement/presentation/addNewProject/pages/addProject/widgets/cities_picker.dart';

import '../../../../../../../domain/entities/resume/city_item.dart';
import '../../../../../../../domain/entities/resume/district_item.dart';
import '../../../../../../../utils/app_icons.dart';
import '../../../../../../adminFeatures/projectsManagement/domain/entities/city.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../common/common_state.dart';
import '../../../../../common/stream_data_state.dart';
import '../../../../../map_picker/widgets/map_picker_item.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../data/models/index.dart';

class LocationDataScreen extends BaseStatelessWidget {
  final Function(AddLogisticPrams addLogisticPrams) onNext;
  final Function() onPrevious;
  final Function(int cityId) onFetchDistricts;
  List<CityItem> cities;
  StreamDataState<List<DistrictItem>> districtsStream;
  LocationDataScreen({
    Key? key,
    required this.cities,
    required this.districtsStream,
    required this.onFetchDistricts,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);
  TextEditingController mainLocationController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  LatLng? mainLocation;
  int? cityId;
  List<int>? preferredDistrictIds;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: RowButtons(
        textSaveButton:
            getArguments(context) != null ? strings.save_button : strings.next,
        textCancelButton: strings.previous,
        onSave: () {
          if (_formKey.currentState!.validate()) {
            onNext(
              AddLogisticPrams(
                preferredDistrictIds: preferredDistrictIds,
                location: Location(
                  cityId: cityId,
                  longitude: mainLocation?.longitude ?? 0.0,
                  latitude: mainLocation?.latitude ?? 0.0,
                ),
              ),
            );
          }
        },
        onCancel: () {
          onPrevious();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.housing_location_data,
                style: kTextBold.copyWith(fontSize: 14, color: kGreen_144)
              ),
              SizedBox(height: 20),
              mainLocationTextField(context),
              CitiesPicker(
                items:
                    cities
                        .map(
                          (e) => City(
                            cityName: local == "ar" ? e.nameAr : e.nameEn,
                            id: e.id,
                          ),
                        )
                        .toList(),
                onSelectItem: (item) {
                  cityId = item.index;
                  onFetchDistricts(item.index);
                  print(item.index);
                },
              ),
              districtTextField(),
            ],
          ),
        ),
      ),
    );
  }

  mainLocationTextField(context) {
    return BuildTextFieldItem(
      title: strings.housing_location,
      hintText: strings.select_housing_location,
      keyboardType: TextInputType.name,
      controller: mainLocationController,
      onTap: () {},
      sizeEndIcon: 25,
      showCustomEndIcon: true,
      endIcon: AppIcons.locationDetection,
      onTapEndIcon: () async {
        MapPickerItem result = await navigatorMapPicker(context);
        mainLocationController.text = result.formattedAddress ?? '';
        mainLocation = LatLng(
          result.geometry?.location?.lat ?? 0.0,
          result.geometry?.location?.lng ?? 0.0,
        );
        print(result.geometry?.location);
      },
    );
  }

  districtTextField() {
    return StreamDataStateWidget<List<DistrictItem>>(
      stream: districtsStream,
      builder: (context, snapshot) {
        return BottomSheetTextFieldRectangle(
          isMultiChoice: true,
          title: strings.favorite_housing_locations,
          hintText: strings.favorite_housing_locations,

          controller: districtController,

          isScrollControlled: true,
          setSearch: false,
          searchHint: strings.search_project_name,
          items:
              snapshot
                  .map(
                    (e) => Item(
                      index: int.parse(e.id.toString()),
                      value: e.name ?? '',
                    ),
                  )
                  .toList(),

           onMultiSelectItem: (items) async {
            print(items.length);
            preferredDistrictIds = items.map((e) => e.id ?? 0).toList();
          },
        );
      },
    );
  }
}
