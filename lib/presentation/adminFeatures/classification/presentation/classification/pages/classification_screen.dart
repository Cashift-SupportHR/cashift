import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';

import '../../../domain/entities/classification.dart';
import '../widgets/classfication_item.dart';

class ClassificationScreen extends BaseStatelessWidget {
  final Function() onRefresh;
  final Function(int id) onDeleteUser;
  ClassificationScreen({Key? key, required this.onRefresh, required this.type, required this.data, required this.onDeleteUser}) : super(key: key);
  List<Classification> data;
  int type;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBackground,
      child: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 6, bottom: 16, left: 16, right: 16),
        itemBuilder: (context, index) {
          return ClassficationItem(
            data: data[index],
            onRefresh: onRefresh,
            type: type,
            onDelete: onDeleteUser,
          );
        },
      ),
    );
  }
}
