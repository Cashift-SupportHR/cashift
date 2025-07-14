 import 'package:shiftapp/presentation/presentationUser/profile/requests/presentation/pages/view/widgets/requests_user_item.dart';

import '../../../../../../../../common/components/index.dart';
import '../../../../domain/entities/RequestsUser.dart';

class RequestsUserScreen extends BaseStatelessWidget {
final   List<RequestsUser>  data ;

  RequestsUserScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) =>RequestsUserItem(data:data[index]) ,);
  }
}
