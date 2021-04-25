import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:needzaio_test/routes/router.gr.dart';
import 'package:needzaio_test/values/values.dart';
import 'package:location/location.dart';

/// First Screen in the app, containing a button and a image
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  /// Current state of the location permission.
  bool _locationEnabled = false;



  /// Check if the location permission is granted and if the location service is
  /// enabled
  void _determinePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_serviceEnabled&&_permissionGranted!=PermissionStatus.denied){
      setState(() {
        _locationEnabled = true;
      });
    }
    else
      {
        setState(() {
          _locationEnabled = false;
        });
      }

  }

  @override
  Widget build(BuildContext context) {
    _determinePosition();

    ///Screen height
    double sHeight = MediaQuery.of(context).size.height;

    ///Screen width
    double sWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: AppColors.secondaryElement,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: sHeight*(412/812),
              height: sHeight,
              left:  -sWidth/5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Hero(
                    child: Image.asset(ImagePath.splashImage),
                    tag: "robott",
                    )
              )
            ),
            Positioned(
                top: 158,
                left: 49,
                height: 300,
                width: sWidth*0.83,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "USERAPP",
                      style: TextStyle(fontSize: 37, color: AppColors.white, fontWeight: FontWeight.w900),),
                    SizedBox(height: 28,),
                    SizedBox(
                      height: 83,
                      width: (302/375)*sWidth,
                      child: AutoSizeText(
                          // Ill use the same lorem to verify line management
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                          style: TextStyle(fontWeight: FontWeight.w500),
                          minFontSize: 17,
                          maxFontSize: 17,
                          maxLines: 4,
                          textAlign: TextAlign.center
                      ),
                    ),
                    SizedBox(height: 22,),
                    MaterialButton(
                        onPressed: _locationEnabled?()=>{
                          LoginScreen().show(context)
                        }:null,
                        color: AppColors.primaryText,
                        elevation: 0,
                        height: 49,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        child: Text("IR A LOGIN"),
                        minWidth:  sWidth*0.83,

                    )
                  ],
                )
            )
          ],

        )
      ),
    );
  }

}