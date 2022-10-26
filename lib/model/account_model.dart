final String tableUser = 'user';

class AccountFields {
  static final String name = 'name';
  static final String nickName = 'nick_name';
  static final String email = 'email';
}

class AccountModel{
  final String name;
  final String nickName;
  final String email;

  AccountModel(this.name, this.nickName, this.email);
}