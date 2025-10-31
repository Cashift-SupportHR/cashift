import '../../../../../../shared/components/index.dart';
import '../../../../../bail_requests/widgets/bail_terms_and_conditions.dart';
import '../../../../../common/common_state.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../domain/entities/index.dart';
import '../widget/terms_and_conditions_logistics_item.dart';

class TermsAndConditionsLogisticsScreen extends BaseStatelessWidget {
  final Function(bool termsAccepted) onNext;
  final Function() onPrevious;
  List<CarTermsAndConditionsEntity> data;
  TermsAndConditionsLogisticsScreen({
    Key? key,

    required this.onNext,
    required this.onPrevious,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: StreamBuilder<bool>(
        stream: isApprovalStream.stream,
        builder: (context, snapshot) {
          return RowButtons(
            textSaveButton:strings.apply_now,
            textCancelButton: strings.previous,
            onSave: () {
              if (snapshot.hasData) {
                onNext(snapshot.data!);
              }else {

                showErrorDialog(strings.terms_and_conditions_accept, context);
              }
            },
            onCancel: () {
              onPrevious();
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.terms_and_conditions,
              style: kTextBold.copyWith(fontSize: 14, color: kGreen_144)
            ),
            SizedBox(height: 15),

            Expanded(
              child: ListView.separated(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return TermsAndConditionsLogisticsItem(data: data[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ),
            TermsAndConditionsCheckBox(
              onChecked: (value) {
                isApprovalStream.setData(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  StreamStateInitial<bool> isApprovalStream = StreamStateInitial();
}
