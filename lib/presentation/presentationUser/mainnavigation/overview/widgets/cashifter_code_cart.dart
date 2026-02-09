import '../../../../../core/services/routes.dart' show Routes;
import '../../../../../data/models/account/cashifter_code_dto.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../shared/components/index.dart';
import '../../../common/common_state.dart';
import '../../../mana_delivery/domain/entities/index.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class CashifterCodeWidget extends BaseStatelessWidget {
  StreamState<CashifterCodeDto> cashifterCodeStream;
  CashifterCodeWidget({super.key, required this.cashifterCodeStream});

  @override
  Widget build(BuildContext context) {
    return StreamStateWidgetV2<CashifterCodeDto>(
      stream: cashifterCodeStream,
      builder: (context, snapshot) {
        return Container(
          clipBehavior: Clip.antiAlias,

          margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kPrimary),

            image: DecorationImage(
              image: AssetImage(AppImages.bgMana),
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  snapshot.header ?? "",
                  style: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
                ),
                SizedBox(height: 10),
                Text(
                  snapshot.code ?? "",
                  style: kTextMedium.copyWith(fontSize: 16, color: kOrange00),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      snapshot.description ?? "",
                      style: kTextRegular.copyWith(fontSize: 14),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        AppUtils.shareText(
                          context,
                          snapshot.code ?? "",
                          title: snapshot.header ?? "",
                          subject: snapshot.description ?? "",
                        );
                      },
                      child: kSvgIcon(image: AppIcons.shareOutline, size: 20),
                    ),
                    SizedBox(width: 5),
                    // InkWell(
                    //   onTap: () {},
                    //   child: kSvgIcon(image: AppIcons.copy, size: 20),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
