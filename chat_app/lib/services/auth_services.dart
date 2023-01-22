
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Auth extends ChangeNotifier{


  static init() async{

    _pref = await SharedPreferences.getInstance();

  }

  static late  final SharedPreferences _pref;

  Future<void> loginuser(String dsername) async{
    try {
      _pref.setString('Username', dsername);
    }
    catch(e){
      print(e);
    }
  }

  void logoutuser()  {
    _pref.clear();

  }

  String? getusernamr() {
    return _pref.getString('Username')?? 'Shauri!!';

  }

  void updateusername(String newname){

    _pref.setString('Username', newname);
    notifyListeners();


  }
}