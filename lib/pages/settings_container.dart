import 'package:flutter/material.dart';
import 'package:money_manager/database/db_helper.dart';
import 'package:money_manager/model/account_model.dart';
import 'package:money_manager/utilities/bottom_nav_info.dart';
import 'package:money_manager/utilities/my_themes.dart';
import 'package:money_manager/utilities/route_generator.dart';
import 'package:provider/provider.dart';

class SettingContainer extends StatelessWidget {
  const SettingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    Color mainColor = Theme.of(context).colorScheme.onBackground;

    List settingsItems = [
      "General Settings",
      "Account Settings",
      "Export CSV",
      "Change formats",
      "Categories",
      "About"
    ];

    List<IconData> iconList = [
      Icons.settings,
      Icons.person,
      Icons.file_copy,
      Icons.format_align_left,
      Icons.category,
      Icons.app_blocking

    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.person_outline_sharp, size: 80,
          color: MyThemes.tColor,),
          Text("Movin Silva",
          style: TextStyle(
            fontSize: 18,
          ),),
          Text("movinpinsara@gmail.com", style: TextStyle(
            fontSize: 12,
            color: mainColor.withOpacity(0.5)
          ),),
          Expanded(child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
            return InkWell(
              onTap: ()async{

                List<Map<String, dynamic>> k = await DbHelper.instance.queryAll(tableUser);
                print("query all: ");
                print(k);

                var bottomNavInfo = Provider.of<BottomNavInfo>(context, listen: false);
                bottomNavInfo.updateSubIndex(index+1);

              },
              child: Container(
                decoration: BoxDecoration(
                  color: MyThemes.tColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  children: [
                    Icon(iconList[index]),
                    SizedBox(width: 20,),
                    Text(settingsItems[index])
                  ],
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
