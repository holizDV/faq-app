import 'package:faq_app/features/faq/presentation/page/faq_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/font_manager.dart';
import '../../../../core/manager/values_manager.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../bloc/faq_bloc.dart';
import 'form_faq.dart';

class HomeFaqPage extends StatefulWidget {
  const HomeFaqPage({super.key});

  @override
  State<HomeFaqPage> createState() => _HomeFaqPageState();
}

class _HomeFaqPageState extends State<HomeFaqPage> {
  @override
  void initState() {
    context.read<FaqBloc>().add(FetchFaqListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ List",
          style: Typograph.label18m.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
              child: const FormFaq(formType: FormFaqType.add),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s24),
        ),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
          onRefresh: () async =>
              context.read<FaqBloc>().add(FetchFaqListEvent()),
          child: const FaqList()),
    );
  }
}
