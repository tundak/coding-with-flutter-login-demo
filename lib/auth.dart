import 'dart:async';
import 'package:login_demo/network_utils.dart';


NetworkUtil _netUtil = new NetworkUtil();
final BASE_URL = "https://example.com/api/";

abstract class BaseAuth {
  Future<dynamic> httpSignIn(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {

  @override
  Future<dynamic> httpSignIn(String email, String password) async {
    return _netUtil.post(BASE_URL + "login", body: {
      "email": email,
      "password": password
    }).then((dynamic res) {
      if (res["status"] ==  false) {
        throw(res["msg"]);

      }else{
        print(res["result"]["email"]);
      }
      return res["result"]["email"];

    });
  }

  @override
  Future<String> currentUser() async {
    //check current user stuff here like saved in db user and return userId if already signed in or null for new signin
    return null;
  }

  @override
  Future<void> signOut() async {
    //do on logout stuff here
    return true;
  }
}
