class FaqListEntity {
  final int? code;
  final String? message;
  final List<FaqListData>? data;
  final FaqListPagination? pagination;

  FaqListEntity({
    this.code,
    this.message,
    this.data,
    this.pagination,
  });
}

class FaqListData {
  final int? id;
  final String? pertanyaan;
  final String? jawaban;
  final int? statusPublish;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FaqListData({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });
}

class FaqListPagination {
  final int? currentPage;
  final int? totalRows;

  FaqListPagination({
    this.currentPage,
    this.totalRows,
  });
}
