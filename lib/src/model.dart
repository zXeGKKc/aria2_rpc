import 'dart:collection';

import 'package:aria2_rpc/src/_internal/consts.dart';
import 'package:aria2_rpc/src/_internal/extension.dart';
import 'package:aria2_rpc/src/enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Aria2BitTorrentData {
  final List<String> announceList;
  final String comment;
  final int creationDate;
  final Aria2BitTorrentMode mode;
  final Aria2BitTorrentInfo info;

  const Aria2BitTorrentData({
    required this.announceList,
    required this.comment,
    required this.creationDate,
    required this.mode,
    required this.info,
  });

  factory Aria2BitTorrentData.fromJson(Map<String, dynamic> json) =>
      _$Aria2BitTorrentDataFromJson(json);

  @override
  int get hashCode =>
      Object.hashAll([announceList, comment, creationDate, mode, info]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2BitTorrentData &&
            listEquality.equals(announceList, other.announceList) &&
            comment == other.comment &&
            creationDate == other.creationDate &&
            mode == other.mode &&
            info == other.info);
  }

  Map<String, dynamic> toJson() => _$Aria2BitTorrentDataToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2BitTorrentInfo {
  final String name;

  const Aria2BitTorrentInfo({required this.name});

  factory Aria2BitTorrentInfo.fromJson(Map<String, dynamic> json) =>
      _$Aria2BitTorrentInfoFromJson(json);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2BitTorrentInfo && name == other.name);
  }

  Map<String, dynamic> toJson() => _$Aria2BitTorrentInfoToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2BtPrioritizePieceOption {
  final String? head;
  final String? tail;

  const Aria2BtPrioritizePieceOption({this.head, this.tail});

  factory Aria2BtPrioritizePieceOption.fromJson(Map<String, dynamic> json) =>
      _$Aria2BtPrioritizePieceOptionFromJson(json);

  @override
  int get hashCode => Object.hashAll([head, tail]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2BtPrioritizePieceOption &&
            head == other.head &&
            tail == other.tail);
  }

  Map<String, dynamic> toJson() => _$Aria2BtPrioritizePieceOptionToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable(includeIfNull: false)
