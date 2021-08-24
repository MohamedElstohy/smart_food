import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'package:smart_food/models/user.dart';
// import 'package:smart_food/provider/auth.dart';
import 'package:smart_food/provider/repository.dart';

import '../../helper.dart';
import '../../provider/auth.dart';
import '../home/home.dart';
import 'custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _phone;
  String _password;
  bool _obscure = true;
  bool isLoading = false;
  Repository repository = Repository();

  Future<void> submitLogin(BuildContext context) async{
    setState(() {
      isLoading = true;
    });
    final provider = Provider.of<Auth>(context, listen: false,);

    final loggedIn = await provider.login(body: Helper.getBody(phone: _phone, password: _password));
    bool notFakeUser = (loggedIn.age != -1 && loggedIn.id != -1 && loggedIn.gender != '-1' && loggedIn.mobile != '-1' && loggedIn.password != '-1');
    
    if(notFakeUser){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen()
        )
      );

      setState(() {
        isLoading = false;
      });


    } else{
      setState(() {
        isLoading = false;
      });
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something went wrong, please try again'
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                logo(context),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF46200B),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 40),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          // color: Color(0xFFAEC6323F),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          onChanged: (value){
                            setState(() {
                              _phone = value;
                            });
                          },
                          decoration: InputDecoration(
                            fillColor: Color(0xFFAEC632).withOpacity(0.85),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none
                            ),

                            contentPadding: EdgeInsets.only(right: 15),
                            hintText: 'رقم الهاتف',
                            hintStyle: TextStyle(
                              color: Color(0xFF46200B).withOpacity(0.6),
                              fontSize: 20
                            )
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          // color: Color(0xFFAEC6323F),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: TextField(
                          obscureText: _obscure,
                          onChanged: (value){
                            setState(() {
                              _password = value;
                            });
                          },
                          decoration: InputDecoration(
                            fillColor: Color(0xFFAEC632).withOpacity(0.85),
                            filled: true,
                            contentPadding: EdgeInsets.only(right: 15),
                            hintText: 'كلمة المرور',
                            suffixIcon: IconButton(
                              icon: Image(
                                image: AssetImage('assets/images/Icon awesome-eye-slash.png'),
                                height: 20,
                                width: 25,
                              ),
                              onPressed: (){
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFF46200B).withOpacity(0.6),
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Builder(
                        builder: (context) =>isLoading 
                        ? CircularProgressIndicator(backgroundColor: Color(0xFFAEC632),) 
                        :  CustomButton(
                              onPressed: () =>  submitLogin(context),
                            ),
                      ), 
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo(BuildContext context){
    return Container(
      width: double.infinity,
      height: Helper.getDeviceHeight(context)/3,
      child: Center(
        child: Image(
          image: AssetImage('assets/images/Group 119.png'),
          height: Helper.getDeviceHeight(context) / 5,
          width: Helper.getDeviceWidth(context) / 3,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}