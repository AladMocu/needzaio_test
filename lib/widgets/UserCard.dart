import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:needzaio_test/values/values.dart';

class UserCard extends StatelessWidget{
  UserCard({
    this.name,
    this.mail,
    this.profileURL="https://via.placeholder.com/150/92c952"
});

final String name;

final String mail;

final String profileURL;


  @override
  Widget build(BuildContext context) {

    ///Screen height
    double sHeight = MediaQuery.of(context).size.height;

    ///Screen width
    double sWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(bottom: 18),
        width: (322/375)*sWidth,
        height: (59/812)*sHeight,
        decoration: BoxDecoration(
          color: AppColors.accentElement,
          borderRadius: BorderRadius.all(Radius.circular(14)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.greyShade1.withOpacity(0.05),
                  spreadRadius: 3,
                  blurRadius:6,
                  offset: Offset(0,4)
              )
            ]
        ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              height: (59/812)*sHeight,
              width: (65/375)*sWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                image: DecorationImage(image: NetworkImage(profileURL),fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Positioned(
            left: (85/375)*sWidth,
            child: Container(
              height: (59/812)*sHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  Text(mail, style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
          Positioned(
            right: (13/375)*sWidth,
              child: Container(
                  height: (59/812)*sHeight,
                  child: Icon(Icons.arrow_forward_ios_rounded,color: AppColors.secondaryElement,)
              )
          )
        ],
      ),

    );
  }

}