import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:needzaio_test/routes/router.gr.dart';
import 'package:needzaio_test/values/need_zaio_icons.dart';
import 'package:needzaio_test/values/values.dart';
import 'package:needzaio_test/service/graphql_service.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _inputUsernameController = TextEditingController();

  final _inputPasswordController = TextEditingController();

  GraphQLService _qgService =  GetIt.I.get<GraphQLService>();

  /// Loading state of the login button
  bool _isLoading = true;
  /// Valid state of the user field
  bool _userValid = false;
  /// Valid state of the password field
  bool _pwValid = false;

  ///UserName field validations, returns the error message if any validation
  ///fails, null otherwise
  String _validateUser(String value)
  {
    if(value==null||value.length==0)
      {
        return "Username is Required";
      }
    return null;
  }
  ///Password field validations, returns the error message if any validation
  ///fails, null otherwise
  String _validatePassword(String value)
  {
    if(value==null||value.length==0)
    {
      return "Username is Required";
    }
    return null;
  }

  /// check for the field as it puts the button in waiting state
  void _login(context){
    setState(()
    {
      _isLoading = true;
      _qgService.signIn(_inputUsernameController.value.text, _inputPasswordController.value.text).then((value) =>
      {
        if(value==null)
          {
            HomeScreen().show(context)
          }
        else
          {
            setState((){
              _isLoading = false;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
            })
          }
      }
      );
    }
    );
  }
  @override
  void initState() {
    super.initState();
    _inputUsernameController.addListener(() {
      final isUNameValid= _validateUser(_inputUsernameController.value.text)==null;
      if(isUNameValid!=_userValid)
        {
          setState(() {
            _userValid=isUNameValid;
          });
        }
    });
    _inputPasswordController.addListener(() {
      final isPWValid= _validateUser(_inputPasswordController.value.text)==null;
      if(isPWValid!=_pwValid)
      {
        setState(() {
          _pwValid=isPWValid;
        });
      }
    });


  }
  @override
  Widget build(BuildContext context) {

    ///Screen height
    double sHeight = MediaQuery.of(context).size.height;

    ///Screen width
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            width: sWidth,
            height: sHeight/2,
            child: Container(

              decoration: BoxDecoration(

                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                color: AppColors.white
              ),
              padding: EdgeInsets.fromLTRB((32/375)*sWidth, 0, (32/375)*sWidth, 0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _inputUsernameController,
                    decoration: InputDecoration(
                      icon: Icon(NeedZaio.user,color: AppColors.secondaryElement,size: 26,),
                      contentPadding: EdgeInsets.all(0),
                      labelText: 'Username',
                      labelStyle:TextStyle(color: AppColors.lineColor,fontWeight: FontWeight.w100),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lineColor,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lineColor,width: 2),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value)
                    {
                      return _validateUser(value);
                    },
                  ),
                  SizedBox(height: (42/812)*sHeight,),
                  TextFormField(
                    controller: _inputPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(NeedZaio.lock,color: AppColors.secondaryElement,size: 25,),
                      labelText: 'Password',
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: TextStyle(color: AppColors.lineColor, fontWeight: FontWeight.w400, ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lineColor,width: 2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lineColor,width: 2),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value)
                    {
                      return _validatePassword(value);
                    },
                  ),
                  SizedBox(height: (42/812)*sHeight,),
                  (_isLoading&&!(_userValid&&_pwValid)) ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondaryElement),): MaterialButton(
                    onPressed: ()=>{
                    _login(context)
                    },
                    color: AppColors.secondaryElement,
                    elevation: 0,
                    height: 49,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    child: Text("SIGN IN", style: TextStyle(color: AppColors.white),),
                    minWidth:  sWidth*(311/375),
                  ),
                  SizedBox(height: (51/812)*sHeight,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style: TextStyle(color: AppColors.lineColor, fontWeight: FontWeight.w500),),
                      SizedBox(width: 8,),
                      GestureDetector(
                        onTap: ()=>{},
                        child: Text("SIGN UP", style: TextStyle(color: AppColors.secondaryElement, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
              bottom: sHeight*(356/812),
              top: sHeight*(84/812),
              right: -30,
              child: Hero(
                child: Image.asset(ImagePath.splashImage),
                tag: "robott",
              )
          ),
        ],
      ),
      backgroundColor: AppColors.secondaryElement,
    );


  }


}