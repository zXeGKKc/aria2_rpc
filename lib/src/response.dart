import 'package:aria2_rpc/src/_internal/consts.dart';
import 'package:aria2_rpc/src/enum.dart';
import 'package:aria2_rpc/src/result.dart';
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

T fromResult<T extends Aria2Result>(Aria2MethodName methodName, Object? json) {
  switch (methodName) {
    case .getFiles:
      return Aria2DownloadingFile.fromJson(json as Map<String, dynamic>) as T;
    case .getUris:
      return Aria2DownloadingUri.fromJson(json as Map<String, dynamic>) as T;
    case .getPeers:
      return Aria2DownloadingPeer.fromJson(json as Map<String, dynamic>) as T;
    case .getGlobalStat:
      return Aria2GlobalStat.fromJson(json as Map<String, dynamic>) as T;
    case .getServers:
      return Aria2LinkedServer.fromJson(json as Map<String, dynamic>) as T;
    case .getSessionInfo:
      return Aria2SessionInfo.fromJson(json as Map<String, dynamic>) as T;
    case .getVersion:
      return Aria2Version.fromJson(json as Map<String, dynamic>) as T;
    case .getOption:
    case .getGlobalOption:
      return Aria2Option.fromJson(json as Map<String, dynamic>) as T;
    case .tellStatus:
    case .tellActive:
    case .tellWaiting:
    case .tellStopped:
      return Aria2DownloadingStatus.fromJson(json as Map<String, dynamic>) as T;
    case _:
      throw Exception('Invalid method name: $methodName');
  }
}

@JsonSerializable()
class Aria2StringResponse {
  final String id;
  final String result;

  const Aria2StringResponse({required this.id, required this.result});

