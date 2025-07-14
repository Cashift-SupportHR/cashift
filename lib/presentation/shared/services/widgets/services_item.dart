import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/models/service/sub_category.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/check_face_recognation/page/check_face_recognatin_page.dart';

import '../../../../common/data/models/service/service_model.dart';
import '../../../../core/services/routes.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../components/base_stateless_widget.dart';
import '../../components/underline_widget.dart';

class ServicesItem extends BaseStatelessWidget {
  final List<ServiceModel> services;

  ServicesItem({
    Key? key,
    required this.services,
  }) : super(key: key);
  ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  services[i].name ?? "",
                  style: kTextMedium.copyWith(
                      color: const Color(0xff1E866F), fontSize: 18),
                ),
                const UnderlineWidget(),
                const SizedBox(
                  height: 10,
                ),
                // show two buttons in a row
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: services[i].subCategory!.length,
                    itemBuilder: (context, index) {
                      return serviceCatItemWidget(
                          context, services[i].subCategory![index]);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget serviceCatItemWidget(BuildContext context, SubCategory service) {
    return Container(
      height: 150,
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print('service code ${service.code}');

          if (service.code == null ||
              service.code!.isEmpty ||
              !Routes.routes.containsKey('/${service.code}')) {
            return;
          } else {
            print('service.code foyund');

            Navigator.pushNamed(context, '/${service.code}',
                arguments: service.name);
          }
        },
        child: uiServiceItem(service),
      ),
    );
  }

  uiServiceItem(SubCategory service) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 4,
            child: Image.network(
              service.logo ?? '',
              errorBuilder: (context, e, s) {
                return Icon(
                  Icons.image,
                  color: kGrey_EB,
                  size: 55,
                );
              },
            )),
        SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 2,
          child: Text(
            service.name ?? "",
            textAlign: TextAlign.center,
            style: kTextSemiBold.copyWith(
              fontSize: 18,
              color: kPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
