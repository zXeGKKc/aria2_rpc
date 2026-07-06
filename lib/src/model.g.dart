// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aria2BitTorrentData _$Aria2BitTorrentDataFromJson(Map<String, dynamic> json) =>
    Aria2BitTorrentData(
      announceList: (json['announceList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      comment: json['comment'] as String,
      creationDate: (json['creationDate'] as num).toInt(),
      mode: $enumDecode(_$Aria2BitTorrentModeEnumMap, json['mode']),
      info: Aria2BitTorrentInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Aria2BitTorrentDataToJson(
  Aria2BitTorrentData instance,
) => <String, dynamic>{
  'announceList': instance.announceList,
  'comment': instance.comment,
  'creationDate': instance.creationDate,
  'mode': _$Aria2BitTorrentModeEnumMap[instance.mode]!,
  'info': instance.info,
};

const _$Aria2BitTorrentModeEnumMap = {
  Aria2BitTorrentMode.single: 'single',
  Aria2BitTorrentMode.multi: 'multi',
};

Aria2BitTorrentInfo _$Aria2BitTorrentInfoFromJson(Map<String, dynamic> json) =>
    Aria2BitTorrentInfo(name: json['name'] as String);

Map<String, dynamic> _$Aria2BitTorrentInfoToJson(
  Aria2BitTorrentInfo instance,
) => <String, dynamic>{'name': instance.name};

Aria2BtPrioritizePieceOption _$Aria2BtPrioritizePieceOptionFromJson(
  Map<String, dynamic> json,
) => Aria2BtPrioritizePieceOption(
  head: json['head'] as String?,
  tail: json['tail'] as String?,
);

Map<String, dynamic> _$Aria2BtPrioritizePieceOptionToJson(
  Aria2BtPrioritizePieceOption instance,
) => <String, dynamic>{'head': instance.head, 'tail': instance.tail};

Aria2InputFileOption _$Aria2InputFileOptionFromJson(
  Map<String, dynamic> json,
) => Aria2InputFileOption(
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
  dryRun: json['dry-run'] as bool?,
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
  metalinkBaseUri: json['metalink-base-uri'] as String?,
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
  parameterizedUri: json['parameterized-uri'] as bool?,
  pause: json['pause'] as bool?,
  pauseMetadata: json['pause-metadata'] as bool?,
  pieceLength: json['piece-length'] as String?,
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
  rpcSaveUploadMetadata: json['rpc-save-upload-metadata'] as bool?,
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

Map<String, dynamic> _$Aria2InputFileOptionToJson(
  Aria2InputFileOption instance,
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
  'dry-run': ?instance.dryRun,
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
  'metalink-base-uri': ?instance.metalinkBaseUri,
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
  'parameterized-uri': ?instance.parameterizedUri,
  'pause': ?instance.pause,
  'pause-metadata': ?instance.pauseMetadata,
  'piece-length': ?instance.pieceLength,
  'proxy-method': ?_$Aria2ProxyMethodEnumMap[instance.proxyMethod],
  'realtime-chunk-checksum': ?instance.realtimeChunkChecksum,
  'referer': ?instance.referer,
  'remote-time': ?instance.remoteTime,
  'remove-control-file': ?instance.removeControlFile,
  'retry-wait': ?instance.retryWait,
  'reuse-uri': ?instance.reuseUri,
  'rpc-save-upload-metadata': ?instance.rpcSaveUploadMetadata,
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

Aria2HashOption _$Aria2HashOptionFromJson(Map<String, dynamic> json) =>
    Aria2HashOption(
      type: $enumDecode(_$Aria2HashTypeEnumMap, json['type']),
      digest: json['digest'] as String,
    );

Map<String, dynamic> _$Aria2HashOptionToJson(Aria2HashOption instance) =>
    <String, dynamic>{
      'type': _$Aria2HashTypeEnumMap[instance.type]!,
      'digest': instance.digest,
    };

const _$Aria2HashTypeEnumMap = {
  Aria2HashType.sha1: 'sha-1',
  Aria2HashType.sha224: 'sha-224',
  Aria2HashType.sha256: 'sha-256',
  Aria2HashType.sha384: 'sha-384',
  Aria2HashType.sha512: 'sha-512',
  Aria2HashType.md5: 'md5',
  Aria2HashType.adler32: 'adler32',
};

Aria2LinkedServerInfo _$Aria2LinkedServerInfoFromJson(
  Map<String, dynamic> json,
) => Aria2LinkedServerInfo(
  uri: json['uri'] as String,
  currentUri: json['currentUri'] as String,
  downloadSpeed: (json['downloadSpeed'] as num).toInt(),
);

Map<String, dynamic> _$Aria2LinkedServerInfoToJson(
  Aria2LinkedServerInfo instance,
) => <String, dynamic>{
  'uri': instance.uri,
  'currentUri': instance.currentUri,
  'downloadSpeed': instance.downloadSpeed,
};