  factory Aria2StringResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2StringResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Aria2StringResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2IntResponse {
  final String id;
  final int result;

  const Aria2IntResponse({required this.id, required this.result});

  factory Aria2IntResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2IntResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Aria2IntResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2StringListResponse {
  final String id;
  final List<String> result;

  const Aria2StringListResponse({required this.id, required this.result});

  factory Aria2StringListResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2StringListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Aria2StringListResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2IntListResponse {
  final String id;
  final List<int> result;

  const Aria2IntListResponse({required this.id, required this.result});

  factory Aria2IntListResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2IntListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Aria2IntListResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable(genericArgumentFactories: true)
class Aria2ResultListResponse<T extends Aria2Result> {
  final String id;
  final List<T> result;

  const Aria2ResultListResponse({required this.id, required this.result});

  factory Aria2ResultListResponse.fromJson(
    Aria2MethodName methodName,
    Map<String, dynamic> json,
  ) =>
      _$Aria2ResultListResponseFromJson(json, (e) => fromResult(methodName, e));

  Map<String, dynamic> toJson() =>
      _$Aria2ResultListResponseToJson(this, _toJson);

  static Map<String, dynamic> _toJson(Aria2Result object) => switch (object) {
    Aria2DownloadingFile() => object.toJson(),
    Aria2DownloadingPeer() => object.toJson(),
    Aria2DownloadingStatus() => object.toJson(),
    Aria2DownloadingUri() => object.toJson(),
    Aria2Option() => object.toJson(),
    Aria2LinkedServer() => object.toJson(),
    Aria2SessionInfo() => object.toJson(),
    Aria2GlobalStat() => object.toJson(),
    Aria2Version() => object.toJson(),
  };

  @override
  String toString() => toJson().toString();
}

@JsonSerializable(genericArgumentFactories: true)
class Aria2ResultResponse<T extends Aria2Result> {
  final String id;
  final T result;

  const Aria2ResultResponse({required this.id, required this.result});

  factory Aria2ResultResponse.fromJson(
    Aria2MethodName methodName,
    Map<String, dynamic> json,
  ) => _$Aria2ResultResponseFromJson(json, (e) => fromResult(methodName, e));

  Map<String, dynamic> toJson() => _$Aria2ResultResponseToJson(this, _toResult);

  static Map<String, dynamic> _toResult<T extends Aria2Result>(T object) =>
      switch (object) {
        Aria2DownloadingFile() => object.toJson(),
        Aria2DownloadingPeer() => object.toJson(),
        Aria2DownloadingStatus() => object.toJson(),
        Aria2DownloadingUri() => object.toJson(),
        Aria2Option() => object.toJson(),
        Aria2LinkedServer() => object.toJson(),
        Aria2SessionInfo() => object.toJson(),
        Aria2GlobalStat() => object.toJson(),
        Aria2Version() => object.toJson(),
      };

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2ErrorResponse implements Exception {
  final String? id;
  final Aria2Error? error;

  const Aria2ErrorResponse({this.id, this.error});

  factory Aria2ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Aria2ErrorResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable(createFactory: false)
class Aria2MulticallResponse {
  final String id;
  final List<dynamic> result;

  const Aria2MulticallResponse({required this.id, required this.result});

  factory Aria2MulticallResponse.fromJson(
    List<Aria2MethodName> methodNames,
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('result')) {
      final result = json['result'];
      if (result is List<dynamic>) {
        final List<dynamic> multiResult = [];

        for (final i in IterableZip([methodNames, result])) {
          final methodName = i[0] as Aria2MethodName;
          final value = i[1];

          if (value is Map<String, dynamic>) {
            multiResult.add(Aria2Error.fromJson(value));
          } else {
            switch (methodName) {
              case .addUri:
              case .addTorrent:
              case .remove:
              case .pause:
              case .forcePause:
              case .pauseAll:
              case .forcePauseAll:
              case .unpause:
              case .unpauseAll:
              case .forceRemove:
              case .changeOption:
              case .changeGlobalOption:
              case .purgeDownloadResult:
              case .removeDownloadResult:
              case .shutdown:
              case .forceShutdown:
              case .saveSession:
                multiResult.add((value as List).first as String);
                break;
              case .addMetalink:
              case .listMethods:
              case .listNotifications:
                final e = (value as List).first as List;
                multiResult.add(e.cast<String>());
                break;
              case .changePosition:
                multiResult.add((value as List).first as int);
                break;
              case .changeUri:
                final e = (value as List).first as List;
                multiResult.add(e.cast<int>());
                break;
              case .tellStatus:
              case .getOption:
              case .getGlobalOption:
              case .getVersion:
              case .getSessionInfo:
              case .getGlobalStat:
                multiResult.add(fromResult(methodName, (value as List).first));
                break;
              case .getPeers:
              case .getUris:
              case .getFiles:
              case .getServers:
              case .tellActive:
              case .tellWaiting:
              case .tellStopped:
                final e = (value as List).first as List;
                multiResult.add(
                  e.map((f) => fromResult(methodName, f)).toList(),
                );
                break;
              case .multicall:
                throw Exception('multicall is nested within multicall');
            }
          }
        }

        return Aria2MulticallResponse(
          id: json['id'] as String,
          result: multiResult,
        );
      }
    }

    throw Aria2ErrorResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => _$Aria2MulticallResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

class Aria2BatchcallResponse {
  final List<dynamic> responses;

  const Aria2BatchcallResponse({required this.responses});

  factory Aria2BatchcallResponse.fromJsonResponses(
    Map<Aria2MethodName, Map<String, dynamic>> jsonResponses,
  ) {
    final responses = <dynamic>[];
    for (final i in jsonResponses.entries) {
      if (i.value.containsKey('result')) {
        switch (i.key) {
          case .addUri:
          case .addTorrent:
          case .remove:
          case .pause:
          case .forcePause:
          case .pauseAll:
          case .forcePauseAll:
          case .unpause:
          case .unpauseAll:
          case .forceRemove:
          case .changeOption:
          case .changeGlobalOption:
          case .purgeDownloadResult:
          case .removeDownloadResult:
          case .shutdown:
          case .forceShutdown:
          case .saveSession:
            responses.add(Aria2StringResponse.fromJson(i.value));
            break;
          case .addMetalink:
          case .listMethods:
          case .listNotifications:
            responses.add(Aria2StringListResponse.fromJson(i.value));
            break;
          case .changePosition:
            responses.add(Aria2IntResponse.fromJson(i.value));
            break;
          case .changeUri:
            responses.add(Aria2IntListResponse.fromJson(i.value));
            break;
          case .tellStatus:
          case .getOption:
          case .getGlobalOption:
          case .getVersion:
          case .getSessionInfo:
          case .getGlobalStat:
            responses.add(Aria2ResultResponse.fromJson(i.key, i.value));
            break;
          case .getPeers:
          case .getUris:
          case .getFiles:
          case .getServers:
          case .tellActive:
          case .tellWaiting:
          case .tellStopped:
            responses.add(Aria2ResultListResponse.fromJson(i.key, i.value));
            break;
          case .multicall:
            throw Exception('multicall is nested within batchcall');
        }
      } else {
        responses.add(Aria2ErrorResponse.fromJson(i.value));
      }
    }
    return Aria2BatchcallResponse(responses: responses);
  }

  @override
  String toString() => responses.toString();
}

@JsonSerializable()
class Aria2NotificationResponse {
  final Aria2NotificationName method;
  @JsonKey(name: 'params')
  final List<Aria2Notification> data;

  const Aria2NotificationResponse({required this.method, required this.data});

  factory Aria2NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$Aria2NotificationResponseFromJson(json);

  @override
  int get hashCode => Object.hashAll([method, data]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2NotificationResponse &&
            method == other.method &&
            listEquality.equals(data, other.data));
  }

  Map<String, dynamic> toJson() => _$Aria2NotificationResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