class Aria2InputFileOption {
  @JsonKey(name: 'all-proxy')
  final String? allProxy;
  @JsonKey(name: 'all-proxy-passwd')
  final String? allProxyPasswd;
  @JsonKey(name: 'all-proxy-user')
  final String? allProxyUser;
  @JsonKey(name: 'allow-overwrite', fromJson: BoolParser.tryParseIfNotNull)
  final bool? allowOverwrite;
  @JsonKey(
    name: 'allow-piece-length-change',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? allowPieceLengthChange;
  @JsonKey(name: 'always-resume', fromJson: BoolParser.tryParseIfNotNull)
  final bool? alwaysResume;
  @JsonKey(name: 'async-dns', fromJson: BoolParser.tryParseIfNotNull)
  final bool? asyncDns;
  @JsonKey(name: 'auto-file-renaming', fromJson: BoolParser.tryParseIfNotNull)
  final bool? autoFileRenaming;
  @JsonKey(
    name: 'bt-enable-hook-after-hash-check',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? btEnableHookAfterHashCheck;
  @JsonKey(name: 'bt-enable-lpd', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btEnableLpd;
  @JsonKey(name: 'bt-exclude-tracker')
  final List<String>? btExcludeTracker;
  @JsonKey(name: 'bt-external-ip')
  final String? btExternalIP;
  @JsonKey(name: 'bt-force-encryption', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btForceEncryption;
  @JsonKey(name: 'bt-hash-check-seed', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btHashCheckSeed;
  @JsonKey(
    name: 'bt-load-saved-metadata',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? btLoadSavedMetadata;
  @JsonKey(name: 'bt-max-peers', fromJson: IntParser.tryParseIfNotNull)
  final int? btMaxPeers;
  @JsonKey(name: 'bt-metadata-only', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btMetadataOnly;
  @JsonKey(name: 'bt-min-crypto-level')
  final Aria2BtCryptoLevel? btMinCryptoLevel;
  @JsonKey(name: 'bt-prioritize-piece')
  final Aria2BtPrioritizePieceOption? btPrioritizePiece;
  @JsonKey(
    name: 'bt-remove-unselected-file',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? btRemoveUnselectedFile;
  @JsonKey(name: 'bt-request-peer-speed-limit')
  final String? btRequestPeerSpeedLimit;
  @JsonKey(name: 'bt-require-crypto', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btRequireCrypto;
  @JsonKey(name: 'bt-save-metadata', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btSaveMetadata;
  @JsonKey(name: 'bt-seed-unverified', fromJson: BoolParser.tryParseIfNotNull)
  final bool? btSeedUnverified;
  @JsonKey(name: 'bt-stop-timeout', fromJson: IntParser.tryParseIfNotNull)
  final int? btStopTimeout;
  @JsonKey(name: 'bt-tracker', fromJson: btTrackerParse)
  final List<String>? btTracker;
  @JsonKey(
    name: 'bt-tracker-connect-timeout',
    fromJson: IntParser.tryParseIfNotNull,
  )
  final int? btTrackerConnectTimeout;
  @JsonKey(name: 'bt-tracker-interval', fromJson: IntParser.tryParseIfNotNull)
  final int? btTrackerInterval;
  @JsonKey(name: 'bt-tracker-timeout', fromJson: IntParser.tryParseIfNotNull)
  final int? btTrackerTimeout;
  @JsonKey(name: 'check-integrity', fromJson: BoolParser.tryParseIfNotNull)
  final bool? checkIntegrity;
  @JsonKey(name: 'checksum', toJson: Aria2HashOption.toInput)
  final Aria2HashOption? checksum;
  @JsonKey(name: 'conditional-get', fromJson: BoolParser.tryParseIfNotNull)
  final bool? conditionalGet;
  @JsonKey(name: 'connect-timeout', fromJson: IntParser.tryParseIfNotNull)
  final int? connectTimeout;
  @JsonKey(
    name: 'content-disposition-default-utf8',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? contentDispositionDefaultUtf8;
  @JsonKey(name: 'continue', fromJson: BoolParser.tryParseIfNotNull)
  final bool? aria2Continue;
  @JsonKey(name: 'dir')
  final String? dir;
  @JsonKey(name: 'dry-run', fromJson: BoolParser.tryParseIfNotNull)
  final bool? dryRun;
  @JsonKey(
    name: 'enable-http-keep-alive',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? enableHttpKeepAlive;
  @JsonKey(
    name: 'enable-http-pipelining',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? enableHttpPipelining;
  @JsonKey(name: 'enable-mmap', fromJson: BoolParser.tryParseIfNotNull)
  final bool? enableMmap;
  @JsonKey(name: 'enable-peer-exchange', fromJson: BoolParser.tryParseIfNotNull)
  final bool? enablePeerExchange;
  @JsonKey(name: 'file-allocation')
  final Aria2FileAllocationMethod? fileAllocation;
  @JsonKey(name: 'follow-metalink')
  final Aria2Symbol? followMetalink;
  @JsonKey(name: 'follow-torrent')
  final Aria2Symbol? followTorrent;
  @JsonKey(name: 'force-save', fromJson: BoolParser.tryParseIfNotNull)
  final bool? forceSave;
  @JsonKey(name: 'ftp-passwd')
  final String? ftpPasswd;
  @JsonKey(name: 'ftp-pasv', fromJson: BoolParser.tryParseIfNotNull)
  final bool? ftpPasv;
  @JsonKey(name: 'ftp-proxy')
  final String? ftpProxy;
  @JsonKey(name: 'ftp-proxy-passwd')
  final String? ftpProxyPasswd;
  @JsonKey(name: 'ftp-proxy-user')
  final String? ftpProxyUser;
  @JsonKey(name: 'ftp-reuse-connection', fromJson: BoolParser.tryParseIfNotNull)
  final bool? ftpReuseConnection;
  @JsonKey(name: 'ftp-type')
  final Aria2FTPType? ftpType;
  @JsonKey(name: 'ftp-user')
  final String? ftpUser;
  @JsonKey(name: 'gid')
  final String? gid;
  @JsonKey(name: 'hash-check-only', fromJson: BoolParser.tryParseIfNotNull)
  final bool? hashCheckOnly;
  @JsonKey(name: 'header')
  final List<String>? header;
  @JsonKey(name: 'http-accept-gzip', fromJson: BoolParser.tryParseIfNotNull)
  final bool? httpAcceptGzip;
  @JsonKey(name: 'http-auth-challenge', fromJson: BoolParser.tryParseIfNotNull)
  final bool? httpAuthChallenge;
  @JsonKey(name: 'http-no-cache', fromJson: BoolParser.tryParseIfNotNull)
  final bool? httpNoCache;
  @JsonKey(name: 'http-passwd')
  final String? httpPasswd;
  @JsonKey(name: 'http-proxy')
  final String? httpProxy;
  @JsonKey(name: 'http-proxy-passwd')
  final String? httpProxyPasswd;
  @JsonKey(name: 'http-proxy-user')
  final String? httpProxyUser;
  @JsonKey(name: 'http-user')
  final String? httpUser;
  @JsonKey(name: 'https-proxy')
  final String? httpsProxy;
  @JsonKey(name: 'https-proxy-passwd')
  final String? httpsProxyPasswd;
  @JsonKey(name: 'https-proxy-user')
  final String? httpsProxyUser;
  @JsonKey(name: 'index-out')
  final Map<int, String>? indexOut;
  @JsonKey(name: 'lowest-speed-limit')
  final String? lowestSpeedLimit;
  @JsonKey(
    name: 'max-connection-per-server',
    fromJson: IntParser.tryParseIfNotNull,
  )
  final int? maxConnectionPerServer;
  @JsonKey(name: 'max-download-limit')
  final String? maxDownloadLimit;
  @JsonKey(name: 'max-file-not-found', fromJson: IntParser.tryParseIfNotNull)
  final int? maxFileNotFound;
  @JsonKey(name: 'max-mmap-limit')
  final String? maxMmapLimit;
  @JsonKey(
    name: 'max-resume-failure-tries',
    fromJson: IntParser.tryParseIfNotNull,
  )
  final int? maxResumeFailureTries;
  @JsonKey(name: 'max-tries', fromJson: IntParser.tryParseIfNotNull)
  final int? maxTries;
  @JsonKey(name: 'max-upload-limit')
  final String? maxUploadLimit;
  @JsonKey(name: 'metalink-base-uri')
  final String? metalinkBaseUri;
  @JsonKey(
    name: 'metalink-enable-unique-protocol',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? metalinkEnableUniqueProtocol;
  @JsonKey(name: 'metalink-language')
  final String? metalinkLanguage;
  @JsonKey(name: 'metalink-location')
  final List<String>? metalinkLocation;
  @JsonKey(name: 'metalink-os')
  final String? metalinkOS;
  @JsonKey(name: 'metalink-preferred-protocol')
  final Aria2MetalinkPreferredProtocol? metalinkPreferredProtocol;
  @JsonKey(name: 'metalink-version')
  final String? metalinkVersion;
  @JsonKey(name: 'min-split-size')
  final String? minSplitSize;
  @JsonKey(name: 'no-file-allocation-limit')
  final String? noFileAllocationLimit;
  @JsonKey(name: 'no-netrc', fromJson: BoolParser.tryParseIfNotNull)
  final bool? noNetrc;
  @JsonKey(name: 'no-proxy')
  final List<String>? noProxy;
  @JsonKey(name: 'out')
  final String? out;
  @JsonKey(name: 'parameterized-uri', fromJson: BoolParser.tryParseIfNotNull)
  final bool? parameterizedUri;
  @JsonKey(name: 'pause', fromJson: BoolParser.tryParseIfNotNull)
  final bool? pause;
  @JsonKey(name: 'pause-metadata', fromJson: BoolParser.tryParseIfNotNull)
  final bool? pauseMetadata;
  @JsonKey(name: 'piece-length')
  final String? pieceLength;
  @JsonKey(name: 'proxy-method')
  final Aria2ProxyMethod? proxyMethod;
  @JsonKey(
    name: 'realtime-chunk-checksum',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? realtimeChunkChecksum;
  @JsonKey(name: 'referer')
  final String? referer;
  @JsonKey(name: 'remote-time', fromJson: BoolParser.tryParseIfNotNull)
  final bool? remoteTime;
  @JsonKey(name: 'remove-control-file', fromJson: BoolParser.tryParseIfNotNull)
  final bool? removeControlFile;
  @JsonKey(name: 'retry-wait', fromJson: IntParser.tryParseIfNotNull)
  final int? retryWait;
  @JsonKey(name: 'reuse-uri', fromJson: BoolParser.tryParseIfNotNull)
  final bool? reuseUri;
  @JsonKey(
    name: 'rpc-save-upload-metadata',
    fromJson: BoolParser.tryParseIfNotNull,
  )
  final bool? rpcSaveUploadMetadata;
  @JsonKey(name: 'seed-ratio', fromJson: DoubleParser.tryParseIfNotNull)
  final double? seedRatio;
  @JsonKey(name: 'seed-time', fromJson: DoubleParser.tryParseIfNotNull)
  final double? seedTime;
  @JsonKey(name: 'select-file')
  final String? selectFile;
  @JsonKey(name: 'split', fromJson: IntParser.tryParseIfNotNull)
  final int? split;
  @JsonKey(name: 'ssh-host-key-md', toJson: Aria2HashOption.toInput)
  final Aria2HashOption? sshHostKeyMd;
  @JsonKey(name: 'stream-piece-selector')
  final Aria2StreamPieceSelector? streamPieceSelector;
  @JsonKey(name: 'timeout', fromJson: IntParser.tryParseIfNotNull)
  final int? timeout;
  @JsonKey(name: 'uri-selector')
  final Aria2UriSelector? uriSelector;
  @JsonKey(name: 'use-head', fromJson: BoolParser.tryParseIfNotNull)
  final bool? useHead;
  @JsonKey(name: 'user-agent')
  final String? userAgent;

  const Aria2InputFileOption({
    this.allProxy,
    this.allProxyPasswd,
    this.allProxyUser,
    this.allowOverwrite,
    this.allowPieceLengthChange,
    this.alwaysResume,
    this.asyncDns,
    this.autoFileRenaming,
    this.btEnableHookAfterHashCheck,
    this.btEnableLpd,
    this.btExcludeTracker,
    this.btExternalIP,
    this.btForceEncryption,
    this.btHashCheckSeed,
    this.btLoadSavedMetadata,
    this.btMaxPeers,
    this.btMetadataOnly,
    this.btMinCryptoLevel,
    this.btPrioritizePiece,
    this.btRemoveUnselectedFile,
    this.btRequestPeerSpeedLimit,
    this.btRequireCrypto,
    this.btSaveMetadata,
    this.btSeedUnverified,
    this.btStopTimeout,
    this.btTracker,
    this.btTrackerConnectTimeout,
    this.btTrackerInterval,
    this.btTrackerTimeout,
    this.checkIntegrity,
    this.checksum,
    this.conditionalGet,
    this.connectTimeout,
    this.contentDispositionDefaultUtf8,
    this.aria2Continue,
    this.dir,
    this.dryRun,
    this.enableHttpKeepAlive,
    this.enableHttpPipelining,
    this.enableMmap,
    this.enablePeerExchange,
    this.fileAllocation,
    this.followMetalink,
    this.followTorrent,
    this.forceSave,
    this.ftpPasswd,
    this.ftpPasv,
    this.ftpProxy,
    this.ftpProxyPasswd,
    this.ftpProxyUser,
    this.ftpReuseConnection,
    this.ftpType,
    this.ftpUser,
    this.gid,
    this.hashCheckOnly,
    this.header,
    this.httpAcceptGzip,
    this.httpAuthChallenge,
    this.httpNoCache,
    this.httpPasswd,
    this.httpProxy,
    this.httpProxyPasswd,
    this.httpProxyUser,
    this.httpUser,
    this.httpsProxy,
    this.httpsProxyPasswd,
    this.httpsProxyUser,
    this.indexOut,
    this.lowestSpeedLimit,
    this.maxConnectionPerServer,
    this.maxDownloadLimit,
    this.maxFileNotFound,
    this.maxMmapLimit,
    this.maxResumeFailureTries,
    this.maxTries,
    this.maxUploadLimit,
    this.metalinkBaseUri,
    this.metalinkEnableUniqueProtocol,
    this.metalinkLanguage,
    this.metalinkLocation,
    this.metalinkOS,
    this.metalinkPreferredProtocol,
    this.metalinkVersion,
    this.minSplitSize,
    this.noFileAllocationLimit,
    this.noNetrc,
    this.noProxy,
    this.out,
    this.parameterizedUri,
    this.pause,
    this.pauseMetadata,
    this.pieceLength,
    this.proxyMethod,
    this.realtimeChunkChecksum,
    this.referer,
    this.remoteTime,
    this.removeControlFile,
    this.retryWait,
    this.reuseUri,
    this.rpcSaveUploadMetadata,
    this.seedRatio,
    this.seedTime,
    this.selectFile,
    this.split,
    this.sshHostKeyMd,
    this.streamPieceSelector,
    this.timeout,
    this.uriSelector,
    this.useHead,
    this.userAgent,
  });

  factory Aria2InputFileOption.fromJson(Map<String, dynamic> json) =>
      _$Aria2InputFileOptionFromJson(json);

  @override
  int get hashCode => Object.hashAll([
    allProxy,
    allProxyPasswd,
    allProxyUser,
    allowOverwrite,
    allowPieceLengthChange,
    alwaysResume,
    asyncDns,
    autoFileRenaming,
    btEnableHookAfterHashCheck,
    btEnableLpd,
    btExcludeTracker,
    btExternalIP,
    btForceEncryption,
    btHashCheckSeed,
    btLoadSavedMetadata,
    btMaxPeers,
    btMetadataOnly,
    btMinCryptoLevel,
    btPrioritizePiece,
    btRemoveUnselectedFile,
    btRequestPeerSpeedLimit,
    btRequireCrypto,
    btSaveMetadata,
    btSeedUnverified,
    btStopTimeout,
    btTracker,
    btTrackerConnectTimeout,
    btTrackerInterval,
    btTrackerTimeout,
    checkIntegrity,
    checksum,
    conditionalGet,
    connectTimeout,
    contentDispositionDefaultUtf8,
    aria2Continue,
    dir,
    dryRun,
    enableHttpKeepAlive,
    enableHttpPipelining,
    enableMmap,
    enablePeerExchange,
    fileAllocation,
    followMetalink,
    followTorrent,
    forceSave,
    ftpPasswd,
    ftpPasv,
    ftpProxy,
    ftpProxyPasswd,
    ftpProxyUser,
    ftpReuseConnection,
    ftpType,
    ftpUser,
    gid,
    hashCheckOnly,
    header,
    httpAcceptGzip,
    httpAuthChallenge,
    httpNoCache,
    httpPasswd,
    httpProxy,
    httpProxyPasswd,
    httpProxyUser,
    httpUser,
    httpsProxy,
    httpsProxyPasswd,
    httpsProxyUser,
    indexOut,
    lowestSpeedLimit,
    maxConnectionPerServer,
    maxDownloadLimit,
    maxFileNotFound,
    maxMmapLimit,
    maxResumeFailureTries,
    maxTries,
    maxUploadLimit,
    metalinkBaseUri,
    metalinkEnableUniqueProtocol,
    metalinkLanguage,
    metalinkLocation,
    metalinkOS,
    metalinkPreferredProtocol,
    metalinkVersion,
    minSplitSize,
    noFileAllocationLimit,
    noNetrc,
    noProxy,
    out,
    parameterizedUri,
    pause,
    pauseMetadata,
    pieceLength,
    proxyMethod,
    realtimeChunkChecksum,
    referer,
    remoteTime,
    removeControlFile,
    retryWait,
    reuseUri,
    rpcSaveUploadMetadata,
    seedRatio,
    seedTime,
    selectFile,
    split,
    sshHostKeyMd,
    streamPieceSelector,
    timeout,
    uriSelector,
    useHead,
    userAgent,
  ]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2InputFileOption &&
            allProxy == other.allProxy &&
            allProxyPasswd == other.allProxyPasswd &&
            allProxyUser == other.allProxyUser &&
            allowOverwrite == other.allowOverwrite &&
            allowPieceLengthChange == other.allowPieceLengthChange &&
            alwaysResume == other.alwaysResume &&
            asyncDns == other.asyncDns &&
            autoFileRenaming == other.autoFileRenaming &&
            btEnableHookAfterHashCheck == other.btEnableHookAfterHashCheck &&
            btEnableLpd == other.btEnableLpd &&
            btExcludeTracker == other.btExcludeTracker &&
            btExternalIP == other.btExternalIP &&
            btForceEncryption == other.btForceEncryption &&
            btHashCheckSeed == other.btHashCheckSeed &&
            btLoadSavedMetadata == other.btLoadSavedMetadata &&
            btMaxPeers == other.btMaxPeers &&
            btMetadataOnly == other.btMetadataOnly &&
            btMinCryptoLevel == other.btMinCryptoLevel &&
            btPrioritizePiece == other.btPrioritizePiece &&
            btRemoveUnselectedFile == other.btRemoveUnselectedFile &&
            btRequestPeerSpeedLimit == other.btRequestPeerSpeedLimit &&
            btRequireCrypto == other.btRequireCrypto &&
            btSaveMetadata == other.btSaveMetadata &&
            btSeedUnverified == other.btSeedUnverified &&
            btStopTimeout == other.btStopTimeout &&
            btTracker == other.btTracker &&
            btTrackerConnectTimeout == other.btTrackerConnectTimeout &&
            btTrackerInterval == other.btTrackerInterval &&
            btTrackerTimeout == other.btTrackerTimeout &&
            checkIntegrity == other.checkIntegrity &&
            checksum == other.checksum &&
            conditionalGet == other.conditionalGet &&
            connectTimeout == other.connectTimeout &&
            contentDispositionDefaultUtf8 ==
                other.contentDispositionDefaultUtf8 &&
            aria2Continue == other.aria2Continue &&
            dir == other.dir &&
            dryRun == other.dryRun &&
            enableHttpKeepAlive == other.enableHttpKeepAlive &&
            enableHttpPipelining == other.enableHttpPipelining &&
            enableMmap == other.enableMmap &&
            enablePeerExchange == other.enablePeerExchange &&
            fileAllocation == other.fileAllocation &&
            followMetalink == other.followMetalink &&
            followTorrent == other.followTorrent &&
            forceSave == other.forceSave &&
            ftpPasswd == other.ftpPasswd &&
            ftpPasv == other.ftpPasv &&
            ftpProxy == other.ftpProxy &&
            ftpProxyPasswd == other.ftpProxyPasswd &&
            ftpProxyUser == other.ftpProxyUser &&
            ftpReuseConnection == other.ftpReuseConnection &&
            ftpType == other.ftpType &&
            ftpUser == other.ftpUser &&
            gid == other.gid &&
            hashCheckOnly == other.hashCheckOnly &&
            header == other.header &&
            httpAcceptGzip == other.httpAcceptGzip &&
            httpAuthChallenge == other.httpAuthChallenge &&
            httpNoCache == other.httpNoCache &&
            httpPasswd == other.httpPasswd &&
            httpProxy == other.httpProxy &&
            httpProxyPasswd == other.httpProxyPasswd &&
            httpProxyUser == other.httpProxyUser &&
            httpUser == other.httpUser &&
            httpsProxy == other.httpsProxy &&
            httpsProxyPasswd == other.httpsProxyPasswd &&
            httpsProxyUser == other.httpsProxyUser &&
            indexOut == other.indexOut &&
            lowestSpeedLimit == other.lowestSpeedLimit &&
            maxConnectionPerServer == other.maxConnectionPerServer &&
            maxDownloadLimit == other.maxDownloadLimit &&
            maxFileNotFound == other.maxFileNotFound &&
            maxMmapLimit == other.maxMmapLimit &&
            maxResumeFailureTries == other.maxResumeFailureTries &&
            maxTries == other.maxTries &&
            maxUploadLimit == other.maxUploadLimit &&
            metalinkBaseUri == other.metalinkBaseUri &&
            metalinkEnableUniqueProtocol ==
                other.metalinkEnableUniqueProtocol &&
            metalinkLanguage == other.metalinkLanguage &&
            metalinkLocation == other.metalinkLocation &&
            metalinkOS == other.metalinkOS &&
            metalinkPreferredProtocol == other.metalinkPreferredProtocol &&
            metalinkVersion == other.metalinkVersion &&
            minSplitSize == other.minSplitSize &&
            noFileAllocationLimit == other.noFileAllocationLimit &&
            noNetrc == other.noNetrc &&
            noProxy == other.noProxy &&
            out == other.out &&
            parameterizedUri == other.parameterizedUri &&
            pause == other.pause &&
            pauseMetadata == other.pauseMetadata &&
            pieceLength == other.pieceLength &&
            proxyMethod == other.proxyMethod &&
            realtimeChunkChecksum == other.realtimeChunkChecksum &&
            referer == other.referer &&
            remoteTime == other.remoteTime &&
            removeControlFile == other.removeControlFile &&
            retryWait == other.retryWait &&
            reuseUri == other.reuseUri &&
            rpcSaveUploadMetadata == other.rpcSaveUploadMetadata &&
            seedRatio == other.seedRatio &&
            seedTime == other.seedTime &&
            selectFile == other.selectFile &&
            split == other.split &&
            sshHostKeyMd == other.sshHostKeyMd &&
            streamPieceSelector == other.streamPieceSelector &&
            timeout == other.timeout &&
            uriSelector == other.uriSelector &&
            useHead == other.useHead &&
            userAgent == other.userAgent);
  }

  Map<String, dynamic> toJson() => _$Aria2InputFileOptionToJson(this);

  @override
  String toString() => toJson().toString();

  static List<String>? btTrackerParse(String? o) {
    return o?.split(',');
  }
}

@JsonSerializable()
class Aria2HashOption {
  final Aria2HashType type;
  final String digest;

  const Aria2HashOption({required this.type, required this.digest});

  factory Aria2HashOption.fromJson(Map<String, dynamic> json) =>
      _$Aria2HashOptionFromJson(json);

  String get option {
    return '${type.name}=$digest';
  }

  @override
  int get hashCode => Object.hashAll([type, digest]);

  static String? toInput(Aria2HashOption? o) {
    return o?.option;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2HashOption &&
            type == other.type &&
            digest == other.digest);
  }

  Map<String, dynamic> toJson() => _$Aria2HashOptionToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class Aria2LinkedServerInfo {
  final String uri;
  final String currentUri;
  final int downloadSpeed;

  const Aria2LinkedServerInfo({
    required this.uri,
    required this.currentUri,
    required this.downloadSpeed,
  });

  factory Aria2LinkedServerInfo.fromJson(Map<String, dynamic> json) =>
      _$Aria2LinkedServerInfoFromJson(json);

  @override
  int get hashCode => Object.hashAll([uri, currentUri, downloadSpeed]);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Aria2LinkedServerInfo &&
            uri == other.uri &&
            currentUri == other.currentUri &&
            downloadSpeed == other.downloadSpeed);
  }

  Map<String, dynamic> toJson() => _$Aria2LinkedServerInfoToJson(this);

  @override
  String toString() => toJson().toString();
}

/// aria2方法
class Aria2Method {
  /// 方法名称
  final Aria2MethodName methodName;

  /// 方法参数
  final List<dynamic>? params;

  Aria2Method(this.methodName, [this.params]);

  Map<String, dynamic> get map {
    return {"methodName": methodName, "params": ?params};
  }

  bool get noRequireSecret =>
      methodName == .listMethods || methodName == .listNotifications;

  @override
  String toString() {
    return map.toString();
  }
}

class Aria2StatusKeys extends UnmodifiableListView<String> {
  /// If all parameter are false, keys will be an empty list.
  /// If keys is empty or omitted, the response contains all keys.
  Aria2StatusKeys({
    bool gid = true,
    bool status = false,
    bool totalLength = false,
    bool completedLength = false,
    bool uploadLength = false,
    bool bitfield = false,
    bool downloadSpeed = false,
    bool uploadSpeed = false,
    bool infoHash = false,
    bool numSeeders = false,
    bool seeder = false,
    bool pieceLength = false,
    bool numPieces = false,
    bool connections = false,
    bool errorCode = false,
    bool errorMessage = false,
    bool followedBy = false,
    bool following = false,
    bool belongsTo = false,
    bool dir = false,
    bool files = false,
    bool bittorrent = false,
    bool verifiedLength = false,
    bool verifyIntegrityPending = false,
  }) : super([
         if (gid) 'gid',
         if (status) 'status',
         if (totalLength) 'totalLength',
         if (completedLength) 'completedLength',
         if (uploadLength) 'uploadLength',
         if (bitfield) 'bitfield',
         if (downloadSpeed) 'downloadSpeed',
         if (uploadSpeed) 'uploadSpeed',
         if (infoHash) 'infoHash',
         if (numSeeders) 'numSeeders',
         if (seeder) 'seeder',
         if (pieceLength) 'pieceLength',
         if (numPieces) 'numPieces',
         if (connections) 'connections',
         if (errorCode) 'errorCode',
         if (errorMessage) 'errorMessage',
         if (followedBy) 'followedBy',
         if (following) 'following',
         if (belongsTo) 'belongsTo',
         if (dir) 'dir',
         if (files) 'files',
         if (bittorrent) 'bittorrent',
         if (verifiedLength) 'verifiedLength',
         if (verifyIntegrityPending) 'verifyIntegrityPending',
       ]);
}
