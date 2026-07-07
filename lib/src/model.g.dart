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
  allowOverwrite: BoolParser.tryParseIfNotNull(
    json['allow-overwrite'] as String?,
  ),
  allowPieceLengthChange: BoolParser.tryParseIfNotNull(
    json['allow-piece-length-change'] as String?,
  ),
  alwaysResume: BoolParser.tryParseIfNotNull(json['always-resume'] as String?),
  asyncDns: BoolParser.tryParseIfNotNull(json['async-dns'] as String?),
  autoFileRenaming: BoolParser.tryParseIfNotNull(
    json['auto-file-renaming'] as String?,
  ),
  btEnableHookAfterHashCheck: BoolParser.tryParseIfNotNull(
    json['bt-enable-hook-after-hash-check'] as String?,
  ),
  btEnableLpd: BoolParser.tryParseIfNotNull(json['bt-enable-lpd'] as String?),
  btExcludeTracker: (json['bt-exclude-tracker'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  btExternalIP: json['bt-external-ip'] as String?,
  btForceEncryption: BoolParser.tryParseIfNotNull(
    json['bt-force-encryption'] as String?,
  ),
  btHashCheckSeed: BoolParser.tryParseIfNotNull(
    json['bt-hash-check-seed'] as String?,
  ),
  btLoadSavedMetadata: BoolParser.tryParseIfNotNull(
    json['bt-load-saved-metadata'] as String?,
  ),
  btMaxPeers: IntParser.tryParseIfNotNull(json['bt-max-peers'] as String?),
  btMetadataOnly: BoolParser.tryParseIfNotNull(
    json['bt-metadata-only'] as String?,
  ),
  btMinCryptoLevel: $enumDecodeNullable(
    _$Aria2BtCryptoLevelEnumMap,
    json['bt-min-crypto-level'],
  ),
  btPrioritizePiece: json['bt-prioritize-piece'] == null
      ? null
      : Aria2BtPrioritizePieceOption.fromJson(
          json['bt-prioritize-piece'] as Map<String, dynamic>,
        ),
  btRemoveUnselectedFile: BoolParser.tryParseIfNotNull(
    json['bt-remove-unselected-file'] as String?,
  ),
  btRequestPeerSpeedLimit: json['bt-request-peer-speed-limit'] as String?,
  btRequireCrypto: BoolParser.tryParseIfNotNull(
    json['bt-require-crypto'] as String?,
  ),
  btSaveMetadata: BoolParser.tryParseIfNotNull(
    json['bt-save-metadata'] as String?,
  ),
  btSeedUnverified: BoolParser.tryParseIfNotNull(
    json['bt-seed-unverified'] as String?,
  ),
  btStopTimeout: IntParser.tryParseIfNotNull(
    json['bt-stop-timeout'] as String?,
  ),
  btTracker: Aria2InputFileOption.btTrackerParse(json['bt-tracker'] as String?),
  btTrackerConnectTimeout: IntParser.tryParseIfNotNull(
    json['bt-tracker-connect-timeout'] as String?,
  ),
  btTrackerInterval: IntParser.tryParseIfNotNull(
    json['bt-tracker-interval'] as String?,
  ),
  btTrackerTimeout: IntParser.tryParseIfNotNull(
    json['bt-tracker-timeout'] as String?,
  ),
  checkIntegrity: BoolParser.tryParseIfNotNull(
    json['check-integrity'] as String?,
  ),
  checksum: json['checksum'] == null
      ? null
      : Aria2HashOption.fromJson(json['checksum'] as Map<String, dynamic>),
  conditionalGet: BoolParser.tryParseIfNotNull(
    json['conditional-get'] as String?,
  ),
  connectTimeout: IntParser.tryParseIfNotNull(
    json['connect-timeout'] as String?,
  ),
  contentDispositionDefaultUtf8: BoolParser.tryParseIfNotNull(
    json['content-disposition-default-utf8'] as String?,
  ),
  aria2Continue: BoolParser.tryParseIfNotNull(json['continue'] as String?),
  dir: json['dir'] as String?,
  dryRun: BoolParser.tryParseIfNotNull(json['dry-run'] as String?),
  enableHttpKeepAlive: BoolParser.tryParseIfNotNull(
    json['enable-http-keep-alive'] as String?,
  ),
  enableHttpPipelining: BoolParser.tryParseIfNotNull(
    json['enable-http-pipelining'] as String?,
  ),
  enableMmap: BoolParser.tryParseIfNotNull(json['enable-mmap'] as String?),
  enablePeerExchange: BoolParser.tryParseIfNotNull(
    json['enable-peer-exchange'] as String?,
  ),
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
  forceSave: BoolParser.tryParseIfNotNull(json['force-save'] as String?),
  ftpPasswd: json['ftp-passwd'] as String?,
  ftpPasv: BoolParser.tryParseIfNotNull(json['ftp-pasv'] as String?),
  ftpProxy: json['ftp-proxy'] as String?,
  ftpProxyPasswd: json['ftp-proxy-passwd'] as String?,
  ftpProxyUser: json['ftp-proxy-user'] as String?,
  ftpReuseConnection: BoolParser.tryParseIfNotNull(
    json['ftp-reuse-connection'] as String?,
  ),
  ftpType: $enumDecodeNullable(_$Aria2FTPTypeEnumMap, json['ftp-type']),
  ftpUser: json['ftp-user'] as String?,
  gid: json['gid'] as String?,
  hashCheckOnly: BoolParser.tryParseIfNotNull(
    json['hash-check-only'] as String?,
  ),
  header: (json['header'] as List<dynamic>?)?.map((e) => e as String).toList(),
  httpAcceptGzip: BoolParser.tryParseIfNotNull(
    json['http-accept-gzip'] as String?,
  ),
  httpAuthChallenge: BoolParser.tryParseIfNotNull(
    json['http-auth-challenge'] as String?,
  ),
  httpNoCache: BoolParser.tryParseIfNotNull(json['http-no-cache'] as String?),
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
  maxConnectionPerServer: IntParser.tryParseIfNotNull(
    json['max-connection-per-server'] as String?,
  ),
  maxDownloadLimit: json['max-download-limit'] as String?,
  maxFileNotFound: IntParser.tryParseIfNotNull(
    json['max-file-not-found'] as String?,
  ),
  maxMmapLimit: json['max-mmap-limit'] as String?,
  maxResumeFailureTries: IntParser.tryParseIfNotNull(
    json['max-resume-failure-tries'] as String?,
  ),
  maxTries: IntParser.tryParseIfNotNull(json['max-tries'] as String?),
  maxUploadLimit: json['max-upload-limit'] as String?,
  metalinkBaseUri: json['metalink-base-uri'] as String?,
  metalinkEnableUniqueProtocol: BoolParser.tryParseIfNotNull(
    json['metalink-enable-unique-protocol'] as String?,
  ),
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
  noNetrc: BoolParser.tryParseIfNotNull(json['no-netrc'] as String?),
  noProxy: (json['no-proxy'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  out: json['out'] as String?,
  parameterizedUri: BoolParser.tryParseIfNotNull(
    json['parameterized-uri'] as String?,
  ),
  pause: BoolParser.tryParseIfNotNull(json['pause'] as String?),
  pauseMetadata: BoolParser.tryParseIfNotNull(
    json['pause-metadata'] as String?,
  ),
  pieceLength: json['piece-length'] as String?,
  proxyMethod: $enumDecodeNullable(
    _$Aria2ProxyMethodEnumMap,
    json['proxy-method'],
  ),
  realtimeChunkChecksum: BoolParser.tryParseIfNotNull(
    json['realtime-chunk-checksum'] as String?,
  ),
  referer: json['referer'] as String?,
  remoteTime: BoolParser.tryParseIfNotNull(json['remote-time'] as String?),
  removeControlFile: BoolParser.tryParseIfNotNull(
    json['remove-control-file'] as String?,
  ),
  retryWait: IntParser.tryParseIfNotNull(json['retry-wait'] as String?),
  reuseUri: BoolParser.tryParseIfNotNull(json['reuse-uri'] as String?),
  rpcSaveUploadMetadata: BoolParser.tryParseIfNotNull(
    json['rpc-save-upload-metadata'] as String?,
  ),
  seedRatio: DoubleParser.tryParseIfNotNull(json['seed-ratio'] as String?),
  seedTime: DoubleParser.tryParseIfNotNull(json['seed-time'] as String?),
  selectFile: json['select-file'] as String?,
  split: IntParser.tryParseIfNotNull(json['split'] as String?),
  sshHostKeyMd: json['ssh-host-key-md'] == null
      ? null
      : Aria2HashOption.fromJson(
          json['ssh-host-key-md'] as Map<String, dynamic>,
        ),
  streamPieceSelector: $enumDecodeNullable(
    _$Aria2StreamPieceSelectorEnumMap,
    json['stream-piece-selector'],
  ),
  timeout: IntParser.tryParseIfNotNull(json['timeout'] as String?),
  uriSelector: $enumDecodeNullable(
    _$Aria2UriSelectorEnumMap,
    json['uri-selector'],
  ),
  useHead: BoolParser.tryParseIfNotNull(json['use-head'] as String?),
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
  'checksum': ?Aria2HashOption.toInput(instance.checksum),
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
  'ssh-host-key-md': ?Aria2HashOption.toInput(instance.sshHostKeyMd),
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
