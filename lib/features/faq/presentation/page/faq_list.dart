import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/font_manager.dart';
import '../../../../core/manager/values_manager.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../bloc/faq_bloc.dart';
import '../widget/item_faq.dart';
import 'form_faq.dart';

class FaqList extends StatelessWidget {
  const FaqList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqBloc, FaqState>(
      builder: (context, state) {
        if (state.status == FaqStatus.error) {
          return Center(
            child: Text(
              "Something Error",
              style: Typograph.headline6,
            ),
          );
        }
        if (state.status == FaqStatus.loaded) {
          return ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: AppSize.s8),
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
            itemCount: state.faq.data?.length ?? 0,
            itemBuilder: (context, index) {
              final data = state.faq.data?[index];

              return ItemFaq(
                question: data!.pertanyaan!,
                answer: data.jawaban!,
                createdAt: "data.createdAt!",
                updateAt: "data.updatedAt!",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => BlocProvider(
                      create: (_) => FaqBloc(
                        getListFaq: sl(),
                        getDetailFaq: sl(),
                        updateFaq: sl(),
                        createFaq: sl(),
                        deleteFaq: sl(),
                      ),
                      child: FormFaq(
                          formType: FormFaqType.detail, faqID: data.id!),
                    ),
                  );
                },
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
