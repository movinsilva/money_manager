import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/charts/pie_chart_section.dart';
import 'package:money_manager/charts/savings_bar_chart.dart';
import 'package:provider/provider.dart';

Color green30 = const Color(0xff53fdd7).withOpacity(0.5);

class DashboardContainer extends StatefulWidget {
  const DashboardContainer({Key? key}) : super(key: key);

  @override
  State<DashboardContainer> createState() => _DashboardContainerState();
}

class _DashboardContainerState extends State<DashboardContainer> {
  @override
  Widget build(BuildContext context) {

    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    Color mainColor = Theme.of(context).colorScheme.onBackground;
    Color txtColor = mainColor.withOpacity(0.6);


    int? touchedIndex = -1;

    return Container(
      padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: Text("Welcome Movin,", style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: mainColor.withOpacity(0.7),
          ),)),
          SizedBox(height: 30,),

          // Main Box of information
          // Amount remaining , in wallet and in bank
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: 300,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff53fdd7).withOpacity(0.3),
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
                    Text("25 450", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: const Color(0xff53fdd7)),)
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
                                color: const Color(0xff53fdd7).withOpacity(0.6)
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
                                color: const Color(0xff53fdd7).withOpacity(0.6)
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Expenses Analysis"),
                  SizedBox(height: 40,),
                  SizedBox(
                    height: 120,
                    child: PieChart(
                        PieChartData(
                            sections: getSections(themeColor),
                            sectionsSpace: 5,
                            pieTouchData: PieTouchData(
                                touchCallback: (event, pieTouchResponse) {
                                  //pieTouchResponse!.touchedSection is FlLongPressEnd
                                  setState(() {
                                    if ( event is FlLongPressEnd||
                                        event is FlPanEndEvent) {
                                      touchedIndex = -1;
                                    } else {
                                      touchedIndex = pieTouchResponse?.touchedSection?.touchedSectionIndex;
                                    }
                                  });
                                }
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 50,),
                  breakerLine(),
                  SizedBox(height: 20,),

                  SavingsBarChart(),

                  SizedBox(height: 20,),
                  breakerLine(),
                  SizedBox(height: 20,),

                  Text("Top spending of the month"),
                  SizedBox(height: 40,),
                  spendingTile(mainColor.withOpacity(0.8)),
                  spendingTile(mainColor.withOpacity(0.8)),
                  spendingTile(mainColor.withOpacity(0.8)),

                  SizedBox(height: 20,),
                  breakerLine(),

                  SizedBox(height: 30,),

                  Text("Most Recent Transactions"),
                  SizedBox(height: 40,),
                  spendingTile(mainColor.withOpacity(0.8)),
                  spendingTile(mainColor.withOpacity(0.8)),
                  spendingTile(mainColor.withOpacity(0.8)),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }


  Container spendingTile(Color txtColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 0),
      child: Row(
        children: [
          Icon(Icons.book,
            color: Colors.blue,
            size: 30,),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stationery", style: TextStyle(
                  fontSize: 16, color: txtColor,
              ),),
              Text("Rs. 1510", style: TextStyle(
                fontSize: 12, color: txtColor,
              ),),
            ],
          ),
          Spacer(),
          const Text("32%", style: TextStyle(color: Color(0xffff5182)),)
        ],),
    );
  }

  Widget breakerLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: 125,
          color: green30,
        ),
        SizedBox(width: 4,),
        Icon(Icons.circle, color: green30, size: 10,),
        Icon(Icons.circle, color: green30, size: 10,),
        Icon(Icons.circle, color: green30, size: 10,),
        Icon(Icons.circle, color: green30, size: 10,),
        SizedBox(width: 4,),
        Container(
          height: 1,
          width: 125,
          color: green30,
        ),

      ],
    );
  }



}





