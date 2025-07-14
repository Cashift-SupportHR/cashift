import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart'; // for ascii.decode

class ImageCacheUtil {
  static const String defaultKey = 'UserFace';

  /// Extracts the image extension from base64 header (if available)
  static String? _detectExtensionFromBase64(String base64String) {
    final headerRegex = RegExp(r'data:image/(\w+);base64,');
    final match = headerRegex.firstMatch(base64String);
    return match != null ? match.group(1) : null;
  }

  /// Strips "data:image/...;base64," header if present
  static String _sanitizeBase64(String base64String) {
    if (base64String.contains(',')) {
      return base64String.split(',')[1];
    }
    return base64String;
  }

  /// Guesses extension based on magic bytes
  static String _guessFormat(Uint8List bytes) {
    if (bytes.length < 12) return 'jpg';
    if (bytes[0] == 0x89 && bytes[1] == 0x50) return 'png'; // PNG
    if (bytes[0] == 0xFF && bytes[1] == 0xD8) return 'jpg'; // JPEG
    if (ascii.decode(bytes.sublist(0, 4)) == 'RIFF') return 'webp'; // WEBP
    return 'jpg'; // fallback
  }

  /// Saves or updates the image to disk and returns the full file path.
  static Future<String> saveOrUpdateBase64Image(
      String base64String, {
        String fileKey = defaultKey,
      }) async {
    try {
      final cleanedBase64 = _sanitizeBase64(base64String);
      final bytes = base64Decode(cleanedBase64);
      final extension = _detectExtensionFromBase64(base64String) ?? _guessFormat(bytes);
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileKey.$extension');

      await file.writeAsBytes(bytes, flush: true);
      return file.path;
    } catch (e) {
      debugPrint('Error saving image: $e');
      rethrow;
    }
  }

  /// Retrieves the cached image file if it exists.
  static Future<File?> getCachedImageFile({String fileKey = defaultKey}) async {
    final dir = await getApplicationDocumentsDirectory();
    final extensions = ['png', 'jpg', 'jpeg', 'webp'];

    for (final ext in extensions) {
      final file = File('${dir.path}/$fileKey.$ext');
      if (await file.exists()) return file;
    }
    return null;
  }

  /// Returns an Image widget from the cache if it exists, otherwise a placeholder.
  static Future<Widget> getCachedImageWidget({
    String fileKey = defaultKey,
    Widget? placeholder,
    BoxFit fit = BoxFit.cover,
  }) async {
    final file = await getCachedImageFile(fileKey: fileKey);
    if (file != null) {
      return Image.file(file, fit: fit);
    }
    return placeholder ?? const Icon(Icons.image_not_supported);
  }
  /// Reads the cached image file and returns it as a base64 string.
  /// Returns null if file does not exist.
  static Future<String?> getCachedImageAsBase64({String fileKey = defaultKey}) async {
    final file = await getCachedImageFile(fileKey: fileKey);
    if (file != null && await file.exists()) {
      final bytes = await file.readAsBytes();
      return base64Encode(bytes);
    }
    return null;
  }

  /// Deletes the cached image file if it exists.
  static Future<void> deleteCachedImage({String fileKey = defaultKey}) async {
    final file = await getCachedImageFile(fileKey: fileKey);
    if (file != null && await file.exists()) {
      await file.delete();
    }
  }

  /// Checks if a cached image file exists.
  /// Returns true if found, false otherwise.
  static Future<bool> isImageCached({String fileKey = defaultKey}) async {
    final file = await getCachedImageFile(fileKey: fileKey);
    return file != null && await file.exists();
  }

}
