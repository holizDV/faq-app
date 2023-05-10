import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/login_entity.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel extends LoginEntity with _$LoginModel {
  const factory LoginModel({
    int? code,
    String? message,
    Data? data,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
class Data extends LoginDataEntity with _$Data {
  const factory Data({
    int? id,
    String? name,
    String? jenisUser,
    String? email,
    String? level,
    @JsonKey(name: "path_photo") String? pathFoto,
    @JsonKey(name: "access_token") String? accessToken,
    String? tokenType,
    String? expiresIn,
    String? nik,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
