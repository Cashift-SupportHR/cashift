import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../resources/colors.dart';
import '../../../../../../resources/constants.dart';

class ShowImagesWidget extends BaseStatelessWidget {

 String  image;
  ShowImagesWidget({required this.image});
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextMedium.copyWith(color: kGray_79, fontSize: 12);

    return  Row(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(strings.images + ": ", style: titleStyle),
       SizedBox(width: 10),
       Container(
         clipBehavior: Clip.antiAlias,
         decoration: Decorations.boxDecorationShaded(radius: 5),
         child:
         image.contains(".pdf")
             ? Icon(Icons.picture_as_pdf_outlined, color: kWhite, size: 40)
             : kBuildImage(
           image,
           border: 0,
           height: 36,
           width: 50,
           borderRadius: 0,
         ),
       ),
     ],
   );
  }
}
