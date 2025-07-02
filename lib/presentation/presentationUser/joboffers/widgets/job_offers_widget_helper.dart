import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shiftapp/config.dart';
import 'package:shiftapp/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/core/utils/app_utils.dart';

class JobOfferWidgetHelper {
  static void openMap(BuildContext context, JobOfferDto jobOffer) {
    AppUtils.launchMap(
        lat: jobOffer.latitude.toString(), long: jobOffer.longtude.toString());
  }

 static Future<String> createDynamicLink(String id) async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://cashift.page.link' , // 'https://reactnativefirebase.page.link'
      link: Uri.parse('https://cashift.page.link?offer=${id.toString()}'),
      androidParameters: const AndroidParameters(
        packageName: 'com.cashift',
        minimumVersion: 0,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.support.cashift',
        appStoreId: Config.AppStoreId,
        minimumVersion: '0',
      ),
    );

    Uri url;
    final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
    url = shortLink.shortUrl;
    return url.toString() ;
  }

  static share(String text){
    Share.share(text??'', subject: 'Look this offer is great');
  }
}
