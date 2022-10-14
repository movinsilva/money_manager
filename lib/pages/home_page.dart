import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    Color mainColor = Theme.of(context).colorScheme.onBackground;
    Color txtColor = mainColor.withOpacity(0.6);
    
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Text("Welcome Movin,", style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: mainColor.withOpacity(0.7),
            ),)),
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: 300,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text("Rs.", style: TextStyle(
                        color: txtColor,
                      ),),
                      SizedBox(width: 10,),
                      Text("25 450", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: Colors.green),)
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("In wallet", style: TextStyle(color: txtColor),),
                              SizedBox(width: 5,),
                              Icon(Icons.wallet, color: txtColor,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Rs.", style: TextStyle(
                                  color: txtColor
                              ),),
                              SizedBox(width: 5,),
                              Text("2 500", style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                color: Colors.green.withOpacity(0.6)
                              ),)
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("In bank", style: TextStyle(color: txtColor),),
                              SizedBox(width: 5,),
                              Icon(Icons.account_balance_outlined, color: txtColor,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text("Rs.", style: TextStyle(
                                  color: txtColor
                              ),),
                              SizedBox(width: 5,),
                              Text("21 950", style: TextStyle(
                                fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                color: Colors.green.withOpacity(0.6)
                              ),)
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
