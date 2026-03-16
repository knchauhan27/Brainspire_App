// core/services/device_fingerprint_service.dart

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceFingerprintService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  Future<String> getFingerprint() async {
    final raw = await _buildRawString();
    final bytes = utf8.encode(raw);
    return sha256.convert(bytes).toString();
  }

  Future<String> getDeviceLabel() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      return '${info.brand} ${info.model} · Android ${info.version.release}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return '${info.name} · iOS ${info.systemVersion}';
    }
    return 'Unknown device';
  }

  Future<String> _buildRawString() async {
    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;
      // Three components: brand + model + android ID
      return '${info.brand}|${info.model}|${info.id}';
    } else if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      return '${info.name}|${info.model}|${info.identifierForVendor}';
    }
    throw UnsupportedError('Fingerprint: unsupported platform');
  }
}
