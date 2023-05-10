import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/config/config.dart';
import '../../../../core/network/api_method.dart';
import '../model/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginUser({required String nip, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiMethod method;

  AuthRemoteDataSourceImpl(this.method);

  final baseUrlFAQ = BuildConfig.get().baseUrlFAQ;

  @override
  Future<LoginModel> loginUser({
    required String nip,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "nip": nip,
      "password": password,
    };

    final response = await method.post(
      url: "$baseUrlFAQ${dotenv.env["URL_AUTH_LOGIN"]}",
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response != null) {
      return LoginModel.fromJson(response);
    }

    return response;
  }
}
