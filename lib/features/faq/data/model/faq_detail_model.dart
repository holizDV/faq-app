import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/faq_detail_entity.dart';

part 'faq_detail_model.freezed.dart';
part 'faq_detail_model.g.dart';

@freezed
class FaqDetailModel extends FaqDetailEntity with _$FaqDetailModel {
  const factory FaqDetailModel({
    int? code,
    String? message,
    Data? data,
  }) = _FaqDetailModel;

  factory FaqDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FaqDetailModelFromJson(json);
}

@freezed
class Data extends FaqDetailData with _$Data {
  const factory Data({
    int? id,
    String? pertanyaan,
    String? jawaban,
    int? statusPublish,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
