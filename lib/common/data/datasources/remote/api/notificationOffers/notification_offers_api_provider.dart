
import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/models/api_response.dart';
import 'package:shiftapp/common/data/models/notification_offers/index.dart';
import 'package:shiftapp/main_index.dart';
import '../../../../../network/source/user_endpoint.dart';

@Injectable()
 class NotificationOffersAPI {
  final UserEndpoint api;

  NotificationOffersAPI(this.api);

  Future<ApiResponse<List<JobOfferDto>>> fetchNotificationOffers(NotificationOfferParams params) async {
    return await api.fetchNotificationOffers(params);
  }
}
