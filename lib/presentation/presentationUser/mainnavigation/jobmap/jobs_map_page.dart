import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/bloc/job_offers_cubit.dart';

import 'package:shiftapp/common/components/error_handler_widget.dart';
import 'package:shiftapp/common/components/loading_widget.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/main_index.dart';
import '../../../../common/components/base/base_widget.dart';
import 'jobs_map_screen.dart';

class JobsMapPage extends BaseWidget {
  JobsMapPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final bloc = GetIt.instance.get<JobOffersCubit>();
    bloc.fetchOffers();
    return Scaffold(
        body: BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, state) {
        if (state is LoadingState) {
          return LoadingView();
        }

        if (state is ErrorState) {
          return ErrorPlaceHolderWidget(
            exception: state.error,
          );
        }
        if (state is Initialized<List<JobOfferDto>>) {
          return MapScreen(
            offers: state.data,
            onRefresh: () {
              bloc.fetchOffers();
            },
          );
        }
        return Container();
      },
    ));
  }
}
