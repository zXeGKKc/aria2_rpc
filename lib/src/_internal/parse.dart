import 'package:aria2_rpc/src/enum.dart';
import 'package:aria2_rpc/src/result.dart';

extension DoubleParser on double {
  static double? tryParseIfNotNull(String? source) {
    return source != null ? double.tryParse(source) : null;
  }

  static double? parseIfNotNull(String? source) {
    return source != null ? double.parse(source) : null;
  }
}

extension IntParser on int {
  static int? tryParseIfNotNull(String? source) {
    return source != null ? int.tryParse(source) : null;
  }

  static int? parseIfNotNull(String? source) {
    return source != null ? int.parse(source) : null;
  }
}

extension BoolParser on bool {
  static bool? tryParseIfNotNull(String? source) {
    return source != null ? bool.tryParse(source) : null;
  }

  static bool? parseIfNotNull(String? source) {
    return source != null ? bool.parse(source) : null;
  }
}

dynamic optimizeParse(dynamic value) {
  final boolean = bool.tryParse(value);
  if (boolean != null) return boolean;
  return value.toString();
}

T resultParse<T extends Aria2Result>(Aria2MethodName methodName, Object? json) {
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
