import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/evulation/evaluation_item.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';

class EvaluationScreen extends BaseStatelessWidget {

  final List<EvaluationItem> evaluationItems ;
  final Function (List<EvaluationItem> item ) onSave;
  EvaluationScreen({required this.evaluationItems,required this.onSave});


  final Map<int,EvaluationItem> newEvaluation ={} ;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: body(context),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('images/rate.svg',height: 60,),
        SizedBox(
          height: 12,
        ),
        Text(
          strings.rate_title,
          style: kTextSemiBold.copyWith(fontSize: 24, color: kPurplishGrey),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          strings.rate_subtitle,
          style: kTextRegular.copyWith(fontSize: 13, color: kBrownishGreyTwo),
        )
      ],
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                header(),
                rateListWidget(context),
              ],
            ),
          ),
        ),
        footer()
      ],
    );
  }

  Widget rateListWidget(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.center,
        child: ListView.builder(
            itemCount: evaluationItems.length,
            controller: scrollController,
            shrinkWrap: true,
            itemBuilder:(context,position){
              final item = evaluationItems[position];
              newEvaluation[item.id] =  item ;
              return  rateItem(item, onRatingUpdate: (EvaluationItem rate) {
                newEvaluation[item.id] =  rate ;
              });
            })
    );
  }

  Widget saveButton() {
    return AppCupertinoButton(
      onPressed: () {
        onSave(newEvaluation.values.toList());
      },
      margin: EdgeInsets.only(top: 16),
      text: strings.save_button,
    );
  }

  Widget rateItem(EvaluationItem item ,{required Function (EvaluationItem rate,)onRatingUpdate}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16,top: 16, bottom: 16),
          child: Text(
            item.title,
            style: kTextRegular.copyWith(fontSize: 13, color: kBrownishGreyTwo),
          ),
        ),
        Center(
          child: RatingBar.builder(
            initialRating:  item.value.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            textDirection: TextDirection.ltr,
            itemCount: 5,
            glowRadius: 4,
            itemSize: 25,

            itemPadding: EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, _) => Image.asset('images/star_rate.png',scale: 0.8,color: kPrimary,),
            onRatingUpdate: (rating) {
              item.value = (rating*2).round() ;
              onRatingUpdate(item);
              print(rating);
            },
          ),
        ),
        Divider(thickness: 1,color: kGrey_C3,)
      ],
    );
  }

 Widget footer() {
    return Column(children: [
      MaterialTextField(
        onChanged: (text) {

        },
        inputDecoration: kTextFieldDecoration.copyWith(
            hintText: 'صف تجربتك (إختياري) ',

            hintStyle: kTextRegular.copyWith(fontSize: 14, color: kBrownishGreyTwo),
            alignLabelWithHint: true),
        maxLines: 2,
      ),
      SizedBox(height: 12,),
      saveButton(),
      SizedBox(height: 12,),

    ],);
  }
}
