import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_review_model.freezed.dart';
part 'dish_review_model.g.dart';

@freezed
class DishReviewModel with _$DishReviewModel {
  const factory DishReviewModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'menuItemId') required int menuItemId,
    @JsonKey(name: 'itemName') required String itemName,
    @JsonKey(name: 'itemPrice') required double itemPrice,
    @JsonKey(name: 'itemImage') String? itemImage,
    @JsonKey(name: 'userId') required int userId,
    @JsonKey(name: 'userName') required String userName,
    @JsonKey(name: 'userAvatar') String? userAvatar,
    @JsonKey(name: 'rating') required int rating,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'images') required List<String> images,
    @JsonKey(name: 'createdAt') required String createdAt,
  }) = _DishReviewModel;

  factory DishReviewModel.fromJson(Map<String, dynamic> json) =>
      _$DishReviewModelFromJson(json);
}
