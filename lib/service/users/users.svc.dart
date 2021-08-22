import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/user.dart';

/* api server info */
const ip = 'http://158.247.203.166';
const port = '3000';
const path = ip + ":" + port;


/**
 * name: getUser
 * description: 유저 정보 조회
 * in
 *  - userId string
 */
Future<User> getUser(String userId) async {
  /* 필수 입력값 체크 */
  if ( userId.isEmpty ) {
    throw Exception('there is no {userId}');
  }

  /* 유저 정보 조회 */
  final response = await http.get(Uri.parse( path + '/users/' + userId ));

  /* 결과값 반환 */
  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}




