// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedReviewResponseImpl _$$PaginatedReviewResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PaginatedReviewResponseImpl(
  records: (json['records'] as List<dynamic>)
      .map((e) => DishReviewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  current: (json['current'] as num).toInt(),
);

Map<String, dynamic> _$$PaginatedReviewResponseImplToJson(
  _$PaginatedReviewResponseImpl instance,
) => <String, dynamic>{
  'records': instance.records,
  'total': instance.total,
  'size': instance.size,
  'current': instance.current,
};
