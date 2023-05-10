import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/faq_update_entity.dart';

part 'faq_update_model.freezed.dart';
part 'faq_update_model.g.dart';

@freezed
class FaqUpdateModel extends FaqUpdateEntity with _$FaqUpdateModel {
  const factory FaqUpdateModel({
    int? code,
    String? message,
    Data? data,
  }) = _FaqUpdateModel;

  factory FaqUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$FaqUpdateModelFromJson(json);
}

@freezed
class Data extends FaqUpdateData with _$Data {
  const factory Data({
    int? id,
    String? pertanyaan,
    String? jawaban,
    bool? statusPublish,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
