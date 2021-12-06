import 'package:fancicouidesign/custom/bordericon.dart';
import 'package:fancicouidesign/custom/optionbutton.dart';
import 'package:fancicouidesign/utils/constants.dart';
import 'package:fancicouidesign/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.itemData, }) : super(key: key);
  // final Map<String, dynamic> itemData;
  final dynamic itemData;

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
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.asset(itemData["image"]),
                            Positioned(
                              width: size.width,
                              top: padding,
                              child: Padding(
                                padding: sidePadding,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: const BorderIcon(
                                        height: 50,
                                        width: 50,
                                        child: Icon(
                                          Icons.keyboard_backspace,
                                          color: COLOR_BLACK,
                                        ),
                                      ),
                                    ),
                                    const BorderIcon(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: COLOR_BLACK,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(padding),
                        Padding(
                          padding: sidePadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${itemData["amount"]}",style: themeData.textTheme.headline1,),
                                  addVerticalSpace(5),
                                  Text("\$${itemData["address"]}",style: themeData.textTheme.bodyText2,),
                                ],
                              ),
                              Container(
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    primary: Colors.black,
                                    // backgroundColor: Colors.blue,
                                    textStyle: const TextStyle(fontSize: 20),
                                    side: BorderSide(color: COLOR_GREY.withAlpha(40),width: 2),
                                    shape:  const RoundedRectangleBorder(
                                      borderRadius:   BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child:  Text('20 Hours aro',style: themeData.textTheme.headline4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpace(padding),
                        Padding(
                          padding: sidePadding,
                          child: Text("House Information",style: themeData.textTheme.headline4,),
                        ),
                        addVerticalSpace(padding),
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                InformationTile(content: "${itemData["area"]}",name: "Square Foot",),
                                InformationTile(content: "${itemData["bedrooms"]}",name: "Bedrooms",),
                                InformationTile(content: "${itemData["bathrooms"]}",name: "Bathrooms",),
                                InformationTile(content: "${itemData["garage"]}",name: "Garage",)
                              ],
                            ),
                        ),
                        addVerticalSpace(padding),
                        Padding(
                          padding: sidePadding,
                          child: Text(itemData["description"]
                            ,textAlign: TextAlign.justify,style: themeData.textTheme.bodyText2,),
                        ),
                        addVerticalSpace(100),
                      ],
                    ),
                ),
                Positioned(
                  bottom: 20,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OptionButton(
                        width: size.width,
                        // width: size.width * 0.35,  is tera bi lekh sakty hain
                        icon: Icons.message,
                        text: "Message",
                      ),
                      addHorizontalSpace(10),
                      OptionButton(
                        width: size.width,
                        icon: Icons.call,
                        text: "Call...",
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}




class InformationTile extends StatelessWidget{

  final String content;
  final String name;

  const InformationTile({required this.content,required this.name});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width*0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BorderIcon(
              width: tileSize,
              height: tileSize,
              child: Text(content,style: themeData.textTheme.headline3,)),
          addVerticalSpace(15),
          Text(name,style: themeData.textTheme.headline6,)
        ],
      ),
    );

  }

}
