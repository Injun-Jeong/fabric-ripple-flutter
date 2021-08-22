class User {
  final String userId;
  final String account;
  final String firstName;
  final String lastName;
  final String nation;
  final String pw;
  final String rippleAccount;

  User({
    required this.userId,
    required this.account,
    required this.firstName,
    required this.lastName,
    required this.nation,
    required this.pw,
    required this.rippleAccount
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      account: json['account'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      nation: json['nation'],
      pw: json['pw'],
      rippleAccount: json['rippleAccount'],
    );
  }
}