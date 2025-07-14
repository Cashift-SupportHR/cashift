import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/pages/uniform_slides_screen.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:sizer/sizer.dart';

import '../../../../common/components/base/base_stateless_widget.dart';
import '../../resources/constants.dart';

class UniformJobList extends BaseStatelessWidget {
  final List<String> listJobUniForm;
  UniformJobList({Key? key, required this.listJobUniForm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return listJobUniForm.isEmpty ? const SizedBox() :
     Padding(
       padding: const EdgeInsets.symmetric(vertical: 10),
       child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           strings.official_wear,
           style: kTextSemiBold.copyWith(fontSize: 16.sp),
         ),
         const SizedBox(
           height: 8,
         ),

         SingleChildScrollView(
            scrollDirection: Axis.horizontal,
           child: Row(
             children: listJobUniForm.map((e) =>
                 InkWell(
                   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
                       UniformSlidesScreen(
                           initialIndex: listJobUniForm.indexOf(e),
                           listJobUniForm: listJobUniForm))),
                   child: Card(
                       margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: kBuildImage(e, size: 100)),
                 )
             ).toList(),
           ),
         ),
       ],
   ),
     );
  }
}
