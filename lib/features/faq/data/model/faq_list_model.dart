import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/faq_list_entity.dart';

part 'faq_list_model.freezed.dart';
part 'faq_list_model.g.dart';

@freezed
class FaqListModel extends FaqListEntity with _$FaqListModel {
  const factory FaqListModel({
    int? code,
    String? message,
    List<Data>? data,
    Pagination? pagination,
  }) = _FaqListModel;

  factory FaqListModel.fromJson(Map<String, dynamic> json) =>
      _$FaqListModelFromJson(json);
}

@freezed
class Data extends FaqListData with _$Data {
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

@freezed
class Pagination extends FaqListPagination with _$Pagination {
  const factory Pagination({
    int? currentPage,
    int? totalRows,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
