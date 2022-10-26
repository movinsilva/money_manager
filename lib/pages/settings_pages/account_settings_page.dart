import 'package:flutter/material.dart';
import 'package:money_manager/database/db_helper.dart';
import 'package:money_manager/model/account_model.dart';
import 'package:money_manager/utilities/my_themes.dart';


class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  final Color txtColor = Colors.white54;

  @override
  Widget build(BuildContext context) {

    String name = "Amal Perera";
    String nickName = 'Amal';
    String email = "amal@gmail.com";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Account Information", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: txtColor,
          ),),
          SizedBox(height: 50,),

          //name
          Text("Name", style: TextStyle(
            color: txtColor,
            fontSize: 11
          ),),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border.all(color: MyThemes.tColor, ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextButton(
              onPressed: () async {

                print("Waiting for the database to be active");
                List<Map<String, dynamic>> r = await DbHelper.instance.queryAll(tableUser);
                print(r);

            },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(name, style: TextStyle(
                  ),)),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ),

          SizedBox(height: 25,),
          //nick name
          Text("Nick Name (Name to call you)", style: TextStyle(
              color: txtColor,
              fontSize: 11
          ),),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                border: Border.all(color: MyThemes.tColor, ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextButton(
              onPressed: () {

              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(nickName, style: TextStyle(
                  ),)),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ),


          SizedBox(height: 25,),
          //email
          Text("Email Address", style: TextStyle(
              color: txtColor,
              fontSize: 11
          ),),
          SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                border: Border.all(color: MyThemes.tColor, ),
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextButton(
              onPressed: () {

              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(email, style: TextStyle(
                  ),)),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
