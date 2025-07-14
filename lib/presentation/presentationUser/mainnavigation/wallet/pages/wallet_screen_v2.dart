import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../common/domain/entities/wallet/withdraw_method.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../resources/colors.dart';
import '../balances/pages/balances_list_page.dart';
import '../bloc/initialize_wallet_state.dart';
import '../widgets/wallet_header.dart';
import '../withdraw/pages/withdraw_page.dart';
import 'package:shiftapp/presentation/shared/components/base_stateful_widget.dart';

class WalletScreenV2 extends StatefulWidget{
  final InitializeWalletState state;
  final Function onUpdate ;
  WalletScreenV2({Key? key, required this.state, required this.onUpdate}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WalletScreenV2State();
  }

}

class _WalletScreenV2State extends  BaseState<WalletScreenV2>
    with TickerProviderStateMixin {

  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNestedScrollView(context)
    );
  }

  Widget buildNestedScrollView(BuildContext context) {
    final _tabController = TabController(length:2, vsync: this);

    return NestedScrollView(
      controller: scrollController,
      floatHeaderSlivers: true,
      scrollBehavior: ScrollBehavior(),
      physics: AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
              child:  WalletHeaderWidget(
                state: widget. state,
                onSelectWithdrawMethod: (WithdrawMethod method) {
                  performWithdrawWithMethod(method, context);
                },
              ),),
          SliverToBoxAdapter(child: SizedBox(height:24 ,),)
        ];
      },
      body:  DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: Decorations.createRectangleDecorationOnlyTop(radius: 15),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: Decorations.createRectangleDecorationOnlyTop(),
                      child:   PreferredSize(
                          preferredSize: const Size.fromHeight(100.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: TabBar(
                              indicator: const BoxDecoration(
                                color: kPrimary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              unselectedLabelColor: kPrimary,
                              labelStyle: kTextSemiBold.copyWith(
                                color: kWhite,
                                fontSize: 12,
                              ),
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: <Widget>[
                                Tab(

                                    child: Text(
                                      strings.corporate_balances,
                                      style: const TextStyle(
                                        //  color: kFontDark,
                                        fontSize: 16,
                                        fontFamily: 'Regular',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                Tab(
                                    child: Text(
                                      strings.transaction_history,
                                      style: const TextStyle(
                                        //  color: kFontDark,
                                        fontSize: 16,
                                        fontFamily: 'Regular',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: <Widget>[
                        BalancesListPage(
                          completed: false, scrollController: scrollController, onUpdate:widget.onUpdate,
                        ),
                        BalancesListPage(
                          completed: true, scrollController: scrollController, onUpdate:widget.onUpdate,
                        ),
                      ]),
                    )
                  ]),
            ),
          ))/*TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: tabs.map((e) => e.page).toList())*/,
    );
  }


  void performWithdrawWithMethod(WithdrawMethod method, BuildContext context) async{
    print('performWithdrawWithMethod');
   final result  =  await WithdrawPage.push(
        context: context,
        args: WithdrawPageArgs(withDrawByMethod: true, method: method));
   if(result==true){
     widget.onUpdate();
     setState(() {
     });
   }
  }

}

