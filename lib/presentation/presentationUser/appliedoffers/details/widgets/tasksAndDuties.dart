import '../../../../../utils/app_icons.dart';
import '../../../../../common/components/index.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'decoration_container.dart';

class TasksAndDuties extends BaseStatelessWidget {
  final List<String> tasksAndDuties;
  TasksAndDuties({Key? key, required this.tasksAndDuties}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(tasksAndDuties.length, (index) {
        return Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Icon(Icons.check_circle,color: kOrange00,),

              SizedBox(
                width: 3,
              ),
              Expanded(
                child: Text(
                  tasksAndDuties[index],
                  style:
                  kTextRegular.copyWith(color: kPurplishGrey, fontSize: 12),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
