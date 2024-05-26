import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_db_client/core/app_exception.dart';
import 'package:flutter_db_client/core/app_log.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart' as io;

abstract class DeviceInformation {
  String get appName;

  String get appVersion;

  String get buildNumber;

  String get packageName;

  String? get deviceId;

  String get os;

  String? get brand;

  String? get model;

  String? get deviceVersion;

  String? get sdk;

  bool get isPhysicalDevice;

  Map<String, String> toMap();
}

class AppDeviceInformation implements DeviceInformation {
  AppDeviceInformation._({
    required _DeviceInfo device,
    required PackageInfo package,
  })  : _device = device,
        _package = package;

  final PackageInfo _package;
  final _DeviceInfo _device;

  static Future<AppDeviceInformation> initialize({
    @visibleForTesting DevicePlatform? platformOverride,
  }) async {
    try {
      return AppDeviceInformation._(
        package: await PackageInfo.fromPlatform(),
        device: await _DeviceInfo.initialize(
          DeviceInfoPlugin(),
          platformOverride: platformOverride,
        ),
      );
    } catch (e, st) {
      AppLog.e(e, st);
      throw const AppException(
        'Unable to fetch device and package information',
      );
    }
  }

  @override
  String get appName => _package.appName;

  @override
  String get appVersion => _package.version;

  @override
  String get buildNumber => _package.buildNumber;

  @override
  String get packageName => _package.packageName;

  @override
  String? get deviceId => _device.id;

  @override
  String get os => _device.os;

  @override
  String? get brand => _device.brand;

  @override
  String? get model => _device.model;

  @override
  String? get deviceVersion => _device.version;

  @override
  String? get sdk => _device.sdk;

  @override
  bool get isPhysicalDevice => _device.isPhysicalDevice;

  @override
  Map<String, String> toMap() => <String, String>{
        'appName': appName,
        'appVersion': appVersion,
        'buildNumber': buildNumber,
        'isPhysicalDevice': '$isPhysicalDevice',
        'packageName': packageName,
        'os': os,
        if (deviceId != null) 'deviceId': deviceId!,
        if (brand != null) 'brand': brand!,
        if (model != null) 'model': model!,
        if (deviceVersion != null) 'deviceVersion': deviceVersion!,
        if (sdk != null) 'sdk': sdk!,
      };
}

class _DeviceInfo {
  const _DeviceInfo({
    required this.id,
    required this.isPhysicalDevice,
    required this.os,
    required this.brand,
    required this.model,
    required this.version,
    required this.sdk,
  });

  static Future<_DeviceInfo> initialize(
    DeviceInfoPlugin info, {
    DevicePlatform? platformOverride,
  }) async {
    if (identical(0, 0.0) || platformOverride == DevicePlatform.web) {
      final WebBrowserInfo web = await info.webBrowserInfo;
      return _DeviceInfo(
        id: web.userAgent,
        isPhysicalDevice: true,
        os: web.browserName.name,
        brand: web.vendor,
        model: web.vendorSub,
        version: web.appVersion,
        sdk: web.product,
      );
    } else if (io.Platform.isAndroid ||
        platformOverride == DevicePlatform.android) {
      final AndroidDeviceInfo android = await info.androidInfo;
      return _DeviceInfo(
        id: android.id,
        isPhysicalDevice: android.isPhysicalDevice,
        os: 'Android',
        brand: android.brand,
        model: android.model,
        version: android.version.release,
        sdk: '${android.version.sdkInt}',
      );
    } else if (io.Platform.isIOS || platformOverride == DevicePlatform.ios) {
      final IosDeviceInfo ios = await info.iosInfo;
      return _DeviceInfo(
        id: ios.identifierForVendor,
        isPhysicalDevice: ios.isPhysicalDevice,
        os: ios.systemName,
        brand: ios.model,
        model: ios.name,
        version: ios.systemVersion,
        sdk: ios.utsname.machine,
      );
    } else if (io.Platform.isMacOS) {
      final MacOsDeviceInfo macos = await info.macOsInfo;
      return _DeviceInfo(
        id: macos.systemGUID,
        isPhysicalDevice: false,
        os: macos.computerName,
        brand: macos.model,
        model: macos.osRelease,
        version: macos.kernelVersion,
        sdk: macos.hostName,
      );
    } else if (io.Platform.isWindows) {
      final WindowsDeviceInfo windowos = await info.windowsInfo;
      return _DeviceInfo(
        id: windowos.deviceId,
        isPhysicalDevice: false,
        os: windowos.productName,
        brand: windowos.computerName,
        model: windowos.registeredOwner,
        version: windowos.displayVersion,
        sdk: windowos.buildLab,
      );
    } else if (io.Platform.isLinux) {
      final LinuxDeviceInfo linuxos = await info.linuxInfo;
      return _DeviceInfo(
        id: linuxos.machineId,
        isPhysicalDevice: false,
        os: linuxos.name,
        brand: linuxos.versionCodename,
        model: linuxos.prettyName,
        version: linuxos.version,
        sdk: linuxos.variant,
      );
    }

    throw const AppException('Expects to find a device platform');
  }

  final String? id;
  final bool isPhysicalDevice;
  final String os;
  final String? brand;
  final String? model;
  final String? version;
  final String? sdk;
}

enum DevicePlatform { android, ios, web }
