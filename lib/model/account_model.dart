final String tableUser = 'user';

class AccountFields {
  static final String name = 'name';
  static final String nickName = 'nick_name';
  static final String email = 'email';
}

class AccountModel {
  final String name;
  final String nickName;
  final String email;

  AccountModel(
      {required this.name, required this.nickName, required this.email});

  Map<String, Object?> toJson() => {
    AccountFields.name: name,
    AccountFields.nickName: nickName,
    AccountFields.email: email
  };
}
