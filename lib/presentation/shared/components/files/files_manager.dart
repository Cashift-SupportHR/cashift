import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/data/models/salary-definition-request/index.dart';

class FilesManager{

  saveFileFromBase64(DownLoadFileDto response) async {
    // print('file data: ${response.toJson()}');
    try {
      requestPermission();

      Uint8List bytes = base64.decode(response.fileAttachment ?? '');
      String fileName = response.fileName ?? '${DateTime.now().millisecondsSinceEpoch}';
      final data = await FileSaver.instance.saveAs(name: fileName,  bytes: bytes, ext: response.fileAttachmentType ?? '',  mimeType: MimeType.other);
      log(data.toString());

    } on Exception catch (e) {
      print('base64Strings error: $e');
    }
  }

  saveFileFromFile(String filePath) async {
    // print('file data: ${filePath}');
    // print('file data: ${filePath.split('.').last}');
    try {
      requestPermission();

      Uint8List bytes = File(filePath).readAsBytesSync();
      final data = await FileSaver.instance.saveAs(name: filePath.split('/').last,  bytes: bytes, ext: filePath.split('.').last,  mimeType: MimeType.other);
      log(data.toString());

    } catch (e) {
      print('base64Strings error: $e');
      rethrow;
    }
  }



  requestPermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
      print('requestPermission: ${await Permission.storage.status}');
    }else{
      print('requestPermission: ${await Permission.storage.status}');
    }
  }
  TargetPlatform? platform;
  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        _checkPermission();
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }
  Future<void> _prepareSaveDir() async {
    _checkPermission();
    String _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath ?? '');
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    _checkPermission();
    if (Platform.isAndroid) {
      String dir = (await getApplicationDocumentsDirectory()).path;
      return '$dir/';
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  Future<String> createFileFromBase64(DownLoadFileDto data) async {
    _checkPermission();
    _prepareSaveDir();
    try {
      Uint8List bytes = base64.decode(data.fileAttachment ?? '');
      String path  = (await _findLocalPath())!;
      File file = File(
          "${path}" + "${data.fileName}" + DateTime.now().millisecondsSinceEpoch.toString() + ".${data.fileAttachmentType}");
      print('file path: ${file.path}');

      await file.writeAsBytes(bytes);
      return file.path;
    }  catch (e) {
      print('error: $e');
      throw e;
    }
  }

  static Future<String> downloadFileFromUrl(imageUrl) async {
    bool is64 = !imageUrl.startsWith('http');
    if (is64) {
      // convert to from base64 to file
      Uint8List bytes = base64.decode(imageUrl);
      final appDirectory = await getApplicationDocumentsDirectory();
      String fileName = 'downloaded_image_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${appDirectory.path}/$fileName');
      await file.writeAsBytes(bytes);
      return file.path;
    } else{
      final response = await http.get(Uri.parse(imageUrl));
      final appDirectory = await getApplicationDocumentsDirectory();
      String fileName = imageUrl.split('/').last;
      // check if the file name is too long and truncate it
      fileName = fileName.length > 255 ? fileName.substring(0, 255) : fileName;
      final file = File('${appDirectory.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
      return file.path;
    }
  }
}