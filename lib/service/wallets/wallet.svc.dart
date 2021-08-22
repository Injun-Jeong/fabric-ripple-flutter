import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/wallet.dart';

/* api server info */
const ip = 'http://158.247.203.166';
const port = '3000';
const path = ip + ":" + port;


/**
 * name: getWallet
 * description: 지갑 정보 조회
 * in
 *  - account string
 */
Future<Wallet> getWallet(String account) async {
  /* 필수 입력값 체크 */
  if ( account.isEmpty ) {
    throw Exception('there is no {account}');
  }

  /* 지갑 정보 조회 */
  final response = await http.get(Uri.parse( path + '/wallets/' + account ));

  /* 결과값 반환 */
  if (response.statusCode == 200) {
    print(response.body);
    return Wallet.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load wallet');
  }
}




