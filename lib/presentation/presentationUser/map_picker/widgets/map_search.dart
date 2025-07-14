import 'package:flutter/material.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import 'map_prediction.dart';

///  Created by harbey on 9/12/2023.
class MapSearch extends BaseStatelessWidget {
  final Function(String) onSearch;
  final GestureTapCallback? onTapTextFieldSearch;
  final GestureTapCallback? onClearTextFieldSearch;
  final StreamStateInitial<List<MapPrediction>?> predictionsSearchStream;
  Function(MapPrediction) onSelectPlace;
  TextEditingController? searchController;

  MapSearch(
      {Key? key,
      required this.onSearch,
      this.onTapTextFieldSearch,
      this.onClearTextFieldSearch,
      required this.predictionsSearchStream,
      required this.onSelectPlace, this.searchController,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    searchController = searchController ?? TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.all(Radius.circular(27)),
            child: TextFormField(
              style: kTextMedium.copyWith(fontSize: 16),
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  onSearch(value);
                }
              },
              onTap: onTapTextFieldSearch,
              decoration: kSearchDecoration.copyWith(
                  prefixIcon: const Icon(Icons.search),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(''),
                      InkWell(
                        child: Icon(Icons.clear),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          onClearTextFieldSearch!();
                          searchController?.clear();
                          predictionsSearchStream.setData([]);
                        },
                      ),
                    ],
                  ),
                  hintText: strings.search_here,
                  hintStyle: kTextRegular.copyWith(
                      fontSize: 10, color: kBattleShipGrey)),
            ),
          ),
          StreamBuilder<List<MapPrediction>?>(
              stream: predictionsSearchStream.stream,
              builder: (context, snapshot) {
                print('onStreamBuilder ${snapshot.hasData}');
                return (snapshot.data != null && snapshot.data!.isNotEmpty)
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: Decorations.decorationOnlyRadius(
                            radius: 15, color: kWhite),
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (con, pos) {
                              final item = snapshot.requireData![pos];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    searchController?.text = item.description!;
                                    predictionsSearchStream.setData([]);
                                    onSelectPlace(item);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        item.description.toString(),
                                        maxLines: 2,
                                      ),
                                      const Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Container();
              })
        ],
      ),
    );
  }
}
