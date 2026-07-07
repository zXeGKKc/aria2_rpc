import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aria2_rpc/src/enum.dart';
import 'package:aria2_rpc/src/model.dart';
import 'package:aria2_rpc/src/response.dart';
import 'package:aria2_rpc/src/result.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const _uuid = Uuid();

sealed class Aria2RPCClient {
  Uri get uri;
  String? get secret;

  Future<void> disconnect() async {}

  /// 添加下载链接
  Future<Aria2StringResponse> addUri(
    List<String> uris, [
    Aria2InputFileOption? option,
    int? position,
  ]) {
    assert(() {
      if (position != null) return position >= 0;
      return true;
    }());
    return call(
      Aria2Method(.addUri, [uris, ?(option?.toJson()), ?position]),
    ).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 添加种子，或种子内容
  Future<Aria2StringResponse> addTorrent(
    String base64Torrent, [
    List<String>? uris,
    Aria2InputFileOption? option,
    int? position,
  ]) {
    assert(() {
      if (position != null) return position >= 0;
      return true;
    }());
    return call(
      Aria2Method(.addTorrent, [
        base64Torrent,
        ?uris,
        ?(option?.toJson()),
        ?position,
      ]),
    ).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取下载任务中活动的节点
  Future<Aria2ResultListResponse<Aria2DownloadingPeer>> getPeers(String gid) {
    return call(Aria2Method(.getPeers, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.getPeers, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 添加metalink
  Future<Aria2StringListResponse> addMetalink(
    String base64Metalink, [
    Aria2InputFileOption? option,
    int? position,
  ]) {
    assert(() {
      if (position != null) return position >= 0;
      return true;
    }());
    return call(
      Aria2Method(.addMetalink, [
        base64Metalink,
        ?(option?.toJson()),
        ?position,
      ]),
    ).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringListResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 删除下载任务
  Future<Aria2StringResponse> remove(String gid) {
    return call(Aria2Method(.remove, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 暂停下载
  Future<Aria2StringResponse> pause(String gid) {
    return call(Aria2Method(.pause, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 强制暂停，不通知trackers自己下线
  Future<Aria2StringResponse> forcePause(String gid) {
    return call(Aria2Method(.forcePause, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 暂停所有
  Future<Aria2StringResponse> pauseAll() {
    return call(Aria2Method(.pauseAll)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 强制暂停所有
  Future<Aria2StringResponse> forcePauseAll() {
    return call(Aria2Method(.forcePauseAll)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 恢复下载
  Future<Aria2StringResponse> unpause(String gid) {
    return call(Aria2Method(.unpause, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 恢复所有下载
  Future<Aria2StringResponse> unpauseAll() {
    return call(Aria2Method(.unpauseAll)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 强制删除，不通知trackers自己下线
  Future<Aria2StringResponse> forceRemove(String gid) {
    return call(Aria2Method(.forceRemove, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 修改下载任务在队列中的位置
  Future<Aria2IntResponse> changePosition(
    String gid,
    int pos,
    Aria2PositionSymbol how,
  ) {
    return call(Aria2Method(.changePosition, [gid, pos, how.alias])).then((
      json,
    ) {
      if (json.containsKey('result')) {
        return Aria2IntResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取任务状态
  Future<Aria2ResultResponse<Aria2DownloadingStatus>> tellStatus(
    String gid, [
    Aria2StatusKeys? keys,
  ]) {
    return call(Aria2Method(.tellStatus, [gid, ?keys])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.tellStatus, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取任务的下载链接
  Future<Aria2ResultListResponse<Aria2DownloadingUri>> getUris(String gid) {
    return call(Aria2Method(.getUris, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.getUris, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取任务下载文件列表
  Future<Aria2ResultListResponse<Aria2DownloadingFile>> getFiles(String gid) {
    return call(Aria2Method(.getFiles, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.getFiles, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 下载任务连接的服务器地址,及下载速度
  Future<Aria2ResultListResponse<Aria2LinkedServer>> getServers(String gid) {
    return call(Aria2Method(.getServers, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.getServers, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取所有正在运行的任务的状态
  Future<Aria2ResultListResponse<Aria2DownloadingStatus>> tellActive([
    Aria2StatusKeys? keys,
  ]) {
    return call(Aria2Method(.tellActive, [?keys])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.tellActive, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取等待中任务状态
  Future<Aria2ResultListResponse<Aria2DownloadingStatus>> tellWaiting(
    int offset,
    int number, [
    Aria2StatusKeys? keys,
  ]) {
    return call(Aria2Method(.tellWaiting, [offset, number, ?keys])).then((
      json,
    ) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.tellWaiting, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取所有已停止的任务
  Future<Aria2ResultListResponse<Aria2DownloadingStatus>> tellStopped(
    int offset,
    int number, [
    Aria2StatusKeys? keys,
  ]) {
    return call(Aria2Method(.tellStopped, [offset, number, ?keys])).then((
      json,
    ) {
      if (json.containsKey('result')) {
        return Aria2ResultListResponse.fromJson(.tellStopped, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取任务配置
  Future<Aria2ResultResponse<Aria2Option>> getOption(String gid) {
    return call(Aria2Method(.getOption, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.getOption, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 修改任务的url*
  Future<Aria2IntListResponse> changeUri(
    String gid,
    int fileIndex,
    List<String> delUris,
    List<String> addUris, [
    int? position,
  ]) {
    return call(
      Aria2Method(.changeUri, [gid, fileIndex, delUris, addUris, ?position]),
    ).then((json) {
      if (json.containsKey('result')) {
        return Aria2IntListResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 修改任务配置，部分参数修改完任务重启
  Future<Aria2StringResponse> changeOption(String gid, Aria2Option option) {
    return call(Aria2Method(.changeOption, [gid, option.toJson()])).then((
      json,
    ) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取全局配置
  Future<Aria2ResultResponse<Aria2Option>> getGlobalOption() {
    return call(Aria2Method(.getGlobalOption)).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.getGlobalOption, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 修改全局配置
  Future<Aria2StringResponse> changeGlobalOption(Aria2Option option) {
    return call(Aria2Method(.changeGlobalOption, [option.toJson()])).then((
      json,
    ) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 清除所有完成/报错/删除的任务信息
  Future<Aria2StringResponse> purgeDownloadResult() {
    return call(Aria2Method(.purgeDownloadResult)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 清除指定完成/报错/删除的任务信息
  Future<Aria2StringResponse> removeDownloadResult(String gid) {
    return call(Aria2Method(.removeDownloadResult, [gid])).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  ///获取版本信息
  Future<Aria2ResultResponse<Aria2Version>> getVersion() {
    return call(Aria2Method(.getVersion)).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.getVersion, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取当前连接的sessionID
  Future<Aria2ResultResponse<Aria2SessionInfo>> getSessionInfo() {
    return call(Aria2Method(.getSessionInfo)).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.getSessionInfo, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 关闭aria2
  Future<Aria2StringResponse> shutdown() {
    return call(Aria2Method(.shutdown)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 强制关闭aria2
  Future<Aria2StringResponse> forceShutdown() {
    return call(Aria2Method(.forceShutdown)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 获取全局状态
  Future<Aria2ResultResponse<Aria2GlobalStat>> getGlobalStat() {
    return call(Aria2Method(.getGlobalStat)).then((json) {
      if (json.containsKey('result')) {
        return Aria2ResultResponse.fromJson(.getGlobalStat, json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 保存session内容到文件，并写入服务器
  Future<Aria2StringResponse> saveSession() {
    return call(Aria2Method(.saveSession)).then((json) {
      if (json.containsKey('result')) {
        return Aria2StringResponse.fromJson(json);
      } else {
        throw Aria2ErrorResponse.fromJson(json);
      }
    });
  }

  /// 罗列方法
  Future<Aria2StringListResponse> listMethods() =>
      call(Aria2Method(.listNotifications)).then((json) {
        if (json.containsKey('result')) {
          return Aria2StringListResponse.fromJson(json);
        } else {
          throw Aria2ErrorResponse.fromJson(json);
        }
      });

  /// 罗列通知触发函数
  Future<Aria2StringListResponse> listNotifications() =>
      call(Aria2Method(.listNotifications)).then((json) {
        if (json.containsKey('result')) {
          return Aria2StringListResponse.fromJson(json);
        } else {
          throw Aria2ErrorResponse.fromJson(json);
        }
      });

  Future<Map<String, dynamic>> call(Aria2Method method);

  /// 多任务执行
  Future<Aria2MulticallResponse> multicall(List<Aria2Method> methods);

  /// 多任务执行
  Future<Aria2BatchcallResponse> batchcall(List<Aria2Method> methods);
}

class Aria2HttpClient extends Aria2RPCClient {
  @override
  final Uri uri;
  final Aria2HttpFunction func;
  @override
  final String? secret;

  final _client = http.Client();

  Aria2HttpClient.uri({required this.uri, required this.func, this.secret});

  Aria2HttpClient({
    required String host,
    int? port,
    String? path,
    bool tls = false,
    required this.func,
    this.secret,
  }) : uri = Uri(
         scheme: tls ? 'https' : 'http',
         host: host,
         port: port,
         path: path,
       );

  @override
  Future<Aria2BatchcallResponse> batchcall(List<Aria2Method> methods) async {
    assert(methods.isNotEmpty);

    final Map<String, Aria2Method> pending = {};
    final List<Map<String, dynamic>> requests = [];
    for (final method in methods) {
      final id = _uuid.v4();
      pending[id] = method;
      requests.add(_buildRequest(id, method));
    }

    final http.Response httpResponse;
    switch (func) {
      case Aria2HttpFunction.get:
        httpResponse = await _client.get(
          uri.replace(query: jsonEncode(requests)),
        );
        break;
      case Aria2HttpFunction.post:
        httpResponse = await _client.post(uri, body: jsonEncode(requests));
        break;
    }
    final json = jsonDecode(httpResponse.body) as List<dynamic>;
    final Map<Aria2MethodName, Map<String, dynamic>> jsonResponses = {};
    for (final i in json) {
      if (i is Map<String, dynamic>) {
        final id = i['id'];
        final method = pending.remove(id);
        if (method != null) jsonResponses[method.methodName] = i;
      }
    }

    return Aria2BatchcallResponse.fromJsonResponses(jsonResponses);
  }

  @override
  Future<Map<String, dynamic>> call(Aria2Method method) async {
    final id = _uuid.v4();
    final request = _buildRequest(id, method);

    final http.Response httpResponse;
    switch (func) {
      case Aria2HttpFunction.get:
        httpResponse = await _client.get(uri.replace(queryParameters: request));
        break;
      case Aria2HttpFunction.post:
        httpResponse = await _client.post(uri, body: jsonEncode(request));
        break;
    }
    final json = jsonDecode(httpResponse.body);
    return json;
  }

  @override
  Future<Aria2MulticallResponse> multicall(List<Aria2Method> methods) async {
    assert(methods.isNotEmpty);

    final id = _uuid.v4();
    final request = _buildMulticallRequest(id, methods);

    final http.Response httpResponse;
    switch (func) {
      case Aria2HttpFunction.get:
        httpResponse = await _client.get(uri.replace(queryParameters: request));
        break;
      case Aria2HttpFunction.post:
        httpResponse = await _client.post(uri, body: jsonEncode(request));
        break;
    }
    final json = jsonDecode(httpResponse.body);

    return Aria2MulticallResponse.fromJson(
      methods.map((e) => e.methodName).toList(),
      json,
    );
  }

  Map<String, dynamic> _buildRequest(String id, Aria2Method method) {
    final params = [
      if (!method.noRequireSecret && secret != null) 'token:$secret',
      ...?method.params,
    ];

    switch (func) {
      case Aria2HttpFunction.get:
        return {
          'id': id,
          'method': method.methodName.alias,
          'params': base64Encode(utf8.encode(jsonEncode(params))),
        };
      case Aria2HttpFunction.post:
        return {
          'jsonrpc': '2.0',
          'id': id,
          'method': method.methodName.alias,
          'params': params,
        };
    }
  }

  Map<String, dynamic> _buildMulticallRequest(
    String id,
    List<Aria2Method> methods,
  ) {
    final result = <Map<String, dynamic>>[];

    for (final i in methods) {
      final params = [
        if (!i.noRequireSecret && secret != null) 'token:$secret',
        ...?i.params,
      ];
      result.add({'methodName': i.methodName.alias, 'params': params});
    }

    switch (func) {
      case Aria2HttpFunction.get:
        return {
          'id': id,
          'method': Aria2MethodName.multicall.alias,
          'params': base64Encode(utf8.encode(jsonEncode([result]))),
        };
      case Aria2HttpFunction.post:
        return {
          'jsonrpc': '2.0',
          'id': id,
          'method': Aria2MethodName.multicall.alias,
          'params': [result],
        };
    }
  }
}

class Aria2WebSocketClient extends Aria2RPCClient {
  @override
  final Uri uri;
  @override
  final String? secret;

  final StreamController<Aria2NotificationResponse> _notificationController;
  bool _isChannelInitialized = false;
  late final WebSocketChannel _channel;
  late final StreamSubscription _subscription;
  final _pending = <String, _Aria2WebSocketPacket>{};

  Aria2WebSocketClient.uri({
    required this.uri,
    this.secret,
    bool broadcastNotification = true,
  }) : _notificationController = broadcastNotification
           ? StreamController.broadcast()
           : StreamController();

  Aria2WebSocketClient({
    required String host,
    int? port,
    String? path,
    bool tls = false,
    this.secret,
    bool broadcastNotification = true,
  }) : uri = Uri(
         scheme: tls ? 'wss' : 'ws',
         host: host,
         port: port,
         path: path,
       ),
       _notificationController = broadcastNotification
           ? StreamController.broadcast()
           : StreamController();

  Stream<Aria2NotificationResponse> get notification =>
      _notificationController.stream;

  @override
  Future<void> disconnect({int? code, String? reason}) async {
    if (_isChannelInitialized) {
      await _subscription.cancel();
      await _channel.sink.close(code, reason);
    }
    if (!_notificationController.isClosed) {
      await _notificationController.close();
    }
    _cleanUpPending(
      WebSocketChannelException.from(const SocketException.closed()),
    );
  }

  @override
  Future<Aria2BatchcallResponse> batchcall(List<Aria2Method> methods) async {
    assert(methods.isNotEmpty);

    _buildChannel();
    await _channel.ready;

    final futures = <Future<Map<String, dynamic>>>[];
    final requests = <Map<String, dynamic>>[];

    for (final method in methods) {
      final id = _uuid.v4();
      final completer = Completer<Map<String, dynamic>>();
      _pending[id] = _Aria2WebSocketPacket(method.methodName, completer);
      futures.add(completer.future);
      requests.add(_buildRequest(id, method));
    }
    _channel.sink.add(jsonEncode(requests));

    final raw = await Future.wait(futures);
    return Aria2BatchcallResponse.fromJsonResponses(
      Map.fromIterables(methods.map((e) => e.methodName), raw),
    );
  }

  @override
  Future<Map<String, dynamic>> call(Aria2Method method) async {
    _buildChannel();
    await _channel.ready;

    final id = _uuid.v4();
    final completer = Completer<Map<String, dynamic>>();
    _pending[id] = _Aria2WebSocketPacket(method.methodName, completer);
    final request = _buildRequest(id, method);
    _channel.sink.add(jsonEncode(request));
    return completer.future;
  }

  @override
  Future<Aria2MulticallResponse> multicall(List<Aria2Method> methods) async {
    assert(methods.isNotEmpty);

    _buildChannel();
    await _channel.ready;

    final id = _uuid.v4();
    final completer = Completer<Map<String, dynamic>>();
    _pending[id] = _Aria2WebSocketPacket(.multicall, completer);
    final request = _buildMulticallRequest(id, methods);
    _channel.sink.add(jsonEncode(request));

    return Aria2MulticallResponse.fromJson(
      methods.map((e) => e.methodName).toList(),
      await completer.future,
    );
  }

  void _buildChannel() {
    if (!_isChannelInitialized) {
      _channel = WebSocketChannel.connect(uri);
      _isChannelInitialized = true;
      _subscription = _channel.stream.listen(
        (rawJson) {
          final json = jsonDecode(rawJson);
          if (json is List) {
            for (final i in json) {
              if (i is Map<String, dynamic>) {
                _handleCall(i);
              }
            }
          } else if (json is Map<String, dynamic>) {
            _handleCall(json);
          }
        },
        onError: (o) {
          _cleanUpPending(o);
        },
        onDone: () => _cleanUpPending(
          WebSocketChannelException.from(const SocketException.closed()),
        ),
      );
    }
  }

  void _cleanUpPending(Exception e) {
    for (final packet in _pending.values) {
      if (!packet.isCompleted) packet.completeError(e);
    }
    _pending.clear();
  }

  void _handleCall(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      final packet = _pending.remove(json['id']);
      if (packet != null) packet.complete(json);
    } else if (json.containsKey('method') && json.containsKey('params')) {
      try {
        _notificationController.add(Aria2NotificationResponse.fromJson(json));
      } on Exception catch (e) {
        _notificationController.addError(e);
      }
    }
  }

  Map<String, dynamic> _buildRequest(String id, Aria2Method method) {
    final params = [
      if (!method.noRequireSecret && secret != null) 'token:$secret',
      ...?method.params,
    ];

    return {
      'jsonrpc': '2.0',
      'id': id,
      'method': method.methodName.alias,
      'params': params,
    };
  }

  Map<String, dynamic> _buildMulticallRequest(
    String id,
    List<Aria2Method> methods,
  ) {
    final result = <Map<String, dynamic>>[];

    for (final i in methods) {
      final params = [
        if (!i.noRequireSecret && secret != null) 'token:$secret',
        ...?i.params,
      ];
      result.add({'methodName': i.methodName.alias, 'params': params});
    }

    return {
      'jsonrpc': '2.0',
      'id': id,
      'method': Aria2MethodName.multicall.alias,
      'params': [result],
    };
  }
}

class _Aria2WebSocketPacket<T> {
  final Aria2MethodName methodName;
  final Completer<T> _completer;

  const _Aria2WebSocketPacket(this.methodName, this._completer);

  Future<T> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void complete([FutureOr<T>? value]) => _completer.complete(value);

  void completeError(Object error, [StackTrace? stackTrace]) =>
      _completer.completeError(error, stackTrace);
}
