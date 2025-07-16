import '../../../../../../../../generated/assets.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../../shared/components/map/points_map_screen.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

class CustomExpansionTile extends BaseStatelessWidget {
  final String title;
  final String icon;
   final Widget child;
  final bool isShowBorder;
  StreamStateInitial<int?>?   countStream;
  void Function(bool)? onExpansionChanged;
  CustomExpansionTile({
    super.key,
    required this.title,
    required this.icon,
      this.countStream,
      this.onExpansionChanged,
    required this.child,
    this.isShowBorder = true,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(5),
      decoration: Decorations.shapeDecorationShadow(),
      child: ExpansionTile(
        title: Text(title, style: kTextMedium),
        leading: kLoadSvgInCirclePath(
          icon,
          height: 30,
          width: 30,
          color: Colors.black.withOpacity(.5),
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 10),
        trailing: StreamBuilder<int?>(
          stream: countStream?.stream,
          builder: (context, snapshot) {
            return SizedBox(
              width: (snapshot.data == null || snapshot.data == 0) ? 25 : 57,
              height: 40,
              child: Row(
                children: [
                  (snapshot.data == null || snapshot.data == 0)
                      ? SizedBox()
                      : SizedBox(
                        height: 40,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            kLoadSvgInCirclePath(
                              AppIcons.waring,
                              height: 30,
                              width: 30,
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFDADA),
                                radius: 8,
                                child: Text(
                                  "${snapshot.data ?? "0"}",
                                  style: kTextRegular.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ],
              ),
            );
          }
        ),
        childrenPadding: EdgeInsets.all(0),
        onExpansionChanged: onExpansionChanged,
        children: [
          Divider(color: kGreen_33.withOpacity(0.2)),
          isShowBorder
              ? Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: Decorations.boxDecorationBorder(
                  radius: 0,
                  borderColor: kGray_EE,
                ),
                child: child,
              )
              : child,
        ],
      ),
    );
  }
}
