import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flash/flash.dart';

class Utils {
  static Future<void> launchAppUrl(String url) async {
    // if (!await launchUrl(Uri.parse(url))) {
    //   throw Exception('Could not launch $url');
    // }
  }

  static Future<List<File>?> pickImagesFromGallery() async {
    try {
      // Request storage permission
      PermissionStatus status = await Permission.storage.request();

      if (status.isGranted) {
        final ImagePicker _picker = ImagePicker();
        final List<XFile>? images = await _picker.pickMultiImage();

        if (images != null && images.isNotEmpty) {
          return images.map((xfile) => File(xfile.path)).toList();
        } else {
          return null;
        }
      } else {
        print("Storage permission denied");
        return null;
      }
    } catch (e) {
      print("Error picking images: $e");
      return null;
    }
  }

  static Future<File?> pickSingleImageFromGallery() async {
    try {
      // Request storage permission
      PermissionStatus status = await Permission.storage.request();

      if (status.isGranted) {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          return File(image.path);
        } else {
          return null;
        }
      } else {
        print("Storage permission denied");
        return null;
      }
    } catch (e) {
      print("Error picking image: $e");
      return null;
    }
  }

  /// ask for location access

  static Future<bool> requestLocationPermission() async {
    try {
      PermissionStatus status = await Permission.location.request();

      if (status.isGranted) {
        print("Location permission granted");
        return true;
      } else if (status.isDenied) {
        print("Location permission denied");
        return false;
      } else if (status.isPermanentlyDenied) {
        print(
            "Location permission permanently denied. Please enable it from settings.");
        openAppSettings();
        return false;
      } else if (status.isRestricted) {
        print("Location permission restricted");
        return false;
      } else {
        print("Location permission status: $status");
        return false;
      }
    } catch (e) {
      print("Error requesting location permission: $e");
      return false;
    }
  }
}

class FlashUtils {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get _context => navigatorKey.currentContext;

  static void showSuccessMessage({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (_context == null) return;
    _showFlashBar(
      message: message,
      icon: Icons.check_circle,
      backgroundColor: Colors.green,
      duration: duration,
    );
  }

  static void showErrorMessage({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (_context == null) return;
    _showFlashBar(
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      duration: duration,
    );
  }

  static void showWarningMessage({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (_context == null) return;
    _showFlashBar(
      message: message,
      icon: Icons.warning,
      backgroundColor: Colors.orange,
      duration: duration,
    );
  }

  static void showInfoMessage({
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (_context == null) return;
    _showFlashBar(
      message: message,
      icon: Icons.info,
      backgroundColor: Colors.blue,
      duration: duration,
    );
  }

  static void _showFlashBar({
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Duration duration,
  }) {
    showFlash(
      context: _context!,
      duration: duration,
      builder: (_, controller) {
        return FlashBar(
          controller: controller,
          position: FlashPosition.top,
          backgroundColor: backgroundColor,
          dismissDirections: const [FlashDismissDirection.startToEnd],
          forwardAnimationCurve: Curves.easeInOut,
          reverseAnimationCurve: Curves.easeInOut,
          content: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
