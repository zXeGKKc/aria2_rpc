// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aria2StringResponse _$Aria2StringResponseFromJson(Map<String, dynamic> json) =>
    Aria2StringResponse(
      id: json['id'] as String,
      result: json['result'] as String,
    );

Map<String, dynamic> _$Aria2StringResponseToJson(
  Aria2StringResponse instance,
) => <String, dynamic>{'id': instance.id, 'result': instance.result};

Aria2IntResponse _$Aria2IntResponseFromJson(Map<String, dynamic> json) =>
    Aria2IntResponse(
      id: json['id'] as String,
      result: (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$Aria2IntResponseToJson(Aria2IntResponse instance) =>
    <String, dynamic>{'id': instance.id, 'result': instance.result};

Aria2StringListResponse _$Aria2StringListResponseFromJson(
  Map<String, dynamic> json,
) => Aria2StringListResponse(
  id: json['id'] as String,
  result: (json['result'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$Aria2StringListResponseToJson(
  Aria2StringListResponse instance,
) => <String, dynamic>{'id': instance.id, 'result': instance.result};

Aria2IntListResponse _$Aria2IntListResponseFromJson(
  Map<String, dynamic> json,
) => Aria2IntListResponse(
  id: json['id'] as String,
  result: (json['result'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$Aria2IntListResponseToJson(
  Aria2IntListResponse instance,
) => <String, dynamic>{'id': instance.id, 'result': instance.result};

Aria2ResultListResponse<T>
_$Aria2ResultListResponseFromJson<T extends Aria2Result>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => Aria2ResultListResponse<T>(
  id: json['id'] as String,
  result: (json['result'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$Aria2ResultListResponseToJson<T extends Aria2Result>(
  Aria2ResultListResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'id': instance.id,
  'result': instance.result.map(toJsonT).toList(),
};

Aria2ResultResponse<T> _$Aria2ResultResponseFromJson<T extends Aria2Result>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => Aria2ResultResponse<T>(
  id: json['id'] as String,
  result: fromJsonT(json['result']),
);

Map<String, dynamic> _$Aria2ResultResponseToJson<T extends Aria2Result>(
  Aria2ResultResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'id': instance.id, 'result': toJsonT(instance.result)};

Map<String, dynamic> _$Aria2ErrorResponseToJson(Aria2ErrorResponse instance) =>
    <String, dynamic>{'id': instance.id, 'error': instance.aria2Error};

Map<String, dynamic> _$Aria2MulticallResponseToJson(
  Aria2MulticallResponse instance,
) => <String, dynamic>{'id': instance.id, 'result': instance.result};

Aria2NotificationResponse _$Aria2NotificationResponseFromJson(
  Map<String, dynamic> json,
) => Aria2NotificationResponse(
  method: $enumDecode(_$Aria2NotificationNameEnumMap, json['method']),
  data: (json['params'] as List<dynamic>)
      .map((e) => Aria2Notification.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$Aria2NotificationResponseToJson(
  Aria2NotificationResponse instance,
) => <String, dynamic>{
  'method': _$Aria2NotificationNameEnumMap[instance.method]!,
  'params': instance.data,
};

const _$Aria2NotificationNameEnumMap = {
  Aria2NotificationName.onDownloadStart: 'aria2.onDownloadStart',
  Aria2NotificationName.onDownloadPause: 'aria2.onDownloadPause',
  Aria2NotificationName.onDownloadStop: 'aria2.onDownloadStop',
  Aria2NotificationName.onDownloadComplete: 'aria2.onDownloadComplete',
  Aria2NotificationName.onDownloadError: 'aria2.onDownloadError',
  Aria2NotificationName.onBtDownloadComplete: 'aria2.onBtDownloadComplete',
};
