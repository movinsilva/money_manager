import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:money_manager/data/global_data.dart';
import 'package:money_manager/database/db_helper.dart';
import 'package:money_manager/model/account_model.dart';
import 'package:money_manager/pages/home_page.dart';
import 'package:provider/provider.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {

  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometrics;
  String autherized = "Not autherized";

  Future<void> _checkBiometric() async{
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch(e){
      print(e);
    }
    if(!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  //getting the available biometric sensor on device
  Future<void> _getAvailableBiometric() async{
    List<BiometricType> availableBiometric = [];
    try{
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch(e){
      print(e);
    }

    setState(() {
      _availableBiometrics = availableBiometric;
    });
  }

  //main function that allows to authenticate

  Future<void> _authenticate() async{
    bool authenticated = false;

    try{
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger",
      );
    } on PlatformException catch(e){
      print(e);
    }

    if(!mounted) return;

    setState(() async {
      //after the user is authenticated
      autherized = authenticated? "Autherization Successful" : "Failed to authenticate";
      if(authenticated) {

        // taking user info from the database
        print('waiting for data...');
        List<Map<String, dynamic>> userInfo = await DbHelper.instance.queryAll(tableUser);
        print(userInfo);
        var globalData = Provider.of<GlobalData>(context, listen: false);
        globalData.nickName = userInfo[0]["nick_name"];
        globalData.email = userInfo[0]["email"];
        globalData.name = userInfo[0]["name"];

        Navigator.pushNamed(context, '/');
      }
      print(autherized);
    });
  }


  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();
    _authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Money Manager",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),),
            SizedBox(height: 50,),
            Center(
              child: Text("Authenticate", style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
