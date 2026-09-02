// lib/unsupported_device_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnsupportedDeviceScreen extends StatelessWidget {
  const UnsupportedDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.security, size: 100, color: Colors.redAccent),
                const SizedBox(height: 24),
                const Text(
                  'Device Not Supported',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'For your security, this app cannot run on this device.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Exit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
