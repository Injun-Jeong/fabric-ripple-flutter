import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/wallet.dart';

import '../service/users/users.svc.dart' as userSvc;
import '../service/wallets/wallet.svc.dart' as walletSvc;

// todo: 테스트 아이디 하드코딩 지울 것
String userId = "ns165";
String account = "KRWIBK4";

class InitPage extends StatefulWidget {
  InitPage({Key? key}) : super(key: key);

  @override
  InitPageState createState() => InitPageState();
}

class InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fabric Ripple'),
        actions: [
          IconButton(icon: Icon(Icons.attach_money), onPressed: _pushTest),
        ],
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: userSvc.getUser(userId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var firstName = snapshot.data!.firstName;
              return Text("hello, " + firstName, style: const TextStyle(fontSize: 36),);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  void _pushTest() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Wallet Info'),
              ),
              body: Center(
                child: FutureBuilder<Wallet>(
                  future: walletSvc.getWallet(account),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("Balance: " + snapshot.data!.balance, style: const TextStyle(fontSize: 36),);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ),
            );
        }, // ...to here.
      ),
    );
  }
}

