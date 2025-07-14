

import 'dart:convert';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';
import 'package:shiftapp/presentation/adminFeatures/vehicles/data/models/vehicle_event_picture_prams.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/files_preview/pages/files_preview_screen.dart';
import 'package:shiftapp/common/components/index.dart';
import '../../../domain/entities/vehicleTraking.dart';
import '../bloc/vehicles_tracking_cubit.dart';

class VehicleEventPicturePage
    extends BaseBlocWidget<Initialized<String>, VehiclesTrackingCubit> {
  final VehicleEventEntity data;

  VehicleEventPicturePage({super.key, required this.data});
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAttachments(VehicleEventPicturePrams(
        eventIndexCode: data.eventIndexCode ?? "",
        mobileVehicleIndexCode: data.mobilevehicleIndexCode ?? 0));
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<String> state) {
    Uint8List? imageBytes = base64Decode(state.data);

    return FilesPreviewScreen(
      data: [state.data],
      onDownload: (data) {
        bloc.downLoadFromUrl(data);
      },
      onShare: (data) => bloc.shareFile(data),
    );
  }
  @override
  void buildListener(BuildContext context, state) async {
    super.buildListener(context, state);
    if (state is SuccessStateListener<List<XFile>>) {
      await Share.shareXFiles(
        state.data ?? [],
      );
    }
  }
}
