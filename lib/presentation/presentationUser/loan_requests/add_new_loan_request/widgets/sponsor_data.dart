import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../common/data/models/wallet/name_by_id_number.dart';
import '../../../../../common/domain/validators/idnumber_validation.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../../common/components/text_field/build_text_field_item.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/error_handler_widget.dart';
import '../../../../../common/components/image_builder.dart';
import '../../../../../common/components/texts/row_rich_texts.dart';
import '../../../appliedoffers/pages/qrcode_screen.dart';
import '../../../common/common_state.dart';
import '../../../resources/colors.dart';

class SponsorData extends BaseStatelessWidget {
  final Function(String) fetchIdNumber;
  final StreamStateInitial<NameByIdNumber?> nameByIdNumberStream;
  SponsorData({Key? key, required this.fetchIdNumber, required this.nameByIdNumberStream, }) : super(key: key);

  final TextEditingController nationalIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    NameByIdNumber? selectedAccount;
    return Container(
      decoration: Decorations.boxDecorationBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.sponsor_data,
            style: kTextBold.copyWith(fontSize: 16,  color:  kBlack.withOpacity(0.76)),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder<NameByIdNumber?>(
                  stream: nameByIdNumberStream.stream,
                  builder: (context, snapshot) {
                    //snapshot.error != null ? nationalIdController.clear() : null;
                    return BuildTextFieldItem(
                      title: strings.sponsor_id_number,
                      titleStyle: kTextMedium.copyWith(fontSize: 12, color: kGreen_2),
                      controller: nationalIdController,
                      onChanged: (text) {
                        if (IdNumberValidator(AppUtils.replaceArabicNumber(text))
                            .isValid()) {
                          print('valid id number');
                          selectedAccount = null;
                          FocusScope.of(context).unfocus();
                          fetchIdNumber(text);
                        }
                      },
                      validator: (value) {
                        if (!IdNumberValidator(
                            AppUtils.replaceArabicNumber(value ?? ''))
                            .isValid()) {

                          return strings.invalid_id_number;
                        }
                        return null;
                      },
                    );
                  }
                ),
              ),
              Container(
                decoration: Decorations.boxDecorationBorder(radius: 3),
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                margin: const EdgeInsetsDirectional.only(start: 10, bottom: 2),
                child: InkWell(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                        context, Routes.qrScanner);
                    //   final result = QrCode('1006985566');
                    if (result is QrCode) {
                      nationalIdController.text = result.code;
                      if (IdNumberValidator(
                          AppUtils.replaceArabicNumber(result.code))
                          .isValid()) {
                        print('valid id number');
                        fetchIdNumber(nationalIdController.text);
                      }
                    }
                  },
                  child: kLoadSvgInCirclePath(AppIcons.qrCodeSponsor,
                      height: 25, width: 25),
                ),
              ),
            ],
          ),
          StreamBuilder<NameByIdNumber?>(
              stream: nameByIdNumberStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  nationalIdController.text = '';
                  return ErrorPlaceHolderWidget(
                    exception: snapshot.error,
                    height: 150,
                    image: SvgPicture.asset(
                      'images/place_holder.svg',
                      height: 40,
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return const SizedBox();
                }
                selectedAccount = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CustomRichText(
                      title: strings.sponsor_name,
                      value: snapshot.data?.name ?? '',
                    ),
                    _CustomRichText(
                      title: strings.sponsor_mobile  + '  ',
                      value: snapshot.data?.phoneNumber ?? '',
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}


class _CustomRichText extends StatelessWidget {
  final String title;
  final String value;
  final EdgeInsetsGeometry? padding;
  const _CustomRichText({Key? key, required this.title, required this.value, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomRichText(
      title: title,
      subTitle: value,
      padding: padding ?? const EdgeInsetsDirectional.only(start: 5),
      titleStyle: kTextBold.copyWith(fontSize: 14, color: kYellow_00),
      subTitleStyle: kTextSemiBold.copyWith(fontSize: 18, color: kGreen_2),
    );
  }
}

