import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:save_us_starmax/save_us_starmax.dart';
import 'package:save_us_starmax/save_us_starmax_platform_interface.dart';
import 'package:save_us_starmax/save_us_starmax_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSaveUsStarmaxPlatform
    with MockPlatformInterfaceMixin
    implements SaveUsStarmaxPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> notify(Map<String, dynamic> param) {
    return Future.value('');
  }

  @override
  Future<Uint8List?> pairing() {
    return Future.value(Uint16List(16) as FutureOr<Uint8List?>?);
  }
}

void main() {
  final SaveUsStarmaxPlatform initialPlatform = SaveUsStarmaxPlatform.instance;

  test('$MethodChannelSaveUsStarmax is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSaveUsStarmax>());
  });

  test('getPlatformVersion', () async {
    SaveUsStarmax saveUsStarmaxPlugin = SaveUsStarmax();
    MockSaveUsStarmaxPlatform fakePlatform = MockSaveUsStarmaxPlatform();
    SaveUsStarmaxPlatform.instance = fakePlatform;

    expect(await saveUsStarmaxPlugin.getPlatformVersion(), '42');
  });
}
