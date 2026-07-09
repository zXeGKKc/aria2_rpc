import 'package:aria2_rpc/src/_internal/mixin.dart';
import 'package:json_annotation/json_annotation.dart';

enum Aria2BitTorrentMode { single, multi }

enum Aria2BtCryptoLevel { plain, arc4 }

enum Aria2DownloadingStatusStatus {
  active,
  waiting,
  paused,
  error,
  complete,
  removed,
}

@JsonEnum(valueField: 'alias')
enum Aria2DownloadResult with AliasEnumMixin {
  defaults('default'),
  full('full'),
  hide('hide');

  @override
  final String alias;

  const Aria2DownloadResult(this.alias);
}

enum Aria2FileAllocationMethod { none, prealloc, trunc, falloc }

enum Aria2FTPType { ascii, binary }

@JsonEnum(valueField: 'alias')
enum Aria2HashType with AliasEnumMixin {
  sha1('sha-1'),
  sha224('sha-224'),
  sha256('sha-256'),
  sha384('sha-384'),
  sha512('sha-512'),
  md5('md5'),
  adler32('adler32');

  @override
  final String alias;

  const Aria2HashType(this.alias);
}

enum Aria2HttpMethod { get, post }

enum Aria2LogLevel { debug, info, notice, warn, error }

enum Aria2MetalinkPreferredProtocol { http, https, ftp, none }

@JsonEnum(valueField: 'alias')
enum Aria2MethodName with AliasEnumMixin {
  addUri('aria2'),
  addTorrent('aria2'),
  addMetalink('aria2'),
  remove('aria2'),
  forceRemove('aria2'),
  pause('aria2'),
  pauseAll('aria2'),
  forcePause('aria2'),
  forcePauseAll('aria2'),
  unpause('aria2'),
  unpauseAll('aria2'),
  tellStatus('aria2'),
  getUris('aria2'),
  getFiles('aria2'),
  getPeers('aria2'),
  getServers('aria2'),
  tellActive('aria2'),
  tellWaiting('aria2'),
  tellStopped('aria2'),
  changePosition('aria2'),
  changeUri('aria2'),
  getOption('aria2'),
  changeOption('aria2'),
  getGlobalOption('aria2'),
  changeGlobalOption('aria2'),
  getGlobalStat('aria2'),
  purgeDownloadResult('aria2'),
  removeDownloadResult('aria2'),
  getVersion('aria2'),
  getSessionInfo('aria2'),
  shutdown('aria2'),
  forceShutdown('aria2'),
  saveSession('aria2'),
  multicall('system'),
  listMethods('system'),
  listNotifications('system');

  final String prefix;

  const Aria2MethodName(this.prefix);

  @override
  String get alias => '$prefix.$name';
}

@JsonEnum(valueField: 'alias')
enum Aria2NotificationName with AliasEnumMixin {
  onDownloadStart('aria2.onDownloadStart'),
  onDownloadPause('aria2.onDownloadPause'),
  onDownloadStop('aria2.onDownloadStop'),
  onDownloadComplete('aria2.onDownloadComplete'),
  onDownloadError('aria2.onDownloadError'),
  onBtDownloadComplete('aria2.onBtDownloadComplete');

  @override
  final String alias;

  const Aria2NotificationName(this.alias);
}

@JsonEnum(valueField: 'alias')
enum Aria2PositionSymbol with AliasEnumMixin {
  posSet('POS_SET'),
  posCur('POS_CUR'),
  posEnd('POS_END');

  @override
  final String alias;

  const Aria2PositionSymbol(this.alias);
}

enum Aria2ProxyMethod { get, tunnel }

@JsonEnum(valueField: 'alias')
enum Aria2StreamPieceSelector with AliasEnumMixin {
  defaults('default'),
  inorder('inorder'),
  random('random'),
  geom('geom');

  @override
  final String alias;

  const Aria2StreamPieceSelector(this.alias);
}

@JsonEnum(valueField: 'alias')
enum Aria2Symbol with AliasEnumMixin {
  yes('true'),
  no('false'),
  mem('mem');

  @override
  final String alias;

  const Aria2Symbol(this.alias);
}

enum Aria2UriSelector { inorder, feedback, adaptive }

enum Aria2UriStatus { used, waiting }
