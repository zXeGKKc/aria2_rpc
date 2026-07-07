import 'package:aria2_rpc/src/_internal/consts.dart';
import 'package:aria2_rpc/src/_internal/extension.dart';
import 'package:aria2_rpc/src/enum.dart';
import 'package:aria2_rpc/src/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

sealed class Aria2Result {
  const Aria2Result();
}

@JsonSerializable()
class Aria2DownloadingFile extends Aria2Result {
  @JsonKey(fromJson: int.parse)
  final int index;
  final String path;
  @JsonKey(fromJson: int.parse)
  final int length;
  @JsonKey(fromJson: int.parse)
  final int completedLength;
  @JsonKey(fromJson: bool.parse)
  final bool selected;
  final List<Aria2DownloadingUri> uris;

  const Aria2DownloadingFile({
    required this.index,
    required this.path,
    required this.length,
    required this.completedLength,
    required this.selected,
    required this.uris,
  });

  factory Aria2DownloadingFile.fromJson(Map<String, dynamic> json) =>
      _$Aria2DownloadingFileFromJson(json);

  @override
  int get hashCode =>
      Object.hashAll([index, path, length, completedLength, selected, uris]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2DownloadingFile &&
            index == other.index &&
            path == other.path &&
            length == other.length &&
            completedLength == other.completedLength &&
            selected == other.selected &&
            listEquality.equals(uris, other.uris));
  }

  Map<String, dynamic> toJson() => _$Aria2DownloadingFileToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2DownloadingPeer extends Aria2Result {
  final String peerId;
  final String ip;
  final int port;
  final String bitfield;
  final bool amChoking;
  final bool peerChoking;
  final int downloadSpeed;
  final int uploadSpeed;
  final bool seeder;

  const Aria2DownloadingPeer({
    required this.peerId,
    required this.ip,
    required this.port,
    required this.bitfield,
    required this.amChoking,
    required this.peerChoking,
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.seeder,
  });

  factory Aria2DownloadingPeer.fromJson(Map<String, dynamic> json) =>
      _$Aria2DownloadingPeerFromJson(json);

  @override
  int get hashCode => Object.hashAll([
    peerId,
    ip,
    bitfield,
    amChoking,
    peerChoking,
    downloadSpeed,
    uploadSpeed,
    seeder,
  ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2DownloadingPeer &&
            peerId == other.peerId &&
            ip == other.ip &&
            bitfield == other.bitfield &&
            amChoking == other.amChoking &&
            peerChoking == other.peerChoking &&
            downloadSpeed == other.downloadSpeed &&
            uploadSpeed == other.uploadSpeed &&
            seeder == other.seeder);
  }

  Map<String, dynamic> toJson() => _$Aria2DownloadingPeerToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2DownloadingStatus extends Aria2Result {
  final String? gid;
  final Aria2DownloadingStatusStatus? status;
  final int? totalLength;
  final int? completedLength;
  final int? uploadLength;
  final String? bitfield;
  final int? downloadSpeed;
  final int? uploadSpeed;
  final String? infoHash;
  final int? numSeeders;
  final bool? seeder;
  final int? pieceLength;
  final int? numPieces;
  final int? connections;
  final int? errorCode;
  final String? errorMessage;
  final List<String>? followedBy;
  final String? following;
  final String? belongsTo;
  final String? dir;
  final List<Aria2DownloadingFile>? files;
  final Aria2BitTorrentData? bittorrent;
  final int? verifiedLength;
  final bool? verifyIntegrityPending;

  const Aria2DownloadingStatus({
    this.gid,
    this.status,
    this.totalLength,
    this.completedLength,
    this.uploadLength,
    this.bitfield,
    this.downloadSpeed,
    this.uploadSpeed,
    this.infoHash,
    this.numSeeders,
    this.seeder,
    this.pieceLength,
    this.numPieces,
    this.connections,
    this.errorCode,
    this.errorMessage,
    this.followedBy,
    this.following,
    this.belongsTo,
    this.dir,
    this.files,
    this.bittorrent,
    this.verifiedLength,
    this.verifyIntegrityPending,
  });

  factory Aria2DownloadingStatus.fromJson(Map<String, dynamic> json) =>
      _$Aria2DownloadingStatusFromJson(json);

  @override
  int get hashCode => Object.hashAll([
    gid,
    status,
    totalLength,
    completedLength,
    uploadLength,
    bitfield,
    downloadSpeed,
    uploadSpeed,
    infoHash,
    numSeeders,
    seeder,
    pieceLength,
    numPieces,
    connections,
    errorCode,
    errorMessage,
    followedBy,
    following,
    belongsTo,
    dir,
    files,
    bittorrent,
    verifiedLength,
    verifyIntegrityPending,
  ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2DownloadingStatus &&
            other.gid == gid &&
            other.status == status &&
            other.totalLength == totalLength &&
            other.completedLength == completedLength &&
            other.uploadLength == uploadLength &&
            other.bitfield == bitfield &&
            other.downloadSpeed == downloadSpeed &&
            other.uploadSpeed == uploadSpeed &&
            other.infoHash == infoHash &&
            other.numSeeders == numSeeders &&
            other.seeder == seeder &&
            other.pieceLength == pieceLength &&
            other.numPieces == numPieces &&
            other.connections == connections &&
            other.errorCode == errorCode &&
            other.errorMessage == errorMessage &&
            other.followedBy == followedBy &&
            other.following == following &&
            other.belongsTo == belongsTo &&
            other.dir == dir &&
            other.files == files &&
            other.bittorrent == bittorrent &&
            other.verifiedLength == verifiedLength &&
            other.verifyIntegrityPending == verifyIntegrityPending);
  }

  Map<String, dynamic> toJson() => _$Aria2DownloadingStatusToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2DownloadingUri extends Aria2Result {
  final String uri;
  final Aria2UriStatus status;

  const Aria2DownloadingUri({required this.uri, required this.status});

  factory Aria2DownloadingUri.fromJson(Map<String, dynamic> json) =>
      _$Aria2DownloadingUriFromJson(json);

  @override
  int get hashCode => Object.hashAll([uri, status]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2DownloadingUri &&
            uri == other.uri &&
            status == other.status);
  }

  Map<String, dynamic> toJson() => _$Aria2DownloadingUriToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable(includeIfNull: false)
class Aria2Option extends Aria2InputFileOption implements Aria2Result {
  @JsonKey(name: 'bt-max-open-files', fromJson: IntParser.tryParseIfNotNull)
  final int? btMaxOpenFiles;
  @JsonKey(name: 'download-result')
  final Aria2DownloadResult? downloadResult;
  @JsonKey(
    name: 'keep-unfinished-download-result',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? keepUnfinishedDownloadResult;
  @JsonKey(name: 'log')
  final String? log;
  @JsonKey(name: 'log-level')
  final Aria2LogLevel? logLevel;
  @JsonKey(
    name: 'max-concurrent-downloads',
    fromJson: IntParser.tryParseIfNotNull,
  )
  final int? maxConcurrentDownloads;
  @JsonKey(name: 'max-download-result', fromJson: IntParser.tryParseIfNotNull)
  final int? maxDownloadResult;
  @JsonKey(name: 'max-overall-download-limit')
  final String? maxOverallDownloadLimit;
  @JsonKey(name: 'max-overall-upload-limit')
  final String? maxOverallUploadLimit;
  @JsonKey(name: 'optimize-concurrent-downloads', fromJson: _optimizeParse)
  final dynamic optimizeConcurrentDownloads;
  @JsonKey(name: 'save-cookies')
  final String? saveCookies;
  @JsonKey(name: 'save-session')
  final String? saveSession;
  @JsonKey(name: 'server-stat-of')
  final String? serverStatOf;

  const Aria2Option({
    super.allProxy,
    super.allProxyPasswd,
    super.allProxyUser,
    super.allowOverwrite,
    super.allowPieceLengthChange,
    super.alwaysResume,
    super.asyncDns,
    super.autoFileRenaming,
    super.btEnableHookAfterHashCheck,
    super.btEnableLpd,
    super.btExcludeTracker,
    super.btExternalIP,
    super.btForceEncryption,
    super.btHashCheckSeed,
    super.btLoadSavedMetadata,
    super.btMaxPeers,
    super.btMetadataOnly,
    super.btMinCryptoLevel,
    super.btPrioritizePiece,
    super.btRemoveUnselectedFile,
    super.btRequestPeerSpeedLimit,
    super.btRequireCrypto,
    super.btSaveMetadata,
    super.btSeedUnverified,
    super.btStopTimeout,
    super.btTracker,
    super.btTrackerConnectTimeout,
    super.btTrackerInterval,
    super.btTrackerTimeout,
    super.checkIntegrity,
    super.checksum,
    super.conditionalGet,
    super.connectTimeout,
    super.contentDispositionDefaultUtf8,
    super.aria2Continue,
    super.dir,
    // super.dryRun,
    super.enableHttpKeepAlive,
    super.enableHttpPipelining,
    super.enableMmap,
    super.enablePeerExchange,
    super.fileAllocation,
    super.followMetalink,
    super.followTorrent,
    super.forceSave,
    super.ftpPasswd,
    super.ftpPasv,
    super.ftpProxy,
    super.ftpProxyPasswd,
    super.ftpProxyUser,
    super.ftpReuseConnection,
    super.ftpType,
    super.ftpUser,
    super.gid,
    super.hashCheckOnly,
    super.header,
    super.httpAcceptGzip,
    super.httpAuthChallenge,
    super.httpNoCache,
    super.httpPasswd,
    super.httpProxy,
    super.httpProxyPasswd,
    super.httpProxyUser,
    super.httpUser,
    super.httpsProxy,
    super.httpsProxyPasswd,
    super.httpsProxyUser,
    super.indexOut,
    super.lowestSpeedLimit,
    super.maxConnectionPerServer,
    super.maxDownloadLimit,
    super.maxFileNotFound,
    super.maxMmapLimit,
    super.maxResumeFailureTries,
    super.maxTries,
    super.maxUploadLimit,
    // super.metalinkBaseUri,
    super.metalinkEnableUniqueProtocol,
    super.metalinkLanguage,
    super.metalinkLocation,
    super.metalinkOS,
    super.metalinkPreferredProtocol,
    super.metalinkVersion,
    super.minSplitSize,
    super.noFileAllocationLimit,
    super.noNetrc,
    super.noProxy,
    super.out,
    // super.parameterizedUri,
    // super.pause,
    super.pauseMetadata,
    // super.pieceLength,
    super.proxyMethod,
    super.realtimeChunkChecksum,
    super.referer,
    super.remoteTime,
    super.removeControlFile,
    super.retryWait,
    super.reuseUri,
    // super.rpcSaveUploadMetadata,
    super.seedRatio,
    super.seedTime,
    super.selectFile,
    super.split,
    super.sshHostKeyMd,
    super.streamPieceSelector,
    super.timeout,
    super.uriSelector,
    super.useHead,
    super.userAgent,
  }) : btMaxOpenFiles = null,
       downloadResult = null,
       keepUnfinishedDownloadResult = null,
       log = null,
       logLevel = null,
       maxConcurrentDownloads = null,
       maxDownloadResult = null,
       maxOverallDownloadLimit = null,
       maxOverallUploadLimit = null,
       optimizeConcurrentDownloads = null,
       saveCookies = null,
       saveSession = null,
       serverStatOf = null;

  factory Aria2Option.fromJson(Map<String, dynamic> json) =>
      _$Aria2OptionFromJson(json);

  const Aria2Option.global({
    super.allProxy,
    super.allProxyPasswd,
    super.allProxyUser,
    super.allowOverwrite,
    super.allowPieceLengthChange,
    super.alwaysResume,
    super.asyncDns,
    super.autoFileRenaming,
    super.btEnableHookAfterHashCheck,
    super.btEnableLpd,
    super.btExcludeTracker,
    super.btExternalIP,
    super.btForceEncryption,
    super.btHashCheckSeed,
    super.btLoadSavedMetadata,
    super.btMaxPeers,
    super.btMetadataOnly,
    super.btMinCryptoLevel,
    super.btPrioritizePiece,
    super.btRemoveUnselectedFile,
    super.btRequestPeerSpeedLimit,
    super.btRequireCrypto,
    super.btSaveMetadata,
    super.btSeedUnverified,
    super.btStopTimeout,
    super.btTracker,
    super.btTrackerConnectTimeout,
    super.btTrackerInterval,
    super.btTrackerTimeout,
    super.checkIntegrity,
    // super.checksum,
    super.conditionalGet,
    super.connectTimeout,
    super.contentDispositionDefaultUtf8,
    super.aria2Continue,
    super.dir,
    super.dryRun,
    super.enableHttpKeepAlive,
    super.enableHttpPipelining,
    super.enableMmap,
    super.enablePeerExchange,
    super.fileAllocation,
    super.followMetalink,
    super.followTorrent,
    super.forceSave,
    super.ftpPasswd,
    super.ftpPasv,
    super.ftpProxy,
    super.ftpProxyPasswd,
    super.ftpProxyUser,
    super.ftpReuseConnection,
    super.ftpType,
    super.ftpUser,
    super.gid,
    super.hashCheckOnly,
    super.header,
    super.httpAcceptGzip,
    super.httpAuthChallenge,
    super.httpNoCache,
    super.httpPasswd,
    super.httpProxy,
    super.httpProxyPasswd,
    super.httpProxyUser,
    super.httpUser,
    super.httpsProxy,
    super.httpsProxyPasswd,
    super.httpsProxyUser,
    // super.indexOut,
    super.lowestSpeedLimit,
    super.maxConnectionPerServer,
    super.maxDownloadLimit,
    super.maxFileNotFound,
    super.maxMmapLimit,
    super.maxResumeFailureTries,
    super.maxTries,
    super.maxUploadLimit,
    super.metalinkBaseUri,
    super.metalinkEnableUniqueProtocol,
    super.metalinkLanguage,
    super.metalinkLocation,
    super.metalinkOS,
    super.metalinkPreferredProtocol,
    super.metalinkVersion,
    super.minSplitSize,
    super.noFileAllocationLimit,
    super.noNetrc,
    super.noProxy,
    // super.out,
    super.parameterizedUri,
    // super.pause,
    super.pauseMetadata,
    super.pieceLength,
    super.proxyMethod,
    super.realtimeChunkChecksum,
    super.referer,
    super.remoteTime,
    super.removeControlFile,
    super.retryWait,
    super.reuseUri,
    super.rpcSaveUploadMetadata,
    super.seedRatio,
    super.seedTime,
    // super.selectFile,
    super.split,
    super.sshHostKeyMd,
    super.streamPieceSelector,
    super.timeout,
    super.uriSelector,
    super.useHead,
    super.userAgent,
    this.btMaxOpenFiles,
    this.downloadResult,
    this.keepUnfinishedDownloadResult,
    this.log,
    this.logLevel,
    this.maxConcurrentDownloads,
    this.maxDownloadResult,
    this.maxOverallDownloadLimit,
    this.maxOverallUploadLimit,
    this.optimizeConcurrentDownloads,
    this.saveCookies,
    this.saveSession,
    this.serverStatOf,
  });

  @override
  int get hashCode => Object.hashAll([
    super.hashCode,
    btMaxOpenFiles,
    downloadResult,
    keepUnfinishedDownloadResult,
    log,
    logLevel,
    maxConcurrentDownloads,
    maxDownloadResult,
    maxOverallDownloadLimit,
    maxOverallUploadLimit,
    saveCookies,
    saveSession,
    serverStatOf,
  ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (super == other &&
            other is Aria2Option &&
            btMaxOpenFiles == other.btMaxOpenFiles &&
            downloadResult == other.downloadResult &&
            keepUnfinishedDownloadResult ==
                other.keepUnfinishedDownloadResult &&
            log == other.log &&
            logLevel == other.logLevel &&
            maxConcurrentDownloads == other.maxConcurrentDownloads &&
            maxDownloadResult == other.maxDownloadResult &&
            maxOverallDownloadLimit == other.maxOverallDownloadLimit &&
            maxOverallUploadLimit == other.maxOverallUploadLimit &&
            optimizeConcurrentDownloads == other.optimizeConcurrentDownloads &&
            saveCookies == other.saveCookies &&
            saveSession == other.saveSession &&
            serverStatOf == other.serverStatOf);
  }

  @override
  Map<String, dynamic> toJson() => _$Aria2OptionToJson(this);

  @override
  String toString() => toJson().toString();

  static dynamic _optimizeParse(dynamic value) {
    final boolean = bool.tryParse(value);
    if (boolean != null) return boolean;
    return value.toString();
  }
}

@JsonSerializable()
class Aria2LinkedServer extends Aria2Result {
  @JsonKey(fromJson: int.parse)
  final int index;
  final List<Aria2LinkedServerInfo> servers;

  const Aria2LinkedServer({required this.index, required this.servers});

  factory Aria2LinkedServer.fromJson(Map<String, dynamic> json) =>
      _$Aria2LinkedServerFromJson(json);

  @override
  int get hashCode => Object.hashAll([index, servers]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2LinkedServer &&
            index == other.index &&
            listEquality.equals(servers, other.servers));
  }

  Map<String, dynamic> toJson() => _$Aria2LinkedServerToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2SessionInfo extends Aria2Result {
  final String sessionId;

  const Aria2SessionInfo({required this.sessionId});

  factory Aria2SessionInfo.fromJson(Map<String, dynamic> json) =>
      _$Aria2SessionInfoFromJson(json);

  @override
  int get hashCode => sessionId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2SessionInfo && sessionId == other.sessionId);
  }

  Map<String, dynamic> toJson() => _$Aria2SessionInfoToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2GlobalStat extends Aria2Result {
  @JsonKey(fromJson: int.parse)
  final int downloadSpeed;
  @JsonKey(fromJson: int.parse)
  final int uploadSpeed;
  @JsonKey(fromJson: int.parse)
  final int numActive;
  @JsonKey(fromJson: int.parse)
  final int numWaiting;
  @JsonKey(fromJson: int.parse)
  final int numStopped;
  @JsonKey(fromJson: int.parse)
  final int numStoppedTotal;

  const Aria2GlobalStat({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.numActive,
    required this.numWaiting,
    required this.numStopped,
    required this.numStoppedTotal,
  });

  factory Aria2GlobalStat.fromJson(Map<String, dynamic> json) =>
      _$Aria2GlobalStatFromJson(json);

  @override
  int get hashCode => Object.hashAll([
    downloadSpeed,
    uploadSpeed,
    numActive,
    numWaiting,
    numStopped,
    numStoppedTotal,
  ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2GlobalStat &&
            other.downloadSpeed == downloadSpeed &&
            other.uploadSpeed == uploadSpeed &&
            other.numActive == numActive &&
            other.numWaiting == numWaiting &&
            other.numStopped == numStopped &&
            other.numStoppedTotal == numStoppedTotal);
  }

  Map<String, dynamic> toJson() => _$Aria2GlobalStatToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2Version extends Aria2Result {
  final String version;
  final List<String> enabledFeatures;

  const Aria2Version({required this.version, required this.enabledFeatures});

  factory Aria2Version.fromJson(Map<String, dynamic> json) =>
      _$Aria2VersionFromJson(json);

  @override
  int get hashCode => Object.hashAll([version, enabledFeatures]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2Version &&
            version == other.version &&
            listEquality.equals(enabledFeatures, enabledFeatures));
  }

  Map<String, dynamic> toJson() => _$Aria2VersionToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2Error {
  final int code;
  final String message;

  const Aria2Error({required this.code, required this.message});

  factory Aria2Error.fromJson(Map<String, dynamic> json) =>
      _$Aria2ErrorFromJson(json);

  @override
  int get hashCode => Object.hashAll([code, message]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2Error && code == other.code && message == other.message);
  }

  Map<String, dynamic> toJson() => _$Aria2ErrorToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2Notification {
  final String gid;

  const Aria2Notification({required this.gid});

  factory Aria2Notification.fromJson(Map<String, dynamic> json) =>
      _$Aria2NotificationFromJson(json);

  @override
  int get hashCode => gid.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2Notification && gid == other.gid);
  }

  Map<String, dynamic> toJson() => _$Aria2NotificationToJson(this);

  @override
  String toString() => toJson().toString();
}
