import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../common/domain/entities/workerWorkPlaces/index.dart';
import 'my_focus_point_item.dart';
import 'my_focus_point_status.dart';

///  Created by harbey on 5/10/2023.
class MyFocusPointsList extends StatelessWidget {
  final List<WorkerWorkPlace> myGates;
  final Function(bool, int) onActionPerform;
  final void Function(int)? onIndexChanged;
  final StreamStateInitial<int>? indexStream;
  final SwiperController? controller;
  const MyFocusPointsList({Key? key, required this.myGates, required this.onActionPerform, this.onIndexChanged, this.indexStream, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyFocusPointsList build ${myGates.length}");
    return StreamBuilder<int>(
      stream: indexStream?.stream,
      builder: (context, snapshot) {
        return Swiper(
          itemCount: myGates.length,
          index: indexStream?.data ?? MyFocusPointStatus.getActiveStepper(myGates),
          itemWidth: double.infinity,
          duration: 1000,
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return MyFocusPointItem(
              gate: myGates[index] ,
              onActionPerform: (isStart){
                onActionPerform(isStart, myGates[index].id ?? 0);
              },

            );
          },
          viewportFraction: 0.95,
          scale: 1,
          autoplayDisableOnInteraction: true,
          layout: SwiperLayout.DEFAULT,
          onIndexChanged: onIndexChanged,
          controller: controller,
        );
      }
    );
  }
}
