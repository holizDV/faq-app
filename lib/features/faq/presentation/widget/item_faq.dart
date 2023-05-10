import 'package:flutter/material.dart';

import '../../../../core/manager/font_manager.dart';
import '../../../../core/manager/values_manager.dart';

class ItemFaq extends StatelessWidget {
  const ItemFaq({
    required this.question,
    required this.answer,
    required this.createdAt,
    required this.updateAt,
    required this.onTap,
    super.key,
  });

  final String question;
  final String answer;
  final String createdAt;
  final String updateAt;
  final Function() onTap;

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: Typograph.label10m,
            ),
            const SizedBox(height: AppSize.s8),
            Text(
              removeAllHtmlTags(answer),
              style: Typograph.label10m,
            ),
          ],
        ),
      ),
    );
  }
}
