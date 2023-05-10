class FaqDetailEntity {
  final int? code;
  final String? message;
  final FaqDetailData? data;

  FaqDetailEntity({
    this.code,
    this.message,
    this.data,
  });
}

class FaqDetailData {
  final int? id;
  final String? pertanyaan;
  final String? jawaban;
  final int? statusPublish;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FaqDetailData({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });
}
