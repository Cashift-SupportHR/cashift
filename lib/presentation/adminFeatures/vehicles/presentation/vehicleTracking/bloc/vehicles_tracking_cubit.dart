import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiftapp/core/bloc/base_cubit.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../common/data/models/salary-definition-request/down_load_salary_definition.dart';
import '../../../../../presentationUser/attendance/facerecognation/index.dart';
import '../../../../../shared/components/files/files_manager.dart';
import '../../../data/models/vehicle_event_picture_prams.dart';
import '../../../data/models/vehicle_traking_details_prams.dart';
import '../../../domain/entities/vehicleTraking.dart';
import '../../../data/repositories/vehicles_repository.dart';

@injectable
class VehiclesTrackingCubit extends BaseCubit {
  final VehiclesRepository _repository;

  VehiclesTrackingCubit(
    this._repository,
  );

  // StreamStateInitial<VehicleTrackingEntity?> vehicleTracingDetailsStream =
  //     StreamStateInitial<VehicleTrackingEntity?>();
  void fetchVehicleTracingDetails(
      {required VehicleTrakingDetailsPrams prams}) async {
    if (prams.endShiftDateTime == null &&
        prams.startShiftDateTime == null &&
        prams.isVehicleHandover == false &&
        prams.vehicleHandoverId == 0) {
      emit(Initialized<VehicleTrackingEntity>(data: VehicleTrackingEntity()));
    } else {
      try {
        emit(LoadingState());

        final response = await _repository.fetchVehicleTracingDetails(prams);
        // vehicleTracingDetailsStream.setData(response);
        emit(Initialized<VehicleTrackingEntity>(data: response));
      } catch (e) {
        emit(Initialized<VehicleTrackingEntity>(data: VehicleTrackingEntity()));
        // vehicleTracingDetailsStream.setError(e);
        emit(FailureStateListener(e));
        rethrow;
      }
    }
  }

  List<ItemModel> items = [];

  fetchAttachments(VehicleEventPicturePrams prams) async {
    executeBuilder(() async {
      final prefs = await SharedPreferences.getInstance();
      final storedList = prefs.getStringList(_storageKey) ?? [];

      items = storedList.map((itemStr) {
        return ItemModel.fromJson(jsonDecode(itemStr));
      }).toList();

      String? image;

      final exists = items.any((item) => item.id == prams.eventIndexCode);
      if (!exists) {
        image = await _repository.fetchVehicleEventPicture(prams);
        if (image != "noCameraIndexCode") {
          items.add(
              ItemModel(id: prams.eventIndexCode ?? "", image: image ?? ""));
          final encodedList = items.map((e) => jsonEncode(e.toJson())).toList();
          await prefs.setStringList(_storageKey, encodedList);
        }
      } else {
        final found = items.firstWhere(
          (element) => element.id == prams.eventIndexCode,
          orElse: () => ItemModel(id: '', image: ''),
        );
        image = found.image ?? "";
      }
      return image;
    }, onSuccess: (value) async {
      emit(Initialized<String>(data: value));
    });
  }

  static const String _storageKey = 'items_list';
  Future<void> addItem(ItemModel newItem) async {
    final prefs = await SharedPreferences.getInstance();
    final currentList = List<ItemModel>.from(items);
    final exists = currentList.any((item) => item.id == newItem.id);
    if (!exists) {
      currentList.add(newItem);
      final encodedList =
          currentList.map((e) => jsonEncode(e.toJson())).toList();
      await prefs.setStringList(_storageKey, encodedList);
    } else {
      print('العنصر موجود مسبقًا');
    }
  }

  Future<void> shareFile(String base64Str) async {
    emit(LoadingStateListener());
    try {
      final bytes = base64Decode(base64Str);
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/shared_image.png').create();
      await file.writeAsBytes(bytes);

      await Share.shareXFiles([XFile(file.path)], text: 'Check this image!');

      emit(SuccessStateListener<List<XFile>>(data: [XFile(file.path)]));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  Future<void> downLoadFromUrl(String data) async {
    emit(LoadingStateListener());
    try {
      await FilesManager().saveFileFromBase64(
        DownLoadFileDto(fileAttachment: data, fileAttachmentType: 'jpg'),
      );
      emit(SuccessStateListener(
          data: Get.context!.getStrings().successfully_downloaded));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  Future<String> convertImageToBase64(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return base64Encode(bytes);
  }
}

class ItemModel {
  final String id;
  final String image;

  ItemModel({required this.id, required this.image});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ItemModel && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
