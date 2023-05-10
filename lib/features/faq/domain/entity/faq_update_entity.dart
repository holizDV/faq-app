class FaqUpdateEntity {
  final int? code;
  final String? message;
  final FaqUpdateData? data;

  FaqUpdateEntity({
    this.code,
    this.message,
    this.data,
  });
}

class FaqUpdateData {
  final int? id;
  final String? pertanyaan;
  final String? jawaban;
  final bool? statusPublish;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FaqUpdateData({
    this.id,
    this.pertanyaan,
    this.jawaban,
    this.statusPublish,
    this.createdAt,
    this.updatedAt,
  });
}
