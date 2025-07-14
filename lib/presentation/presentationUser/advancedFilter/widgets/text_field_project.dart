import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/utils/app_icons.dart';
import '../../../../common/domain/entities/advancedFilter/index.dart';
import '../../../../common/domain/entities/resume/index.dart';
 import '../../../shared/components/base_stateless_widget.dart';
import '../../../../common/components/bottom_sheet/list_picker_widget.dart';
import '../../../shared/components/dropdown_filed.dart';
import '../../common/common_state.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class TextFieldProjectPicker extends BaseStatelessWidget {
  final int? initialProject;
  final StreamState<List<ProjectFiltter>> projects;
  final Function(Item) onSelectProject;

  TextFieldProjectPicker({Key? key, required this.onSelectProject, required this.projects, required this.initialProject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamState<bool> isDeleteStream = StreamStateInitial();
    TextEditingController _controller = TextEditingController();

    return StreamBuilder<List<ProjectFiltter>>(
        stream: projects.stream,
        builder: (context, snapshot) {
          if (initialProject != null && initialProject != 0) {
            isDeleteStream.setData(true);
            _controller.text = snapshot.data?.firstWhere((element) => element.id == initialProject).name ?? '';
          }

          return snapshot.data == null
              ? SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings.projects,
                        style: kTextSemiBold.copyWith(color: kPrimary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialTextField(
                          onTap: () async {
                            ListPickerWidget.showPicker(
                                context: context,
                                setSearch: true,
                                title: strings.select_project,
                                searchHint: strings.search,
                                items: snapshot.data!.map((e) => Item(index: e.id ?? 0, value: e.name ?? '', description: e.name ?? '')).toList(),
                                onSelectItem: (item) {
                                  onSelectProject(item);
                                  _controller.text = item.value;
                                  isDeleteStream.setData(true);
                                });
                          },
                          controller: _controller,
                          readOnly: true,
                          inputDecoration: kRequestTextFieldDecoration.copyWith(
                            hintText: strings.select_project,
                            hintStyle: kTextSemiBold.copyWith(fontSize: 16, color: kPrimary),
                            suffixIcon: StreamBuilder<bool>(
                              stream: isDeleteStream.stream,
                              builder: (context, snapshot) {
                                return InkWell(
                                  onTap: () {
                                    _controller.clear();
                                    onSelectProject(Item(index: 0, value: ''));
                                    isDeleteStream.setData(false);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(snapshot.data ?? false ? 12 : 16),
                                    child: kLoadSvgInCirclePath(
                                      (snapshot.data ?? false) ? AppIcons.removeCircle : AppIcons.arrow,
                                      color: kPrimary,

                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  ),
                );
        });
  }
}
