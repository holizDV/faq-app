import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/config/config.dart';
import '../../../../core/network/api_method.dart';
import '../../../../core/network/local_storage.dart';
import '../model/faq_delete_model.dart';
import '../model/faq_detail_model.dart';
import '../model/faq_list_model.dart';
import '../model/faq_update_model.dart';

abstract class FaqRemoteDataSource {
  Future<FaqListModel> getListFaq({required int page, required int rows});
  Future<FaqDetailModel> getDetail(int faqID);
  Future<FaqDeleteModel> deleteFaq(int faqID);
  Future<FaqUpdateModel> updateFaq(
      {required String answer, required String question, required int faqID});
  Future<FaqUpdateModel> createFaq(
      {required String answer,
      required String question,
      required bool isPublish});
}

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  final ApiMethod method;
  final LocalStorage localStorage;

  FaqRemoteDataSourceImpl({
    required this.method,
    required this.localStorage,
  });

  final baseUrlFAQ = BuildConfig.get().baseUrlFAQ;

  @override
  Future<FaqListModel> getListFaq(
      {required int page, required int rows}) async {
    final token = localStorage.getTokenUser();

    Map<String, dynamic> params = {
      "page": page,
      "rows": rows,
    };

    final response = await method.get(
      url: "$baseUrlFAQ${dotenv.env["URL_FAQ"]}",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      params: params,
    );

    if (response != null) {
      return FaqListModel.fromJson(response);
    }

    return response;
  }

  @override
  Future<FaqDetailModel> getDetail(int faqID) async {
    final token = localStorage.getTokenUser();

    final response = await method.get(
      url: "$baseUrlFAQ${dotenv.env["URL_FAQ"]}/$faqID",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response != null) {
      return FaqDetailModel.fromJson(response);
    }

    return response;
  }

  @override
  Future<FaqUpdateModel> updateFaq(
      {required String answer,
      required String question,
      required int faqID}) async {
    final token = localStorage.getTokenUser();

    Map<String, dynamic> body = {
      "jawaban": answer,
      "pertanyaan": question,
    };

    final response = await method.post(
      url: "$baseUrlFAQ${dotenv.env["URL_FAQ"]}/$faqID",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    );

    if (response != null) {
      return FaqUpdateModel.fromJson(response);
    }

    return response;
  }

  @override
  Future<FaqUpdateModel> createFaq(
      {required String answer,
      required String question,
      required bool isPublish}) async {
    final token = localStorage.getTokenUser();

    Map<String, dynamic> body = {
      "jawaban": answer,
      "pertanyaan": question,
      "status_publish": isPublish,
    };

    final response = await method.post(
      url: "$baseUrlFAQ${dotenv.env["URL_FAQ"]}",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    );

    if (response != null) {
      return FaqUpdateModel.fromJson(response);
    }

    return response;
  }

  @override
  Future<FaqDeleteModel> deleteFaq(int faqID) async {
    final token = localStorage.getTokenUser();

    final response = await method.delete(
      url: "$baseUrlFAQ${dotenv.env["URL_FAQ"]}/$faqID",
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response != null) {
      return FaqDeleteModel.fromJson(response);
    }

    return response;
  }
}
