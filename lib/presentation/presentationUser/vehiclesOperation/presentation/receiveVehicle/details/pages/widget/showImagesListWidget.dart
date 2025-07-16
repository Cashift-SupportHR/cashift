import '../../../../../../../../core/services/routes.dart';
import '../../../../../../../shared/components/index.dart';
import '../../../../../../resources/colors.dart';

class ShowImagesListWidget extends BaseStatelessWidget {

  List<String>? images;
  ShowImagesListWidget({  this.images});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.filesPreviewPage,
          arguments: images,
        );
      },
      child: Container(
        height: 60,
        width: double.infinity,

        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            images?.length == 0 || images == null
                ? []
                : images!
                .map(
                  (e) => Container(
                alignment: Alignment.center,
                decoration: Decorations.decorationOnlyRadius(
                  radius: 2,
                ),
                height: 36,
                width: 50,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                clipBehavior: Clip.antiAlias,
                child:
                e.contains(".pdf")
                    ? Icon(
                  Icons.picture_as_pdf_outlined,
                  color: kWhite,
                  size: 40,
                )
                    : kBuildImage(
                  e,
                  border: 0,
                  height: 36,
                  width: 50,
                  borderRadius: 0,
                ),
              ),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}
