import 'package:flutter_db_client/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_device_info_provider.g.dart';

/// Container for the application's version
/// Should be overridden per [ProviderScope]
@Riverpod(dependencies: <Object>[])
DeviceInformation appDeviceInfo(AppDeviceInfoRef ref) =>
    throw UnimplementedError();
