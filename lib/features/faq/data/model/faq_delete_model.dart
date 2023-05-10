import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/faq_delete_entity.dart';

part 'faq_delete_model.freezed.dart';
part 'faq_delete_model.g.dart';

@freezed
class FaqDeleteModel extends FaqDeleteEntity with _$FaqDeleteModel {
  const factory FaqDeleteModel({
    int? code,
    String? message,
    dynamic? data,
  }) = _FaqDeleteModel;

  factory FaqDeleteModel.fromJson(Map<String, dynamic> json) =>
      _$FaqDeleteModelFromJson(json);
}
