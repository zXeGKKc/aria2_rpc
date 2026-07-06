import 'dart:async';
import 'dart:io';

import 'package:test/test.dart';
import 'package:path/path.dart' as p;
import 'package:aria2_rpc/aria2_rpc.dart';

const host = '127.0.0.1';
const port = 6800;
const path = 'jsonrpc';

const delayDuration = Duration(seconds: 2);
const downloadLink = 'https://ash-speed.hetzner.com/100MB.bin';
const errorLink = 'https://example.com/file.zip';

final tmpDir = Directory(p.join(Directory.current.path, 'test', 'tmp'))
  ..createSync();
final option = Aria2InputFileOption(dir: tmpDir.path);

// Future<FlutterAria2> startAria2() async {
//   final aria2 = FlutterAria2();

//   await aria2.libraryInit();
//   await aria2.sessionNew(
//     options: {
//       'dir': tmpDir.path,
//       'continue': 'true',
//       'max-concurrent-downloads': '3',
//       'enable-rpc': 'true',
//       'rpc-listen-port': '16800',
//     },
//   );
//   await aria2.startRunLoop();

//   aria2.onDownloadEvent.listen((event) {
//     print('${event.event} for gid ${event.gid}');
//   });

//   return aria2;
// }

void main() async {
  group('test method in http client', () {
    late Aria2HttpClient client;

    setUp(() async {
      client = Aria2HttpClient(
        host: host,
        port: port,
        path: path,
        func: Aria2HttpFunction.post,
      );
    });

    tearDown(() async {
      await client.purgeDownloadResult();
      await client.disconnect();
      await Future.delayed(delayDuration);
      await tmpDir.list().forEach((e) async => await e.delete(recursive: true));
    });

    test('aria2.addUri', () async {
      final test = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final cleanup = await client.remove(test.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.addUri([], option);
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.addTorrent', () {
      // TODO: implement
    }, skip: true);

    test('aria2.addMetalink', () async {
      // TODO: implement
    }, skip: true);

    test('aria2.remove', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.remove(preload.result);
      expect(test.result, equals(preload.result));

      final testFailed = client.remove('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.forceRemove', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.forceRemove(preload.result);
      expect(test.result, equals(preload.result));

      final testFailed = client.forceRemove('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.pause', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.pause(preload.result);
      expect(test.result, equals(preload.result));
      final cleanup = await client.remove(test.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.pause('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.pauseAll', () async {
      await client.pauseAll();
    });

    test('aria2.forcePause', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.forcePause(preload.result);
      expect(test.result, equals(preload.result));
      final cleanup = await client.remove(test.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.forcePause('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.forcePauseAll', () async {
      await client.forcePauseAll();
    });

    test('aria2.unpause', () async {
      final preload1 = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final preload2 = await client.pause(preload1.result);
      expect(preload2.result, equals(preload1.result));
      await Future.delayed(delayDuration);
      final test = await client.unpause(preload2.result);
      expect(test.result, equals(preload2.result));
      final cleanup = await client.remove(test.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.unpause('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.unpauseAll', () async {
      await client.unpauseAll();
    });

    test('aria2.tellStatus', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.tellStatus(
        preload.result,
        Aria2StatusKeys(gid: true, status: true),
      );
      expect(test.result.gid, equals(preload.result));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.tellStatus(
        'zccxcsds',
        Aria2StatusKeys(gid: true),
      );
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.getUris', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.getUris(preload.result);
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.getUris('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.getFiles', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.getFiles(preload.result);
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.getFiles('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.getPeers', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.getPeers(preload.result);
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.getPeers('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.getServers', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.getServers(preload.result);
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));

      final testFailed = client.getServers('zccxcsds');
      expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
    });

    test('aria2.tellActive', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.tellActive(Aria2StatusKeys());
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload.result);
      expect(cleanup.result, equals(test.result));
    });

    test('aria2.tellWaiting', () async {
      final preload1 = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final preload2 = await client.pause(preload1.result);
      expect(preload2.result, equals(preload1.result));
      await Future.delayed(delayDuration);
      final test = await client.tellWaiting(0, 10, Aria2StatusKeys());
      expect(test.result.length, greaterThan(0));
      final cleanup = await client.remove(preload1.result);
      expect(cleanup.result, equals(test.result));
    });

    test('aria2.tellStopped', () async {
      final preload1 = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final preload2 = await client.remove(preload1.result);
      expect(preload2.result, equals(preload1.result));
      await Future.delayed(delayDuration);
      final test = await client.tellStopped(0, 10, Aria2StatusKeys());
      expect(test.result.length, greaterThan(0));
    });

    test('aria2.changePosition', () async {
      final temp = await client.getGlobalOption();
      final concurrent = temp.result.maxConcurrentDownloads;

      await client.changeGlobalOption(
        Aria2Option.global(maxConcurrentDownloads: 1),
      );

      await client.batchcall([
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
      ]);

      final preload2 = await client.tellWaiting(
        0,
        10,
        Aria2StatusKeys(gid: true),
      );
      expect(preload2.result, greaterThan(0));

      final test = await client.changePosition(
        preload2.result.first.gid!,
        0,
        Aria2PositionSymbol.posSet,
      );
      expect(test.result, equals(0));

      await client.changeGlobalOption(
        Aria2Option.global(maxConcurrentDownloads: concurrent),
      );
    });

    test('aria2.changeUri', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.changeUri(
        preload.result,
        1,
        [downloadLink, downloadLink],
        [errorLink],
      );
      expect(test.result, hasLength(2));
      await client.remove(preload.result);
    });

    test('aria2.getOption', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      await client.getOption(preload.result);
      await client.remove(preload.result);
    });

    test('aria2.changeOption', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      await client.changeOption(preload.result, const Aria2Option(timeout: 30));
      await client.remove(preload.result);
    });

    test('aria2.getGlobalOption', () async {
      await client.getGlobalOption();
    });

    test('aria2.changeGlobalOption', () async {
      final preload = await client.getGlobalOption();
      await client.changeGlobalOption(const Aria2Option(timeout: 60));
      await Future.delayed(delayDuration);
      await client.changeGlobalOption(
        Aria2Option(timeout: preload.result.timeout),
      );
    });

    test('aria2.getGlobalStat', () async {
      final preload = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final test = await client.getGlobalStat();
      expect(test.result.numActive, greaterThan(0));
      await client.remove(preload.result);
    });

    test('aria2.purgeDownloadResult', () async {
      await client.purgeDownloadResult();
    });

    test('aria2.removeDownloadResult', () async {
      final preload1 = await client.addUri([downloadLink], option);
      await Future.delayed(delayDuration);
      final preload2 = await client.forceRemove(preload1.result);
      expect(preload2.result, equals(preload1.result));
      await client.removeDownloadResult(preload2.result);
    });

    test('aria2.getVersion', () async {
      await client.getVersion();
    });

    test('aria2.getSessionInfo', () async {
      await client.getSessionInfo();
    });

    test('aria2.saveSession', () async {
      await client.saveSession();
    });

    test('system.multicall', () async {
      final methods = [
        // error
        Aria2Method(Aria2MethodName.addTorrent),
        // string
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        // object list
        Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
        // object
        Aria2Method(Aria2MethodName.getVersion),
      ];

      final test = await client.multicall(methods);
      expect(test.result[0], isA<Aria2Error>());
      expect(test.result[1], isA<String>());
      expect(test.result[2], isA<List<Aria2Result>>());
      expect(test.result[3], isA<Aria2Version>());

      final cleanup = await client.remove(test.result[1]);
      expect(cleanup.result, test.result[1]);
    });

    test('batchcall', () async {
      final methods = [
        // error
        Aria2Method(Aria2MethodName.addTorrent),
        // string
        Aria2Method(Aria2MethodName.addUri, [
          [downloadLink],
          option.toJson(),
        ]),
        // object list
        Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
        // object
        Aria2Method(Aria2MethodName.getVersion),
      ];

      final test = await client.batchcall(methods);
      expect(test.responses[0], isA<Aria2ErrorResponse>());
      expect(test.responses[1], isA<Aria2StringResponse>());
      expect(test.responses[2], isA<Aria2ResultListResponse>());
      expect(test.responses[3], isA<Aria2ResultResponse>());

      final cleanup = await client.remove(test.responses[1].result);
      expect(cleanup.result, test.responses[1].result);
    });

    test('system.listMethods', () async {
      final test = await client.listMethods();
      expect(test.result.length, greaterThan(0));
    });

    test('system.listNotifications', () async {
      final test = await client.listNotifications();
      expect(test.result.length, greaterThan(0));
    });
  });

  // TODO: websocket and notification
}
