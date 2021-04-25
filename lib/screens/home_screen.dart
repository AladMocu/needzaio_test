import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:needzaio_test/service/graphql_service.dart';
import 'package:needzaio_test/values/need_zaio_icons.dart';
import 'package:needzaio_test/values/values.dart';
import 'package:needzaio_test/widgets/NavyBar.dart';
import 'package:needzaio_test/screens/users_screen.dart';
import 'package:needzaio_test/widgets/UserCard.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// Index used to move items in the navigation bar
  int _currentIndex = 0;




  @override
  Widget build(BuildContext context) {


    ///Screen height
    double sHeight = MediaQuery.of(context).size.height;

    ///Screen width
    double sWidth = MediaQuery.of(context).size.width;




    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Material(
                elevation: 5,
                shadowColor: AppColors.greyShade1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30))),
                child: Container(
                  height: 73,
                  width: sWidth,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    height: 36,
                    child: NavyBar(
                      selectedIndex: _currentIndex,
                      showElevation: false,
                      itemCornerRadius: 18,
                      onItemSelected: (index) => setState(() {
                        _currentIndex = index;
                      }),

                      items: [
                        NavyBarItem(
                          icon: Icon(NeedZaio.home,color: AppColors.black,size: 23.73,),
                          title: Text('Home',style: TextStyle(color: AppColors.primaryText),),
                          activeColor: AppColors.secondaryElement,
                        ),
                        NavyBarItem(
                            icon: Icon(NeedZaio.speech_bubble,color: AppColors.black,size: 25.35,),
                            title: Text('Chat',style: TextStyle(color: AppColors.primaryText),),
                            activeColor: AppColors.secondaryElement,
                        ),
                        NavyBarItem(
                            icon: Icon(NeedZaio.heart,color: AppColors.black,size: 21,),
                            title: Text('Love',style: TextStyle(color: AppColors.primaryText),),
                            activeColor: AppColors.secondaryElement,
                        ),
                        NavyBarItem(
                            icon: Icon(NeedZaio.user_2,color: AppColors.black, size: 19,),
                            title: Text('Profile',style: TextStyle(color: AppColors.primaryText),),
                            activeColor: AppColors.secondaryElement,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (107/812)*sHeight,
              child: Container(
                width:sWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Container(
                         padding: EdgeInsets.only(left: (24/375)*sWidth),
                         child: Text("CONTACTOS",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                     ),
                    SizedBox(height: 26,),
                    UsersScreen()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}