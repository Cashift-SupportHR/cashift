import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';

import '../../../../../resources/constants.dart';
import '../nearest_warehouse_item.dart';

class NearestWarehouseScreen extends BaseStatelessWidget {
  final Function() onNext;

  NearestWarehouseScreen({required this.onNext});

  final _formKey = GlobalKey<FormState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppCupertinoButton(
          onPressed:(){
            onNext();
          } ,
          text: strings.receive_code,
          elevation: 0,
          backgroundColor:  kPrimary,
          radius: BorderRadius.circular(  5),
          padding: const EdgeInsets.symmetric(vertical: 11),
        ),
      ),
      body: Column(
        children: [
          Text(" 5 ${strings.number_of_nearest_warehouses}",style: kTextRegular.copyWith(
            fontSize: 14,
            color: kGreen_85,
          ),),
          Expanded(
            child: StatefulBuilder(
              builder: (context, setState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return NearestWarehouseItem(
                      index: index,
                      selectedIndex: selectedIndex,

                      onSelect: () {
                        setState(() => selectedIndex = index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
