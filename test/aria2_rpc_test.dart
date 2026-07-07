import 'dart:async';
import 'dart:io';

import 'package:test/test.dart';
import 'package:path/path.dart' as p;
import 'package:aria2_rpc/aria2_rpc.dart';

const host = '127.0.0.1';
const port = 6800;
const path = 'jsonrpc';

const delayDuration = Duration(seconds: 2);
const downloadLink = [
  'https://ash-speed.hetzner.com/100MB.bin',
  'https://qqdl.gtimg.cn/qqfile/QQNT/9.9.31/release/092069d7/QQ_9.9.31_260528_x64_01.exe',
];
const errorLink = 'https://example.com/file.zip';

final tmpDir = Directory(p.join(Directory.current.path, 'test', 'tmp'))
  ..createSync();
final option = Aria2InputFileOption(dir: tmpDir.path);

void main() async {
  group('test method', () {
    late Aria2HttpClient httpClient;
    late Aria2WebSocketClient websocketClient;

    setUp(() async {
      httpClient = Aria2HttpClient(
        host: host,
        port: port,
        path: path,
        func: Aria2HttpFunction.post,
      );

      websocketClient = Aria2WebSocketClient(
        host: host,
        port: port,
        path: path,
      );
    });

    tearDown(() async {
      await httpClient.purgeDownloadResult();
      await httpClient.disconnect();

      await websocketClient.purgeDownloadResult();
      await websocketClient.disconnect();

      await Future.delayed(delayDuration);
      await tmpDir.list().forEach((e) async => await e.delete(recursive: true));
    });

    test('aria2.addUri', () async {
      await Future.wait([
        () async {
          final test = await httpClient.addUri([downloadLink[0]], option);
          final cleanup = await httpClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = httpClient.addUri([], option);
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final test = await websocketClient.addUri([downloadLink[1]], option);
          final cleanup = await websocketClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = websocketClient.addUri([], option);
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.addTorrent', () {
      // TODO: implement
    }, skip: true);

    test('aria2.addMetalink', () async {
      // TODO: implement
    }, skip: true);

    test('aria2.remove', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.remove(preload.result);
          expect(test.result, equals(preload.result));

          final testFailed = httpClient.remove('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.remove(preload.result);
          expect(test.result, equals(preload.result));

          final testFailed = websocketClient.remove('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.forceRemove', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.forceRemove(preload.result);
          expect(test.result, equals(preload.result));

          final testFailed = httpClient.forceRemove('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.forceRemove(preload.result);
          expect(test.result, equals(preload.result));

          final testFailed = websocketClient.forceRemove('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.pause', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.pause(preload.result);
          expect(test.result, equals(preload.result));
          final cleanup = await httpClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = httpClient.pause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.pause(preload.result);
          expect(test.result, equals(preload.result));
          final cleanup = await websocketClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = websocketClient.pause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.pauseAll', () async {
      await Future.wait([httpClient.pauseAll(), websocketClient.pauseAll()]);
    });

    test('aria2.forcePause', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.forcePause(preload.result);
          expect(test.result, equals(preload.result));
          final cleanup = await httpClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = httpClient.forcePause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.forcePause(preload.result);
          expect(test.result, equals(preload.result));
          final cleanup = await websocketClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = websocketClient.forcePause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.forcePauseAll', () async {
      await Future.wait([
        httpClient.forcePauseAll(),
        websocketClient.forcePauseAll(),
      ]);
    });

    test('aria2.unpause', () async {
      await Future.wait([
        () async {
          final preload1 = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final preload2 = await httpClient.pause(preload1.result);
          expect(preload2.result, equals(preload1.result));
          await Future.delayed(delayDuration);
          final test = await httpClient.unpause(preload2.result);
          expect(test.result, equals(preload2.result));
          final cleanup = await httpClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = httpClient.unpause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload1 = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final preload2 = await websocketClient.pause(preload1.result);
          expect(preload2.result, equals(preload1.result));
          await Future.delayed(delayDuration);
          final test = await websocketClient.unpause(preload2.result);
          expect(test.result, equals(preload2.result));
          final cleanup = await websocketClient.remove(test.result);
          expect(cleanup.result, equals(test.result));

          final testFailed = websocketClient.unpause('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.unpauseAll', () async {
      await Future.wait([
        httpClient.unpauseAll(),
        websocketClient.unpauseAll(),
      ]);
    });

    test('aria2.tellStatus', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.tellStatus(
            preload.result,
            Aria2StatusKeys(gid: true, status: true),
          );
          expect(test.result.gid, equals(preload.result));
          final cleanup = await httpClient.remove(preload.result);
          expect(cleanup.result, equals(test.result.gid));

          final testFailed = httpClient.tellStatus(
            'zccxcsds',
            Aria2StatusKeys(gid: true),
          );
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.tellStatus(
            preload.result,
            Aria2StatusKeys(gid: true, status: true),
          );
          expect(test.result.gid, equals(preload.result));
          final cleanup = await websocketClient.remove(preload.result);
          expect(cleanup.result, equals(test.result.gid));

          final testFailed = websocketClient.tellStatus(
            'zccxcsds',
            Aria2StatusKeys(gid: true),
          );
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.getUris', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.getUris(preload.result);
          expect(test.result.length, greaterThan(0));
          await httpClient.remove(preload.result);

          final testFailed = httpClient.getUris('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.getUris(preload.result);
          expect(test.result.length, greaterThan(0));
          await websocketClient.remove(preload.result);

          final testFailed = websocketClient.getUris('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.getFiles', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.getFiles(preload.result);
          expect(test.result.length, greaterThan(0));
          await httpClient.remove(preload.result);

          final testFailed = httpClient.getFiles('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.getFiles(preload.result);
          expect(test.result.length, greaterThan(0));
          await websocketClient.remove(preload.result);

          final testFailed = websocketClient.getFiles('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.getPeers', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.getPeers(preload.result);
          expect(test.result.length, greaterThanOrEqualTo(0));
          await httpClient.remove(preload.result);

          final testFailed = httpClient.getPeers('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.getPeers(preload.result);
          expect(test.result.length, greaterThanOrEqualTo(0));
          await websocketClient.remove(preload.result);

          final testFailed = websocketClient.getPeers('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.getServers', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          final test = await httpClient.getServers(preload.result);
          expect(test.result.length, greaterThan(0));
          await httpClient.remove(preload.result);

          final testFailed = httpClient.getServers('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          final test = await websocketClient.getServers(preload.result);
          expect(test.result.length, greaterThan(0));
          await websocketClient.remove(preload.result);

          final testFailed = websocketClient.getServers('zccxcsds');
          expect(testFailed, throwsA(isA<Aria2ErrorResponse>()));
        }(),
      ]);
    });

    test('aria2.tellActive', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.tellActive(Aria2StatusKeys());
          expect(test.result.length, greaterThan(0));
          await httpClient.remove(preload.result);
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.tellActive(Aria2StatusKeys());
          expect(test.result.length, greaterThan(0));
          await websocketClient.remove(preload.result);
        }(),
      ]);
    });

    test('aria2.tellWaiting', () async {
      await Future.wait([
        () async {
          final preload1 = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final preload2 = await httpClient.pause(preload1.result);
          expect(preload2.result, equals(preload1.result));
          await Future.delayed(delayDuration);
          final test = await httpClient.tellWaiting(0, 10, Aria2StatusKeys());
          expect(test.result.length, greaterThan(0));
          await httpClient.remove(preload1.result);
        }(),
        () async {
          final preload1 = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final preload2 = await websocketClient.pause(preload1.result);
          expect(preload2.result, equals(preload1.result));
          await Future.delayed(delayDuration);
          final test = await websocketClient.tellWaiting(
            0,
            10,
            Aria2StatusKeys(),
          );
          expect(test.result.length, greaterThan(0));
          await websocketClient.remove(preload1.result);
        }(),
      ]);
    });

    test('aria2.tellStopped', () async {
      await Future.wait([
        () async {
          final preload1 = await httpClient.addUri([downloadLink[0]], option);
          final preload2 = await httpClient.remove(preload1.result);
          expect(preload2.result, equals(preload1.result));
          final test = await httpClient.tellStopped(0, 10, Aria2StatusKeys());
          expect(test.result.length, greaterThan(0));
        }(),
        () async {
          final preload1 = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          final preload2 = await websocketClient.remove(preload1.result);
          expect(preload2.result, equals(preload1.result));
          final test = await websocketClient.tellStopped(
            0,
            10,
            Aria2StatusKeys(),
          );
          expect(test.result.length, greaterThan(0));
        }(),
      ]);
    });

    test('aria2.changePosition', () async {
      await Future.wait([
        () async {
          final temp = await httpClient.getGlobalOption();
          final concurrent = temp.result.maxConcurrentDownloads;

          await httpClient.changeGlobalOption(
            Aria2Option.global(maxConcurrentDownloads: 1),
          );

          await httpClient.batchcall([
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
          ]);

          final preload2 = await httpClient.tellWaiting(
            0,
            10,
            Aria2StatusKeys(gid: true),
          );
          expect(preload2.result.length, greaterThan(0));

          final test = await httpClient.changePosition(
            preload2.result.first.gid!,
            0,
            Aria2PositionSymbol.posSet,
          );
          expect(test.result, equals(0));

          await httpClient.changeGlobalOption(
            Aria2Option.global(maxConcurrentDownloads: concurrent),
          );
        }(),
        () async {
          final temp = await websocketClient.getGlobalOption();
          final concurrent = temp.result.maxConcurrentDownloads;

          await websocketClient.changeGlobalOption(
            Aria2Option.global(maxConcurrentDownloads: 1),
          );

          await websocketClient.batchcall([
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
          ]);

          final preload2 = await websocketClient.tellWaiting(
            0,
            10,
            Aria2StatusKeys(gid: true),
          );
          expect(preload2.result.length, greaterThan(0));

          final test = await websocketClient.changePosition(
            preload2.result.first.gid!,
            0,
            Aria2PositionSymbol.posSet,
          );
          expect(test.result, equals(0));

          await websocketClient.changeGlobalOption(
            Aria2Option.global(maxConcurrentDownloads: concurrent),
          );
        }(),
      ]);
    });

    test('aria2.changeUri', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.changeUri(
            preload.result,
            1,
            [downloadLink[0], downloadLink[0]],
            [errorLink],
          );
          expect(test.result, hasLength(2));
          await httpClient.remove(preload.result);
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.changeUri(
            preload.result,
            1,
            [downloadLink[1], downloadLink[1]],
            [errorLink],
          );
          expect(test.result, hasLength(2));
          await websocketClient.remove(preload.result);
        }(),
      ]);
    });

    test('aria2.getOption', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          await httpClient.getOption(preload.result);
          await httpClient.remove(preload.result);
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          await websocketClient.getOption(preload.result);
          await websocketClient.remove(preload.result);
        }(),
      ]);
    });

    test('aria2.changeOption', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          await httpClient.changeOption(
            preload.result,
            const Aria2Option(timeout: 30),
          );
          await httpClient.remove(preload.result);
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          await websocketClient.changeOption(
            preload.result,
            const Aria2Option(timeout: 30),
          );
          await websocketClient.remove(preload.result);
        }(),
      ]);
    });

    test('aria2.getGlobalOption', () async {
      await Future.wait([
        httpClient.getGlobalOption(),
        websocketClient.getGlobalOption(),
      ]);
    });

    test('aria2.changeGlobalOption', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.getGlobalOption();
          await httpClient.changeGlobalOption(const Aria2Option(timeout: 60));
          await Future.delayed(delayDuration);
          await httpClient.changeGlobalOption(
            Aria2Option(timeout: preload.result.timeout),
          );
        }(),
        () async {
          final preload = await websocketClient.getGlobalOption();
          await websocketClient.changeGlobalOption(
            const Aria2Option(timeout: 60),
          );
          await Future.delayed(delayDuration);
          await websocketClient.changeGlobalOption(
            Aria2Option(timeout: preload.result.timeout),
          );
        }(),
      ]);
    });

    test('aria2.getGlobalStat', () async {
      await Future.wait([
        () async {
          final preload = await httpClient.addUri([downloadLink[0]], option);
          await Future.delayed(delayDuration);
          final test = await httpClient.getGlobalStat();
          expect(test.result.numActive, greaterThan(0));
          await httpClient.remove(preload.result);
        }(),
        () async {
          final preload = await websocketClient.addUri([
            downloadLink[1],
          ], option);
          await Future.delayed(delayDuration);
          final test = await websocketClient.getGlobalStat();
          expect(test.result.numActive, greaterThan(0));
          await websocketClient.remove(preload.result);
        }(),
      ]);
    });

    test('aria2.purgeDownloadResult', () async {
      await Future.wait([
        httpClient.purgeDownloadResult(),
        websocketClient.purgeDownloadResult(),
      ]);
    });

    test('aria2.removeDownloadResult', () async {
      await Future.wait([
        () async {
          final preload1 = await httpClient.addUri([errorLink], option);
          await Future.delayed(const Duration(seconds: 2));
          await httpClient.removeDownloadResult(preload1.result);
        }(),
        () async {
          final preload1 = await websocketClient.addUri([errorLink], option);
          await Future.delayed(const Duration(seconds: 2));
          await websocketClient.removeDownloadResult(preload1.result);
        }(),
      ]);
    });

    test('aria2.getVersion', () async {
      await Future.wait([
        httpClient.getVersion(),
        websocketClient.getVersion(),
      ]);
    });

    test('aria2.getSessionInfo', () async {
      await Future.wait([
        httpClient.getSessionInfo(),
        websocketClient.getSessionInfo(),
      ]);
    });

    test('aria2.saveSession', () async {
      await Future.wait([
        httpClient.saveSession(),
        websocketClient.saveSession(),
      ]);
    });

    test('system.multicall', () async {
      await Future.wait([
        () async {
          final methods = [
            // error
            Aria2Method(Aria2MethodName.addTorrent),
            // string
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            // object list
            Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
            // object
            Aria2Method(Aria2MethodName.getVersion),
          ];

          final test = await httpClient.multicall(methods);
          expect(test.result[0], isA<Aria2Error>());
          expect(test.result[1], isA<String>());
          expect(test.result[2], isA<List<Aria2Result>>());
          expect(test.result[3], isA<Aria2Version>());

          final cleanup = await httpClient.remove(test.result[1]);
          expect(cleanup.result, test.result[1]);
        }(),
        () async {
          final methods = [
            // error
            Aria2Method(Aria2MethodName.addTorrent),
            // string
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            // object list
            Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
            // object
            Aria2Method(Aria2MethodName.getVersion),
          ];

          final test = await websocketClient.multicall(methods);
          expect(test.result[0], isA<Aria2Error>());
          expect(test.result[1], isA<String>());
          expect(test.result[2], isA<List<Aria2Result>>());
          expect(test.result[3], isA<Aria2Version>());

          final cleanup = await websocketClient.remove(test.result[1]);
          expect(cleanup.result, test.result[1]);
        }(),
      ]);
    });

    test('batchcall', () async {
      await Future.wait([
        () async {
          final methods = [
            // error
            Aria2Method(Aria2MethodName.addTorrent),
            // string
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[0]],
              option.toJson(),
            ]),
            // object list
            Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
            // object
            Aria2Method(Aria2MethodName.getVersion),
          ];

          final test = await httpClient.batchcall(methods);
          expect(test.responses[0], isA<Aria2ErrorResponse>());
          expect(test.responses[1], isA<Aria2StringResponse>());
          expect(test.responses[2], isA<Aria2ResultListResponse>());
          expect(test.responses[3], isA<Aria2ResultResponse>());

          final cleanup = await httpClient.remove(test.responses[1].result);
          expect(cleanup.result, test.responses[1].result);
        }(),
        () async {
          final methods = [
            // error
            Aria2Method(Aria2MethodName.addTorrent),
            // string
            Aria2Method(Aria2MethodName.addUri, [
              [downloadLink[1]],
              option.toJson(),
            ]),
            // object list
            Aria2Method(Aria2MethodName.tellActive, [Aria2StatusKeys()]),
            // object
            Aria2Method(Aria2MethodName.getVersion),
          ];

          final test = await websocketClient.batchcall(methods);
          expect(test.responses[0], isA<Aria2ErrorResponse>());
          expect(test.responses[1], isA<Aria2StringResponse>());
          expect(test.responses[2], isA<Aria2ResultListResponse>());
          expect(test.responses[3], isA<Aria2ResultResponse>());

          final cleanup = await websocketClient.remove(
            test.responses[1].result,
          );
          expect(cleanup.result, test.responses[1].result);
        }(),
      ]);
    });

    test('system.listMethods', () async {
      await Future.wait([
        () async {
          final test = await httpClient.listMethods();
          expect(test.result.length, greaterThan(0));
        }(),
        () async {
          final test = await websocketClient.listMethods();
          expect(test.result.length, greaterThan(0));
        }(),
      ]);
    });

    test('system.listNotifications', () async {
      await Future.wait([
        () async {
          final test = await httpClient.listNotifications();
          expect(test.result.length, greaterThan(0));
        }(),
        () async {
          final test = await websocketClient.listNotifications();
          expect(test.result.length, greaterThan(0));
        }(),
      ]);
    });
  });

  group('test connect', () {
    test('connect error', () async {
      final httpClient = Aria2HttpClient(
        host: '192.168.0.0',
        func: Aria2HttpFunction.post,
      );
      expect(httpClient.getVersion(), throwsException);

      final websocketClient = Aria2WebSocketClient(host: '192.168.0.0');
      expect(websocketClient.getVersion(), throwsException);
      await websocketClient.disconnect();
    });
  });

  group('test notification', () {
    late Aria2WebSocketClient client;

    setUp(() {
      client = Aria2WebSocketClient(host: host, port: port, path: path);
    });

    tearDown(() async {
      await client.purgeDownloadResult();
      await client.disconnect();
      await tmpDir.list().forEach((e) async => await e.delete(recursive: true));
    });

    test('aria2.onDownloadStart', () async {
      final storage = <String>[];
      final subscription = client.notification.listen((e) {
        if (e.method == Aria2NotificationName.onDownloadStart) {
          final list = e.data.map((f) => f.gid).toList();
          storage.addAll(list);
        }
      });

      final test = await client.addUri([downloadLink[0]], option);
      expect(test.result, isNotNull);
      await Future.delayed(const Duration(milliseconds: 200));
      expect(storage, contains(test.result));

      await subscription.cancel();
      await client.remove(test.result);
    });

    test('aria2.onDownloadPause', () async {
      final storage = <String>[];
      final subscription = client.notification.listen((e) {
        if (e.method == Aria2NotificationName.onDownloadPause) {
          final list = e.data.map((f) => f.gid).toList();
          storage.addAll(list);
        }
      });

      final preload = await client.addUri([downloadLink[0]], option);
      await Future.delayed(const Duration(milliseconds: 200));
      final test = await client.pause(preload.result);
      await Future.delayed(const Duration(milliseconds: 200));
      expect(storage, contains(test.result));

      await subscription.cancel();
      await client.remove(test.result);
    });

    test('aria2.onDownloadStop', () async {
      final storage = <String>[];
      final subscription = client.notification.listen((e) {
        if (e.method == Aria2NotificationName.onDownloadStop) {
          final list = e.data.map((f) => f.gid).toList();
          storage.addAll(list);
        }
      });

      final preload = await client.addUri([downloadLink[0]], option);
      final test = await client.remove(preload.result);
      await Future.delayed(const Duration(milliseconds: 200));
      expect(storage, contains(test.result));

      await subscription.cancel();
    });

    test('aria2.onDownloadComplete', () async {
      final completer = Completer<void>();
      String? gid;
      final subscription = client.notification.listen((e) {
        final list = e.data.map((f) => f.gid).toList();
        if (gid == null || !list.contains(gid)) return;
        if (e.method == Aria2NotificationName.onDownloadComplete) {
          if (!completer.isCompleted) completer.complete();
        } else if (e.method == Aria2NotificationName.onDownloadError) {
          if (!completer.isCompleted) completer.completeError('Error');
        }
      });

      try {
        final test = await client.addUri([downloadLink[0]], option);
        gid = test.result;

        await completer.future.timeout(const Duration(seconds: 30));
      } finally {
        await subscription.cancel();
      }
    });

    test('aria2.onDownloadError', () async {
      final completer = Completer<void>();
      String? gid;
      final subscription = client.notification.listen((e) {
        final list = e.data.map((f) => f.gid).toList();
        if (gid == null || !list.contains(gid)) return;
        if (e.method == Aria2NotificationName.onDownloadError) {
          if (!completer.isCompleted) completer.complete();
        } else if (e.method == Aria2NotificationName.onDownloadComplete) {
          if (!completer.isCompleted) completer.completeError('Not a error');
        }
      });

      try {
        final preload = await client.addUri([downloadLink[0]], option);
        gid = preload.result;
        await Future.delayed(delayDuration);
        final changeUri = await client.changeUri(
          gid,
          1,
          [downloadLink[0], downloadLink[0]],
          [errorLink],
        );
        expect(changeUri.result.length, greaterThanOrEqualTo(2));

        await completer.future.timeout(const Duration(seconds: 30));
      } finally {
        await subscription.cancel();
      }
    });

    test('aria2.onBtDownloadComplete', () {
      // TODO: implement
    }, skip: true);
  });
}
