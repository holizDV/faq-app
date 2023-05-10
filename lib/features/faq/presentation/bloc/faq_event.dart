part of 'faq_bloc.dart';

abstract class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

class FetchFaqListEvent extends FaqEvent {}

class CreateFaqEvent extends FaqEvent {}

class FetchFaqDetailEvent extends FaqEvent {
  final int faqID;

  const FetchFaqDetailEvent(this.faqID);
}

class UpdateFaqEvent extends FaqEvent {
  final int faqID;

  const UpdateFaqEvent(this.faqID);
}

class DeleteFaqEvent extends FaqEvent {
  final int faqID;

  const DeleteFaqEvent(this.faqID);
}
