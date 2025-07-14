import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:shiftapp/presentation/presentationUser/locationservice/locationservice.dart';

import '../../../presentation/presentationUser/common/common_state.dart';
import '../../../presentation/presentationUser/resources/colors.dart';
import '../../../presentation/presentationUser/resources/constants.dart';
import '../base/base_stateless_widget.dart';
import 'map_widget.dart';

///  Created by harbey on 8/16/2023.
class CurrentLocationRealtimeMap extends BaseStatelessWidget {
  final double heightLocation;
  final bool isActive;
  final EdgeInsetsGeometry? padding;
  final Function(LocationData location) onGetLocation;
  final StreamStateInitial<LocationData?> ? locationStream ;

  CurrentLocationRealtimeMap(
      {Key? key,
      this.heightLocation = 200,
      required this.onGetLocation,
      this.padding,
        this.locationStream ,
      this.isActive = true})
      : super(key: key);

  late StreamStateInitial<LocationData?>   _locationStream ;

  @override
  Widget build(BuildContext context) {
    _locationStream = locationStream??StreamStateInitial<LocationData?>();

   if(locationStream==null) fetchCurrentLocation(context);
    return Container(
      height: heightLocation,
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.current_location,
            style: kTextBold.copyWith(
                fontSize: 14, color: isActive ? kPrimary : kGray_92),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                strings.location_accuracy,
                style: kTextRegular.copyWith(
                    fontSize: 14, color: isActive ? kBlack : kGray_AC),
              ),
              StreamBuilder<LocationData?>(
                  stream: _locationStream.stream,
                  builder: (context, snapshot) {
                    print(
                        'snapshot.data accuracy ${snapshot.data} ${snapshot.data?.accuracy}');
                    return Center(
                      key: UniqueKey(),
                      child: snapshot.data?.accuracy == null
                          ? CircularProgressIndicator(padding: EdgeInsets.all(5),
                        constraints: const BoxConstraints(
                            minHeight: 20, minWidth: 20, maxHeight: 20, maxWidth: 20),
                        color: kPrimary,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(kPrimary),
                      )
                          :
                      Text(
                        '${snapshot.data?.accuracy?.round()??'UnKnown'} ${strings.metre}' ??
                            '',
                        style: kTextRegular.copyWith(
                            fontSize: 14, color: isActive ? kBlack : kGray_AC),
                      ),
                    );
                  }),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Stack(
              children: [
                StreamBuilder<LocationData?>(
                    stream: _locationStream.stream,
                    builder: (context, snapshot) {
                      return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              child: StaticMapWidget(
                                key: UniqueKey(),
                                location: LatLng(snapshot.data?.latitude ?? 24.0,
                                    snapshot.data?.longitude ?? 46.0),
                                title: '',
                                isNormalIcon: true,
                                enableMyLocation: true,
                                zoom: 12,
                              ),
                            );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchCurrentLocation(BuildContext context) async {
    try {
      final stream = await LocationService.startPositionStream();
      stream.listen((event) {
        print('fetchCurrentLocation listen ${event.latitude}');

        final  position = LocationData.fromMap({'latitude':event.latitude,'longitude':event.longitude,'isMock':event.isMocked});
        _locationStream.setData(position);
        onGetLocation(position);
      });
    } catch (e) {
      LocationService.handleFetchLocationException(e, context);
    }

  }
}
