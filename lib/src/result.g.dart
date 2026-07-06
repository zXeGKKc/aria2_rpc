// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aria2DownloadingFile _$Aria2DownloadingFileFromJson(
  Map<String, dynamic> json,
) => Aria2DownloadingFile(
  index: (json['index'] as num).toInt(),
  path: json['path'] as String,
  length: (json['length'] as num).toInt(),
  completedLength: (json['completedLength'] as num).toInt(),
  selected: json['selected'] as bool,
  uris: (json['uris'] as List<dynamic>)
      .map((e) => Aria2DownloadingUri.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Aria2DownloadingFileToJson(
  Aria2DownloadingFile instance,
) => <String, dynamic>{
  'index': instance.index,
  'path': instance.path,
  'length': instance.length,
  'completedLength': instance.completedLength,
  'selected': instance.selected,
  'uris': instance.uris,
};

Aria2DownloadingPeer _$Aria2DownloadingPeerFromJson(
  Map<String, dynamic> json,
) => Aria2DownloadingPeer(
  peerId: json['peerId'] as String,
  ip: json['ip'] as String,
  port: (json['port'] as num).toInt(),
  bitfield: json['bitfield'] as String,
  amChoking: json['amChoking'] as bool,
  peerChoking: json['peerChoking'] as bool,
  downloadSpeed: (json['downloadSpeed'] as num).toInt(),
  uploadSpeed: (json['uploadSpeed'] as num).toInt(),
  seeder: json['seeder'] as bool,
);

Map<String, dynamic> _$Aria2DownloadingPeerToJson(
  Aria2DownloadingPeer instance,
) => <String, dynamic>{
  'peerId': instance.peerId,
  'ip': instance.ip,
  'port': instance.port,
  'bitfield': instance.bitfield,
  'amChoking': instance.amChoking,
  'peerChoking': instance.peerChoking,
  'downloadSpeed': instance.downloadSpeed,
  'uploadSpeed': instance.uploadSpeed,
  'seeder': instance.seeder,
};

Aria2DownloadingStatus _$Aria2DownloadingStatusFromJson(
  Map<String, dynamic> json,
) => Aria2DownloadingStatus(
  gid: json['gid'] as String?,
  status: $enumDecodeNullable(
    _$Aria2DownloadingStatusStatusEnumMap,
    json['status'],
  ),
  totalLength: (json['totalLength'] as num?)?.toInt(),
  completedLength: (json['completedLength'] as num?)?.toInt(),
  uploadLength: (json['uploadLength'] as num?)?.toInt(),
  bitfield: json['bitfield'] as String?,
  downloadSpeed: (json['downloadSpeed'] as num?)?.toInt(),
  uploadSpeed: (json['uploadSpeed'] as num?)?.toInt(),
  infoHash: json['infoHash'] as String?,
  numSeeders: (json['numSeeders'] as num?)?.toInt(),
  seeder: json['seeder'] as bool?,
  pieceLength: (json['pieceLength'] as num?)?.toInt(),
  numPieces: (json['numPieces'] as num?)?.toInt(),
  connections: (json['connections'] as num?)?.toInt(),
  errorCode: (json['errorCode'] as num?)?.toInt(),
  errorMessage: json['errorMessage'] as String?,
  followedBy: (json['followedBy'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  following: json['following'] as String?,
  belongsTo: json['belongsTo'] as String?,
  dir: json['dir'] as String?,
  files: (json['files'] as List<dynamic>?)
      ?.map((e) => Aria2DownloadingFile.fromJson(e as Map<String, dynamic>))
      .toList(),
  bittorrent: json['bittorrent'] == null
      ? null
      : Aria2BitTorrentData.fromJson(
          json['bittorrent'] as Map<String, dynamic>,
        ),
  verifiedLength: (json['verifiedLength'] as num?)?.toInt(),
  verifyIntegrityPending: json['verifyIntegrityPending'] as bool?,
);

Map<String, dynamic> _$Aria2DownloadingStatusToJson(
  Aria2DownloadingStatus instance,
) => <String, dynamic>{
  'gid': instance.gid,
  'status': _$Aria2DownloadingStatusStatusEnumMap[instance.status],
  'totalLength': instance.totalLength,
  'completedLength': instance.completedLength,
  'uploadLength': instance.uploadLength,
  'bitfield': instance.bitfield,
  'downloadSpeed': instance.downloadSpeed,
  'uploadSpeed': instance.uploadSpeed,
  'infoHash': instance.infoHash,
  'numSeeders': instance.numSeeders,
  'seeder': instance.seeder,
  'pieceLength': instance.pieceLength,
  'numPieces': instance.numPieces,
  'connections': instance.connections,
  'errorCode': instance.errorCode,
  'errorMessage': instance.errorMessage,
  'followedBy': instance.followedBy,
  'following': instance.following,
  'belongsTo': instance.belongsTo,
  'dir': instance.dir,
  'files': instance.files,
  'bittorrent': instance.bittorrent,
  'verifiedLength': instance.verifiedLength,
  'verifyIntegrityPending': instance.verifyIntegrityPending,
};

const _$Aria2DownloadingStatusStatusEnumMap = {
  Aria2DownloadingStatusStatus.active: 'active',
  Aria2DownloadingStatusStatus.waiting: 'waiting',
  Aria2DownloadingStatusStatus.paused: 'paused',
  Aria2DownloadingStatusStatus.error: 'error',
  Aria2DownloadingStatusStatus.complete: 'complete',
  Aria2DownloadingStatusStatus.removed: 'removed',
};

Aria2DownloadingUri _$Aria2DownloadingUriFromJson(Map<String, dynamic> json) =>
    Aria2DownloadingUri(
      uri: json['uri'] as String,
      status: $enumDecode(_$Aria2UriStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$Aria2DownloadingUriToJson(
  Aria2DownloadingUri instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'status': _$Aria2UriStatusEnumMap[instance.status]!,
};

const _$Aria2UriStatusEnumMap = {
  Aria2UriStatus.used: 'used',
  Aria2UriStatus.waiting: 'waiting',
};

Aria2Option _$Aria2OptionFromJson(Map<String, dynamic> json) => Aria2Option(
  allProxy: json['all-proxy'] as String?,
  allProxyPasswd: json['all-proxy-passwd'] as String?,
  allProxyUser: json['all-proxy-user'] as String?,
  allowOverwrite: json['allow-overwrite'] as bool?,
  allowPieceLengthChange: json['allow-piece-length-change'] as bool?,
  alwaysResume: json['always-resume'] as bool?,
  asyncDns: json['async-dns'] as bool?,
  autoFileRenaming: json['auto-file-renaming'] as bool?,
  btEnableHookAfterHashCheck: json['bt-enable-hook-after-hash-check'] as bool?,
  btEnableLpd: json['bt-enable-lpd'] as bool?,
  btExcludeTracker: (json['bt-exclude-tracker'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  btExternalIP: json['bt-external-ip'] as String?,
  btForceEncryption: json['bt-force-encryption'] as bool?,
  btHashCheckSeed: json['bt-hash-check-seed'] as bool?,
  btLoadSavedMetadata: json['bt-load-saved-metadata'] as bool?,
  btMaxPeers: (json['bt-max-peers'] as num?)?.toInt(),
  btMetadataOnly: json['bt-metadata-only'] as bool?,
  btMinCryptoLevel: $enumDecodeNullable(
    _$Aria2BtCryptoLevelEnumMap,
    json['bt-min-crypto-level'],
  ),
  btPrioritizePiece: json['bt-prioritize-piece'] == null
      ? null
      : Aria2BtPrioritizePieceOption.fromJson(
          json['bt-prioritize-piece'] as Map<String, dynamic>,
        ),
  btRemoveUnselectedFile: json['bt-remove-unselected-file'] as bool?,
  btRequestPeerSpeedLimit: json['bt-request-peer-speed-limit'] as String?,
  btRequireCrypto: json['bt-require-crypto'] as bool?,
  btSaveMetadata: json['bt-save-metadata'] as bool?,
  btSeedUnverified: json['bt-seed-unverified'] as bool?,
  btStopTimeout: (json['bt-stop-timeout'] as num?)?.toInt(),
  btTracker: (json['bt-tracker'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  btTrackerConnectTimeout: (json['bt-tracker-connect-timeout'] as num?)
      ?.toInt(),
  btTrackerInterval: (json['bt-tracker-interval'] as num?)?.toInt(),
  btTrackerTimeout: (json['bt-tracker-timeout'] as num?)?.toInt(),
  checkIntegrity: json['check-integrity'] as bool?,
  checksum: json['checksum'] == null
      ? null
      : Aria2HashOption.fromJson(json['checksum'] as Map<String, dynamic>),
  conditionalGet: json['conditional-get'] as bool?,
  connectTimeout: (json['connect-timeout'] as num?)?.toInt(),
  contentDispositionDefaultUtf8:
      json['content-disposition-default-utf8'] as bool?,
  aria2Continue: json['continue'] as bool?,
  dir: json['dir'] as String?,
  enableHttpKeepAlive: json['enable-http-keep-alive'] as bool?,
  enableHttpPipelining: json['enable-http-pipelining'] as bool?,
  enableMmap: json['enable-mmap'] as bool?,
  enablePeerExchange: json['enable-peer-exchange'] as bool?,
  fileAllocation: $enumDecodeNullable(
    _$Aria2FileAllocationMethodEnumMap,
    json['file-allocation'],
  ),
  followMetalink: $enumDecodeNullable(
    _$Aria2SymbolEnumMap,
    json['follow-metalink'],
  ),
  followTorrent: $enumDecodeNullable(
    _$Aria2SymbolEnumMap,
    json['follow-torrent'],
  ),
  forceSave: json['force-save'] as bool?,
  ftpPasswd: json['ftp-passwd'] as String?,
  ftpPasv: json['ftp-pasv'] as bool?,
  ftpProxy: json['ftp-proxy'] as String?,
  ftpProxyPasswd: json['ftp-proxy-passwd'] as String?,
  ftpProxyUser: json['ftp-proxy-user'] as String?,
  ftpReuseConnection: json['ftp-reuse-connection'] as bool?,
  ftpType: $enumDecodeNullable(_$Aria2FTPTypeEnumMap, json['ftp-type']),
  ftpUser: json['ftp-user'] as String?,
  gid: json['gid'] as String?,
  hashCheckOnly: json['hash-check-only'] as bool?,
  header: (json['header'] as List<dynamic>?)?.map((e) => e as String).toList(),
  httpAcceptGzip: json['http-accept-gzip'] as bool?,
  httpAuthChallenge: json['http-auth-challenge'] as bool?,
  httpNoCache: json['http-no-cache'] as bool?,
  httpPasswd: json['http-passwd'] as String?,
  httpProxy: json['http-proxy'] as String?,
  httpProxyPasswd: json['http-proxy-passwd'] as String?,
  httpProxyUser: json['http-proxy-user'] as String?,
  httpUser: json['http-user'] as String?,
  httpsProxy: json['https-proxy'] as String?,
  httpsProxyPasswd: json['https-proxy-passwd'] as String?,
  httpsProxyUser: json['https-proxy-user'] as String?,
  indexOut: (json['index-out'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(int.parse(k), e as String),
  ),
  lowestSpeedLimit: json['lowest-speed-limit'] as String?,
  maxConnectionPerServer: (json['max-connection-per-server'] as num?)?.toInt(),
  maxDownloadLimit: json['max-download-limit'] as String?,
  maxFileNotFound: (json['max-file-not-found'] as num?)?.toInt(),
  maxMmapLimit: json['max-mmap-limit'] as String?,
  maxResumeFailureTries: (json['max-resume-failure-tries'] as num?)?.toInt(),
  maxTries: (json['max-tries'] as num?)?.toInt(),
  maxUploadLimit: json['max-upload-limit'] as String?,
  metalinkEnableUniqueProtocol:
      json['metalink-enable-unique-protocol'] as bool?,
  metalinkLanguage: json['metalink-language'] as String?,
  metalinkLocation: (json['metalink-location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  metalinkOS: json['metalink-os'] as String?,
  metalinkPreferredProtocol: $enumDecodeNullable(
    _$Aria2MetalinkPreferredProtocolEnumMap,
    json['metalink-preferred-protocol'],
  ),
  metalinkVersion: json['metalink-version'] as String?,
  minSplitSize: json['min-split-size'] as String?,
  noFileAllocationLimit: json['no-file-allocation-limit'] as String?,
  noNetrc: json['no-netrc'] as bool?,
  noProxy: (json['no-proxy'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  out: json['out'] as String?,
  pauseMetadata: json['pause-metadata'] as bool?,
  proxyMethod: $enumDecodeNullable(
    _$Aria2ProxyMethodEnumMap,
    json['proxy-method'],
  ),
  realtimeChunkChecksum: json['realtime-chunk-checksum'] as bool?,
  referer: json['referer'] as String?,
  remoteTime: json['remote-time'] as bool?,
  removeControlFile: json['remove-control-file'] as bool?,
  retryWait: (json['retry-wait'] as num?)?.toInt(),
  reuseUri: json['reuse-uri'] as bool?,
  seedRatio: (json['seed-ratio'] as num?)?.toDouble(),
  seedTime: (json['seed-time'] as num?)?.toDouble(),
  selectFile: json['select-file'] as String?,
  split: (json['split'] as num?)?.toInt(),
  sshHostKeyMd: json['ssh-host-key-md'] == null
      ? null
      : Aria2HashOption.fromJson(
          json['ssh-host-key-md'] as Map<String, dynamic>,
        ),
  streamPieceSelector: $enumDecodeNullable(
    _$Aria2StreamPieceSelectorEnumMap,
    json['stream-piece-selector'],
  ),
  timeout: (json['timeout'] as num?)?.toInt(),
  uriSelector: $enumDecodeNullable(
    _$Aria2UriSelectorEnumMap,
    json['uri-selector'],
  ),
  useHead: json['use-head'] as bool?,
  userAgent: json['user-agent'] as String?,
);

Map<String, dynamic> _$Aria2OptionToJson(
  Aria2Option instance,
) => <String, dynamic>{
  'all-proxy': ?instance.allProxy,
  'all-proxy-passwd': ?instance.allProxyPasswd,
  'all-proxy-user': ?instance.allProxyUser,
  'allow-overwrite': ?instance.allowOverwrite,
  'allow-piece-length-change': ?instance.allowPieceLengthChange,
  'always-resume': ?instance.alwaysResume,
  'async-dns': ?instance.asyncDns,
  'auto-file-renaming': ?instance.autoFileRenaming,
  'bt-enable-hook-after-hash-check': ?instance.btEnableHookAfterHashCheck,
  'bt-enable-lpd': ?instance.btEnableLpd,
  'bt-exclude-tracker': ?instance.btExcludeTracker,
  'bt-external-ip': ?instance.btExternalIP,
  'bt-force-encryption': ?instance.btForceEncryption,
  'bt-hash-check-seed': ?instance.btHashCheckSeed,
  'bt-load-saved-metadata': ?instance.btLoadSavedMetadata,
  'bt-max-peers': ?instance.btMaxPeers,
  'bt-metadata-only': ?instance.btMetadataOnly,
  'bt-min-crypto-level':
      ?_$Aria2BtCryptoLevelEnumMap[instance.btMinCryptoLevel],
  'bt-prioritize-piece': ?instance.btPrioritizePiece,
  'bt-remove-unselected-file': ?instance.btRemoveUnselectedFile,
  'bt-request-peer-speed-limit': ?instance.btRequestPeerSpeedLimit,
  'bt-require-crypto': ?instance.btRequireCrypto,
  'bt-save-metadata': ?instance.btSaveMetadata,
  'bt-seed-unverified': ?instance.btSeedUnverified,
  'bt-stop-timeout': ?instance.btStopTimeout,
  'bt-tracker': ?instance.btTracker,
  'bt-tracker-connect-timeout': ?instance.btTrackerConnectTimeout,
  'bt-tracker-interval': ?instance.btTrackerInterval,
  'bt-tracker-timeout': ?instance.btTrackerTimeout,
  'check-integrity': ?instance.checkIntegrity,
  'checksum': ?instance.checksum,
  'conditional-get': ?instance.conditionalGet,
  'connect-timeout': ?instance.connectTimeout,
  'content-disposition-default-utf8': ?instance.contentDispositionDefaultUtf8,
  'continue': ?instance.aria2Continue,
  'dir': ?instance.dir,
  'enable-http-keep-alive': ?instance.enableHttpKeepAlive,
  'enable-http-pipelining': ?instance.enableHttpPipelining,
  'enable-mmap': ?instance.enableMmap,
  'enable-peer-exchange': ?instance.enablePeerExchange,
  'file-allocation':
      ?_$Aria2FileAllocationMethodEnumMap[instance.fileAllocation],
  'follow-metalink': ?_$Aria2SymbolEnumMap[instance.followMetalink],
  'follow-torrent': ?_$Aria2SymbolEnumMap[instance.followTorrent],
  'force-save': ?instance.forceSave,
  'ftp-passwd': ?instance.ftpPasswd,
  'ftp-pasv': ?instance.ftpPasv,
  'ftp-proxy': ?instance.ftpProxy,
  'ftp-proxy-passwd': ?instance.ftpProxyPasswd,
  'ftp-proxy-user': ?instance.ftpProxyUser,
  'ftp-reuse-connection': ?instance.ftpReuseConnection,
  'ftp-type': ?_$Aria2FTPTypeEnumMap[instance.ftpType],
  'ftp-user': ?instance.ftpUser,
  'gid': ?instance.gid,
  'hash-check-only': ?instance.hashCheckOnly,
  'header': ?instance.header,
  'http-accept-gzip': ?instance.httpAcceptGzip,
  'http-auth-challenge': ?instance.httpAuthChallenge,
  'http-no-cache': ?instance.httpNoCache,
  'http-passwd': ?instance.httpPasswd,
  'http-proxy': ?instance.httpProxy,
  'http-proxy-passwd': ?instance.httpProxyPasswd,
  'http-proxy-user': ?instance.httpProxyUser,
  'http-user': ?instance.httpUser,
  'https-proxy': ?instance.httpsProxy,
  'https-proxy-passwd': ?instance.httpsProxyPasswd,
  'https-proxy-user': ?instance.httpsProxyUser,
  'index-out': ?instance.indexOut?.map((k, e) => MapEntry(k.toString(), e)),
  'lowest-speed-limit': ?instance.lowestSpeedLimit,
  'max-connection-per-server': ?instance.maxConnectionPerServer,
  'max-download-limit': ?instance.maxDownloadLimit,
  'max-file-not-found': ?instance.maxFileNotFound,
  'max-mmap-limit': ?instance.maxMmapLimit,
  'max-resume-failure-tries': ?instance.maxResumeFailureTries,
  'max-tries': ?instance.maxTries,
  'max-upload-limit': ?instance.maxUploadLimit,
  'metalink-enable-unique-protocol': ?instance.metalinkEnableUniqueProtocol,
  'metalink-language': ?instance.metalinkLanguage,
  'metalink-location': ?instance.metalinkLocation,
  'metalink-os': ?instance.metalinkOS,
  'metalink-preferred-protocol':
      ?_$Aria2MetalinkPreferredProtocolEnumMap[instance
          .metalinkPreferredProtocol],
  'metalink-version': ?instance.metalinkVersion,
  'min-split-size': ?instance.minSplitSize,
  'no-file-allocation-limit': ?instance.noFileAllocationLimit,
  'no-netrc': ?instance.noNetrc,
  'no-proxy': ?instance.noProxy,
  'out': ?instance.out,
  'pause-metadata': ?instance.pauseMetadata,
  'proxy-method': ?_$Aria2ProxyMethodEnumMap[instance.proxyMethod],
  'realtime-chunk-checksum': ?instance.realtimeChunkChecksum,
  'referer': ?instance.referer,
  'remote-time': ?instance.remoteTime,
  'remove-control-file': ?instance.removeControlFile,
  'retry-wait': ?instance.retryWait,
  'reuse-uri': ?instance.reuseUri,
  'seed-ratio': ?instance.seedRatio,
  'seed-time': ?instance.seedTime,
  'select-file': ?instance.selectFile,
  'split': ?instance.split,
  'ssh-host-key-md': ?instance.sshHostKeyMd,
  'stream-piece-selector':
      ?_$Aria2StreamPieceSelectorEnumMap[instance.streamPieceSelector],
  'timeout': ?instance.timeout,
  'uri-selector': ?_$Aria2UriSelectorEnumMap[instance.uriSelector],
  'use-head': ?instance.useHead,
  'user-agent': ?instance.userAgent,
};

const _$Aria2BtCryptoLevelEnumMap = {
  Aria2BtCryptoLevel.plain: 'plain',
  Aria2BtCryptoLevel.arc4: 'arc4',
};

const _$Aria2FileAllocationMethodEnumMap = {
  Aria2FileAllocationMethod.none: 'none',
  Aria2FileAllocationMethod.prealloc: 'prealloc',
  Aria2FileAllocationMethod.trunc: 'trunc',
  Aria2FileAllocationMethod.falloc: 'falloc',
};

const _$Aria2SymbolEnumMap = {
  Aria2Symbol.yes: 'true',
  Aria2Symbol.no: 'false',
  Aria2Symbol.mem: 'mem',
};

const _$Aria2FTPTypeEnumMap = {
  Aria2FTPType.ascii: 'ascii',
  Aria2FTPType.binary: 'binary',
};

const _$Aria2MetalinkPreferredProtocolEnumMap = {
  Aria2MetalinkPreferredProtocol.http: 'http',
  Aria2MetalinkPreferredProtocol.https: 'https',
  Aria2MetalinkPreferredProtocol.ftp: 'ftp',
  Aria2MetalinkPreferredProtocol.none: 'none',
};

const _$Aria2ProxyMethodEnumMap = {
  Aria2ProxyMethod.get: 'get',
  Aria2ProxyMethod.tunnel: 'tunnel',
};

const _$Aria2StreamPieceSelectorEnumMap = {
  Aria2StreamPieceSelector.defaults: 'default',
  Aria2StreamPieceSelector.inorder: 'inorder',
  Aria2StreamPieceSelector.random: 'random',
  Aria2StreamPieceSelector.geom: 'geom',
};

const _$Aria2UriSelectorEnumMap = {
  Aria2UriSelector.inorder: 'inorder',
  Aria2UriSelector.feedback: 'feedback',
  Aria2UriSelector.adaptive: 'adaptive',
};

Aria2LinkedServer _$Aria2LinkedServerFromJson(Map<String, dynamic> json) =>
    Aria2LinkedServer(
      index: (json['index'] as num).toInt(),
      servers: (json['servers'] as List<dynamic>)
          .map((e) => Aria2LinkedServerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Aria2LinkedServerToJson(Aria2LinkedServer instance) =>
    <String, dynamic>{'index': instance.index, 'servers': instance.servers};

Aria2SessionInfo _$Aria2SessionInfoFromJson(Map<String, dynamic> json) =>
    Aria2SessionInfo(sessionId: json['sessionId'] as String);

Map<String, dynamic> _$Aria2SessionInfoToJson(Aria2SessionInfo instance) =>
    <String, dynamic>{'sessionId': instance.sessionId};

Aria2GlobalStat _$Aria2GlobalStatFromJson(Map<String, dynamic> json) =>
    Aria2GlobalStat(
      downloadSpeed: (json['downloadSpeed'] as num).toInt(),
      uploadSpeed: (json['uploadSpeed'] as num).toInt(),
      numActive: (json['numActive'] as num).toInt(),
      numWaiting: (json['numWaiting'] as num).toInt(),
      numStopped: (json['numStopped'] as num).toInt(),
      numStoppedTotal: (json['numStoppedTotal'] as num).toInt(),
    );

Map<String, dynamic> _$Aria2GlobalStatToJson(Aria2GlobalStat instance) =>
    <String, dynamic>{
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'numActive': instance.numActive,
      'numWaiting': instance.numWaiting,
      'numStopped': instance.numStopped,
      'numStoppedTotal': instance.numStoppedTotal,
    };

Aria2Version _$Aria2VersionFromJson(Map<String, dynamic> json) => Aria2Version(
  version: json['version'] as String,
  enabledFeatures: (json['enabledFeatures'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$Aria2VersionToJson(Aria2Version instance) =>
    <String, dynamic>{
      'version': instance.version,
      'enabledFeatures': instance.enabledFeatures,
    };

Aria2Error _$Aria2ErrorFromJson(Map<String, dynamic> json) => Aria2Error(
  code: (json['code'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$Aria2ErrorToJson(Aria2Error instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};

Aria2Notification _$Aria2NotificationFromJson(Map<String, dynamic> json) =>
    Aria2Notification(gid: json['gid'] as String);

Map<String, dynamic> _$Aria2NotificationToJson(Aria2Notification instance) =>
    <String, dynamic>{'gid': instance.gid};
