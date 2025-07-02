import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../../../presentationUser/resources/constants.dart';
import '../../../../shared/components/index.dart';
import '../../../../shared/models/common_list_item.dart';

class UserRequestTermsBottomSheet extends BaseStatelessWidget {
  final List<CommonListItem> data;
  final Function()? onAccept;

  UserRequestTermsBottomSheet({super.key, required this.data, this.onAccept});

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<bool> isAcceptStream = StreamStateInitial();
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          DecoratedBox(
            decoration: Decorations.boxDecorationBorder(radius: 0, color: Colors.transparent),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children:
                    data
                        .map(
                          (item) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: kTextRegular.copyWith(
                                  fontSize: 14,
                                  color: kGray_41,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${item.name ?? ''}',
                                  style: kTextRegular.copyWith(
                                    fontSize: 14,
                                    color: kGray_41,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
          CheckBoxTermsAndConditions(
            onChanged: (value) {
              isAcceptStream.setData(value ?? false);
            },
          ),
          StreamBuilder<bool>(
            stream: isAcceptStream.stream,
            builder: (context, snapshot) {
              return RowButtons(
                margin: EdgeInsets.symmetric(vertical: 18),
                textSaveButton: strings.confirm_button,
                textCancelButton: strings.cancel,
                onSave:
                    snapshot.data == true
                        ? () {
                          onAccept?.call();
                        }
                        : null,
                onCancel: () => Navigator.pop(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
