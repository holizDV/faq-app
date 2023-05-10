class LoginEntity {
  final int? code;
  final String? message;
  final LoginDataEntity? data;

  LoginEntity({
    this.code,
    this.message,
    this.data,
  });
}

class LoginDataEntity {
  final int? id;
  final String? name;
  final String? jenisUser;
  final String? email;
  final String? level;
  final String? pathFoto;
  final String? accessToken;
  final String? tokenType;
  final String? expiresIn;
  final String? nik;

  LoginDataEntity({
    this.id,
    this.name,
    this.jenisUser,
    this.email,
    this.level,
    this.pathFoto,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.nik,
  });
}
