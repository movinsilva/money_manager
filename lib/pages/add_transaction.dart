import 'package:flutter/material.dart';
import 'package:money_manager/pages/categories_popup_card.dart';
import 'package:money_manager/utilities/hero_dialog_route.dart';
import 'package:money_manager/utilities/my_themes.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color themeColor = Theme.of(context).scaffoldBackgroundColor;
    Color mainColor = Theme.of(context).colorScheme.onBackground;
    Color txtColor = mainColor.withOpacity(0.6);

    /// Tag-value used for the add todo popup button.
    const String _heroCategorySelection = 'add-category-hero';

    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Text("Let's add a transaction,", style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: mainColor.withOpacity(0.7),
            ),)),
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Text("Rs.", style: TextStyle(
                    color: txtColor,
                    fontSize: 20,
                  ),),
                  SizedBox(width: 15,),
                  Container(
                    width: width*0.65,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyThemes.tColor.withOpacity(0.1), width: 2),
                      borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.wallet, color: txtColor.withOpacity(0.3),),
                      SizedBox(width: 10,),
                      Text("From wallet", style: TextStyle(
                        color: txtColor.withOpacity(0.3),
                      ),)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: MyThemes.tColor.withOpacity(0.1), width:0),
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemes.tColor.withOpacity(0.1)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_outlined, color: txtColor,),
                      SizedBox(width: 10,),
                      Text("From bank", style: TextStyle(color: txtColor),)
                    ],
                  ),
                ),
              ],
            ),


            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return const CategoriesPopupCard(
                  );
                }));
              },
              child: Hero(
                tag: _heroCategorySelection,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyThemes.tColor.withOpacity(0.1)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.category_outlined, color: txtColor,),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: TextStyle(
                                color: txtColor,
                                fontSize: 16,
                              ),
                              child: Text("Select Category",)
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 0.5,
                              width: width*0.65,
                              color: txtColor,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Icon(Icons.date_range_outlined, color: txtColor,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select Date",
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 16,
                        ),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 0.5,
                        width: width*0.65,
                        color: txtColor,
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Icon(Icons.description_outlined, color: txtColor,),
                  SizedBox(width: 15,),
                  Container(
                    width: width*0.65,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Add description"
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, color: txtColor,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add location (optional)",
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 16,
                        ),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 0.5,
                        width: width*0.65,
                        color: txtColor,
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 35,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Icon(Icons.person_add_alt, color: txtColor,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add person (optional)",
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 16,
                        ),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 0.5,
                        width: width*0.65,
                        color: txtColor,
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 35,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyThemes.tColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  Icon(Icons.event, color: txtColor,),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select event (optional)",
                        style: TextStyle(
                          color: txtColor,
                          fontSize: 16,
                        ),),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 0.5,
                        width: width*0.65,
                        color: txtColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
