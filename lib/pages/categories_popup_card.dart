import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/bottom_nav_info.dart';
import '../utilities/my_themes.dart';


class CategoriesPopupCard extends StatefulWidget {
  const CategoriesPopupCard({Key? key}) : super(key: key);

  @override
  State<CategoriesPopupCard> createState() => _CategoriesPopupCardState();
}

class _CategoriesPopupCardState extends State<CategoriesPopupCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Hero(
        tag: "add-category-hero",
        child: SingleChildScrollView(
          child: Stack(
            children: [

              Container(
                height: size.height*0.75,
                width: size.width*0.8,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Material(
                  color: MyThemes.tColor.withOpacity(0.1),
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(
                            text: "Expenses",
                          ),
                          Tab(
                            text: "Income",
                          ),
                          Tab(
                            text: "Debts/Loans",
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
                ),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    var bottomNavInfo = Provider.of<BottomNavInfo>(context, listen: false);
                    bottomNavInfo.updateSubIndex(1);
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Center(child: Icon(Icons.add),),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MyThemes.tColor,
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabItem() {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood_outlined,
                size: 35,),
                SizedBox(
                  width: 15,
                ),
                Text("Foods and Beverages"),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(left: 35, right: 10, bottom: 4),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.local_drink,
                        size: 30,),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Foods and Beverages"),
                    ],
                  ),
                );
              }),
          SizedBox(height: 10,),
        ],
      );
    });
  }

}
