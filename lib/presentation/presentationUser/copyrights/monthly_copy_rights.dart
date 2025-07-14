import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shiftapp/common/domain/entities/terms/terms_item.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/collect_cash_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/copyrights/bloc/copy_rights_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';

import 'package:shiftapp/presentation/shared/components/error_handler_widget.dart';
import 'package:shiftapp/presentation/shared/components/loading_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';

import '../../shared/components/base_widget.dart';

class CopyRightsPage extends BaseWidget {
 
  @override
  Widget buildWidget(BuildContext context) {
    final bloc = GetIt.instance.get<CopyRightsBloc>();
     
    bloc.add(FetchTerms());

    return AppScaffold(
      body: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, state) {
            if (state is LoadingState) {
              return LoadingView();
            }
            if (state is Initialized<List<TermsItem>>) {
              return CopyRightsWidget(state.data);
            }

            if (state is ErrorState) {
              return ErrorPlaceHolderWidget(
                exception: state.error,
              );
            }
            return Center();
          }), title: strings.copy_rights_title,
    );
  }

}

class CopyRightsWidget extends BaseStatelessWidget{
  final List<TermsItem> terms ;

  CopyRightsWidget(this.terms); 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              elevation: 0,
              child: CopyRightListWidget(terms),
            ),
          ),
          CopyRightsCheck()
        ],
      ),
    );
  }
  
}
class CopyRightListWidget extends BaseStatelessWidget{
  final List<TermsItem> terms ;

  CopyRightListWidget(this.terms);

  @override
  Widget build(BuildContext context) {
   return Padding(
       padding: const EdgeInsets.only(top: 16.0),
       child: ListView.builder(
           shrinkWrap: true,
           itemCount: terms.length,
           itemBuilder: (con, index) {
             final item = terms[index];
             return  MaterialText(item.conditionName.toString(),
               startIcon: circleIcon(kPrimary,size: 6),
               mathWidth: true,
               margin: EdgeInsets.only(top: 16),
               startIconPadding: EdgeInsetsDirectional.only(end: 12),
               style: kTextLabel.copyWith(color: kPurplishGrey,fontSize: 13),);
           }));
  }
}

class CopyRightsCheck extends StatefulWidget {
  @override
  _CopyRightsState createState() {
    return _CopyRightsState();
  }
}

class _CopyRightsState extends State<CopyRightsCheck> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            checked = (!checked);
            setState(() {});
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 16, top: 16, bottom: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: kPrimaryDark, width: 2),
                ),
                width: 20,
                height: 20,
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.transparent),
                  child: Checkbox(
                    checkColor: kPrimaryDark,
                    activeColor: Colors.transparent,
                    value: checked,
                    tristate: false,
                    shape: CircleBorder(),
                    onChanged: (bool? value) {
                      checked = (value!);
                      setState(() {});
                    },
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:context.getStrings().accept_copy_rights_label,
                      style: kTextLabelFontDark.copyWith(fontSize: 14),
                    ),
                    TextSpan(text: ' '),
                    TextSpan(
                      text:context.getStrings().job_terms_and_conditions,
                      style: kTextLabelFontDark.copyWith(fontSize: 14,color: kPrimary),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),
        AppCupertinoButton(text: context.getStrings().confirm_button,
          onPressed: checked == true
              ? () {
            Navigator.pop(context, true);
          }
              : null,),
      ],
    );
  }
}
