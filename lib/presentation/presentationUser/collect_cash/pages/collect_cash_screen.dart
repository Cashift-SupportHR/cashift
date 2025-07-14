import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:shiftapp/common/domain/entities/collect_cash/dues_item.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/bloc/collect_cash_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/collect_cash/pages/collect_cash_item.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/components/error_handler_widget.dart';
import 'package:shiftapp/common/components/loading_widget.dart';

class CollectCashScreen extends StatelessWidget{
  final bool active ;
  const CollectCashScreen({Key? key,required this.active}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectCashCubit bloc = GetIt.instance.get();
    bloc.fetchCollectedAndNonCollectedJobs(active);
    return RefreshIndicator(
      onRefresh: () {
         bloc.fetchCollectedAndNonCollectedJobs(active);
         return bloc.stream.firstWhere((element) => element is! LoadingState);
      },
      child: BlocBuilder(
          bloc: bloc,
          builder: (con,state){
            if(state is LoadingState){
              return LoadingView();
            }
            if(state is Initialized<List<DuesItem>>){
              return CollectCashListWidget(jobCashList: state.data,isActive : active ,onChangeStatus: (){
                bloc.fetchCollectedAndNonCollectedJobs(active);

                },);
            }
            if(state is ErrorState){

              return ErrorPlaceHolderWidget(exception: state.error,onClickReload: (){
                bloc.fetchCollectedAndNonCollectedJobs(active);
              },);
            }
            return Center();
          }),
    );
  }


}
class CollectCashListWidget extends StatelessWidget{
  final List<DuesItem> jobCashList;
  final Function onChangeStatus ;
  final bool isActive;
  const CollectCashListWidget({Key? key,required this.jobCashList ,required this.onChangeStatus, this.isActive = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: jobCashList.length,
          itemBuilder: (con,pos){
            final item = jobCashList[pos];
            return CollectCashItemWidget(jobCash: item, isActiv:isActive , onChangeStatus: onChangeStatus,);
          }),
    );
  }


}