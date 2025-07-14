
import 'package:injectable/injectable.dart';

import '../../../../main_index.dart';
import '../../datasources/remote/api/notificationOffers/notification_offers_api_provider.dart';
import '../../models/notification_offers/notification_offer_params.dart';

@Injectable()
class NotificationOffersRepository {

  final NotificationOffersAPI _api;

  NotificationOffersRepository(this._api);

  Future<List<JobOfferDto>> fetchNotificationOffers(NotificationOfferParams params) async {
    final response = await _api.fetchNotificationOffers(params);
    return response.payload ?? [];
  }



}
