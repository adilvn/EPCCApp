import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool cbRemember = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      height: size.height*0.33,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/login_top_bg.png'))
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/ifl_logo_small.png'),
                            SizedBox(width: 10.0,),
                            Text("EPCC",
                            style: TextStyle(
                              fontFamily: comfortaa,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                              ),
                              )
                          ],
                        ),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0),
                Text("Login",
                  style: TextStyle(
                    color: epccBlue,
                    fontSize: 45.0,
                    fontFamily: roboto,
                    fontWeight: FontWeight.bold,
                    )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:40.0, horizontal: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: epccGray500,
                          ),
                          SizedBox(width: 10.0,),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: epccGray500,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: epccGray400,
                                    width: 1.5
                                  )
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: epccBlue,
                                    width: 1.5
                                  )
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  fontFamily: comfortaa,
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: epccGray500,
                          ),
                          SizedBox(width: 10.0,),
                          Expanded(
                            child: TextField(
                              controller: _passController,
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: epccGray500,
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: epccGray400,
                                    width: 1.5
                                  )
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: epccBlue,
                                    width: 1.5
                                  )
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  fontFamily: comfortaa,
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: cbRemember,
                            onChanged: (cbRemember) => setState(() => this.cbRemember = cbRemember!),
                            activeColor: epccBlue,
                          ),
                          Text("Keep me logged in",
                            style: TextStyle(
                              fontFamily: roboto,
                              fontSize: 16,
                              color: epccGray500
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50,),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passController.text
                            );
                            FirebaseAuth.instance
                              .idTokenChanges()
                              .listen((User? user) {
                                if (user != null) {
                                  Fluttertoast.showToast(msg: "Login Successfull!");
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => HomeScreen()
                                  ));
                                } else {
                                  Fluttertoast.showToast(msg: "Login Unsuccessfull!");
                                }
                              });
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Fluttertoast.showToast(msg: "Invalid Email!");
                            } else if (e.code == 'wrong-password') {
                              Fluttertoast.showToast(msg: "Invalid Password!");
                            }
                          }
                        },
                        child: Text("Let's Go"),
                        style: ElevatedButton.styleFrom(
                          primary: epccBlue500,
                          onPrimary: white,
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                          textStyle: TextStyle(
                            fontFamily: montserrat,
                            fontSize: 32,
                            fontWeight: FontWeight.w500
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0 )
                          )
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          )
        
      
    );
  }

}