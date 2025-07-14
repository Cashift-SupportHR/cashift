import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/resume/city_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

class CityPickerWidget extends BaseStatelessWidget {
  final List<CityItem> cities;
  final Function(CityItem city) onSelectCity;
  StreamState<List<CityItem>> searchStream = StreamStateInitial();

  CityPickerWidget({Key? key, required this.cities, required this.onSelectCity})
      : super(key: key);

  findCityByName(String cityName){
    final filter = cities.where((element) => element.nameEn?.toLowerCase().contains(cityName.toLowerCase())==true
        || element.nameAr?.contains(cityName)==true).toList() ;
    searchStream.setData(filter);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchWidget(onChange: (String text) {
          findCityByName(text);
        }, hint: strings.find_your_city),
        Expanded(
          child: StreamBuilder<List<CityItem>>(
            stream: searchStream.stream,
            initialData: cities,
            builder: (context, snapshot) {
              final data = snapshot.requireData ;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (_, position) {
                    final item = data[position];

                    return Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              onSelectCity(item);
                                Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              alignment: AlignmentDirectional
                                  .centerStart, // <-- had to set alignment
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.zero, // <-- had to set padding to zero
                              ),
                            ),
                            child: Text(
                              item.toLocal(isRtl()),
                              textAlign: TextAlign.start,
                              style: kTextRegular.copyWith(
                                  fontSize: 12, decoration: TextDecoration.none),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: kSilverThree,
                          )
                        ],
                      ),
                    );
                  });
            }
          ),
        ),
      ],
    );
  }
}
