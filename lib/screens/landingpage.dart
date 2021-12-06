import 'package:fancicouidesign/custom/bordericon.dart';
import 'package:fancicouidesign/custom/optionbutton.dart';
import 'package:fancicouidesign/utils/constants.dart';
import 'package:fancicouidesign/utils/widget_functions.dart';

import 'package:flutter/material.dart';

import '../sample_data.dart';
import 'DetailPage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25 ;
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding, //note
                    // padding: const EdgeInsets.symmetric(horizontal:padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BorderIcon(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderIcon(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.settings,
                            color: COLOR_BLACK,
                          ),
                        ),
                      ],
                    ),
                    //  //////note
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child:  Text(
                      "San Francisco",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                          .map((filter) => ChoiceOption(text: filter)).toList(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index){
                            return RealEstateItem(itemData: RE_DATA[index],);

                          }),
                    ),),
                ],

              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: Container(
                    child: OptionButton(
                      width: size.width,
                      // width: size.width * 0.35,
                      icon: Icons.map_rounded,
                      text: "Map View",
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
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({ required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(text, style: themeData.textTheme.headline5,
      ),
    );
  }
}



class RealEstateItem extends StatelessWidget {
    final dynamic itemData;
  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
              itemData: itemData,
            )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData["image"]),
                ),
                const Positioned(
                    top: 15,
                    right: 15,
                    child: BorderIcon(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.favorite_border,
                          color: COLOR_BLACK,
                        ))),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text("${(itemData["amount"])}",style: themeData.textTheme.headline1,),
                addHorizontalSpace(10),
                Text("${(itemData["address"])}",style: themeData.textTheme.bodyText2,),
              ],
            ),
            addVerticalSpace(10),
            Column(
              children: [
                Text(
                  "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
                  style: themeData.textTheme.headline5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
