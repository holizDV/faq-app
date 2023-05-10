part of 'faq_bloc.dart';

enum FaqStatus { initial, loading, loaded, error }

enum FaqDetailStatus { initial, loading, loaded, error }

enum FaqUpdateStatus { initial, loading, loaded, error }

enum FaqCreateStatus { initial, loading, loaded, error }

enum FaqDeleteStatus { initial, loading, loaded, error }

class FaqState extends Equatable {
  final FaqStatus status;
  final FaqDetailStatus statusDetail;
  final FaqUpdateStatus statusUpdate;
  final FaqCreateStatus statusCreate;
  final FaqDeleteStatus statusDelete;
  final FaqListEntity faq;
  final FaqDetailEntity faqDetail;
  final FaqUpdateEntity faqUpdate;
  final FaqDeleteEntity faqDelete;
  final ErrorObject? error;

  const FaqState({
    required this.status,
    required this.statusDetail,
    required this.statusUpdate,
    required this.statusCreate,
    required this.statusDelete,
    required this.faq,
    required this.faqDetail,
    required this.faqUpdate,
    required this.faqDelete,
    this.error,
  });

  factory FaqState.initial() {
    return FaqState(
      statusDetail: FaqDetailStatus.initial,
      status: FaqStatus.initial,
      statusUpdate: FaqUpdateStatus.initial,
      statusCreate: FaqCreateStatus.initial,
      statusDelete: FaqDeleteStatus.initial,
      faq: FaqListEntity(),
      faqDetail: FaqDetailEntity(),
      faqUpdate: FaqUpdateEntity(),
      faqDelete: FaqDeleteEntity(),
    );
  }

  @override
  List<Object> get props => [
        status,
        statusDetail,
        statusUpdate,
        statusCreate,
        statusDelete,
        faq,
        faqDetail,
        faqUpdate,
        faqDelete,
      ];

  FaqState copyWith({
    FaqStatus? status,
    FaqDetailStatus? statusDetail,
    FaqUpdateStatus? statusUpdate,
    FaqCreateStatus? statusCreate,
    FaqDeleteStatus? statusDelete,
    ErrorObject? error,
    FaqListEntity? faq,
    FaqDetailEntity? faqDetail,
    FaqUpdateEntity? faqUpdate,
    FaqDeleteEntity? faqDelete,
  }) {
    return FaqState(
      status: status ?? this.status,
      statusDetail: statusDetail ?? this.statusDetail,
      statusUpdate: statusUpdate ?? this.statusUpdate,
      statusCreate: statusCreate ?? this.statusCreate,
      statusDelete: statusDelete ?? this.statusDelete,
      error: error ?? this.error,
      faq: faq ?? this.faq,
      faqDetail: faqDetail ?? this.faqDetail,
      faqUpdate: faqUpdate ?? this.faqUpdate,
      faqDelete: faqDelete ?? this.faqDelete,
    );
  }
}
