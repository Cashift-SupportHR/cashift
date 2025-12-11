import '../../../../../../../domain/entities/shared/date_formatter.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../../shared/components/text_field/build_text_field_item.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../data/models/index.dart';

class NearestWarehouseScreen extends BaseStatelessWidget {
  final Function( ) onNext;

  NearestWarehouseScreen( {required this.onNext,  });
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

        },
        onCancel: () {
         },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
         child: Column(),
        ),
      ),
    );
  }


}
