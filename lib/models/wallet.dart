class Wallet {
  final String account;
  final String token;
  final String bank;
  final String balance;
  final String lastTxTime;

  Wallet({
    required this.account,
    required this.token,
    required this.bank,
    required this.balance,
    required this.lastTxTime,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      account: json['Account'],
      token: json['Token'],
      bank: json['Bank'],
      balance: json['Balance'],
      lastTxTime: json['Date'],
    );
  }
}