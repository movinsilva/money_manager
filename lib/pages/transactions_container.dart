import 'package:flutter/material.dart';
import 'package:money_manager/utilities/my_themes.dart';

class TransactionsContainer extends StatefulWidget {
  const TransactionsContainer({Key? key}) : super(key: key);

  @override
  State<TransactionsContainer> createState() => _TransactionsContainerState();
}

class _TransactionsContainerState extends State<TransactionsContainer>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    Color mainColor = Theme.of(context).colorScheme.onBackground;
    Color txtColor = mainColor.withOpacity(0.6);

    TabController _tabController = TabController(length: 3, vsync: this);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: MyThemes.tColor.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "In wallet",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.wallet,
                          color: txtColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rs.",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "2 500",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff53fdd7).withOpacity(0.6)),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "In bank",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.account_balance_outlined,
                          color: txtColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rs.",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "21 950",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: MyThemes.tColor.withOpacity(0.6)),
                        )
                      ],
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.add,
                          color: txtColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rs.",
                          style: TextStyle(color: txtColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "25 450",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: MyThemes.mColor),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "Last Month",
              ),
              Tab(
                text: "This Month",
              ),
              Tab(
                text: "Next Month",
              )
            ],
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              tabItem(),
              Text("tab 2"),
              Text("tab 3"),
            ]),
          )
        ],
      ),
    );
  }

  Widget tabItem() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: MyThemes.mColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Inflow", style: TextStyle(color: MyThemes.inflowColor)),
                  Spacer(),
                  Text(
                    "Rs. 7 500",
                    style: TextStyle(color: MyThemes.inflowColor),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Outflow",
                    style: TextStyle(
                      color: MyThemes.outflowColor,
                    ),
                  ),
                  Spacer(),
                  Text("Rs. 4 000",
                      style: TextStyle(color: MyThemes.outflowColor))
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 2,
                color: Colors.white,
              ),
              Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(color: MyThemes.mColor),
                  ),
                  Spacer(),
                  Text("Rs. 3 500", style: TextStyle(color: MyThemes.mColor))
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              //bounce at boundaries, remove the color when scrolling at boundaries
              physics: BouncingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: MyThemes.mColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "01",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saturday",
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  "October 2022",
                                  style: TextStyle(
                                      color: Colors.white24, fontSize: 11),
                                )
                              ],
                            ),
                            Spacer(),
                            Text("- Rs. 2 010")
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          color: Colors.white24,
                          height: 1,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return transactionItem();
                            }),
                      ],
                    ));
              }),
        )
      ],
    );
  }

  Widget transactionItem() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.fastfood_outlined,
                size: 30,
                color: Colors.brown,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Food & Beverages"),
                  Text(
                    "Roots, Banana Boat",
                    style: TextStyle(fontSize: 11, color: Colors.white54),
                  )
                ],
              ),
              Spacer(),
              Text(
                "Rs. 410",
                style: TextStyle(color: MyThemes.outflowColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
