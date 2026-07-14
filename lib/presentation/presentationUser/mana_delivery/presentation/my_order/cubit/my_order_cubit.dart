import 'package:injectable/injectable.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/data/models/free_lance_info.dart';
 import 'package:shiftapp/presentation/adminFeatures/shared/data/repositories/today_opportunity_repository.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/data/models/my_order_prams.dart';
import '../../../../../../data/repositories/advancedFilter/advanced_filter_repository.dart';
import '../../../../../../domain/entities/advancedFilter/offers_filter_data.dart';
    import '../../../data/repositories/mana_delivery_repo.dart';
import '../../../domain/entities/my_order.dart';

@injectable
class MyOrderCubit extends BaseCubit {
  final ManaDeliverRepository repository;

  MyOrderCubit(this.repository);

  final employeeFreeLanceInfoStream = StreamStateInitial<FreeLanceInfo?>();

  int _page = -1;
  List<MyOrderItemEntity> myOrders = [];
  List<MyOrderItemEntity> allMyOrders = [];
  MyOrderPrams params = MyOrderPrams(page: 1, key: 'notcomplete', pageSize: 10);

  StreamStateInitial<List<MyOrderItemEntity>?> myOrderStream =
      StreamStateInitial();

  Future<void> fetchMyOrderPagination({
    bool isRefresh = false,
    required MyOrderPrams params,
  }) async {
    myOrders = [];
    try {
      if (isRefresh) {
        myOrderStream.setData(null);
        _page = 0;
        allMyOrders = [];
        params.page = _page;
      } else {
        _page++;
        params.page = _page;
      }

      myOrders = await fetchMyOrderData(params);
      allMyOrders.addAll(myOrders);
      myOrderStream.setData(allMyOrders);

    } on Exception catch (e) {
      myOrderStream.setError(e);
    }
  }

  Future<List<MyOrderItemEntity>> fetchMyOrderData(MyOrderPrams params) async {
    final result = await repository.fetchMyOrders(params);

    return result.results ?? [];
  }
}
