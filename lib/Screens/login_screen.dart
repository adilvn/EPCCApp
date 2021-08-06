import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/controllers/loginController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool cbRemember = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    DBService().getADDUSER();
    // TODO: implement initState
    super.initState();
  }

  final controller = Get.lazyPut(() => LoginController());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.33,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/login_top_bg.png'))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/ifl_logo_small.png',
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "EPCC",
                          style: TextStyle(
                              fontFamily: comfortaa,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
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
                  color: Colors.blueGrey,
                  fontSize: 45.0,
                  fontFamily: roboto,
                  fontWeight: FontWeight.bold,
                )),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 45.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: epccGray500,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty || !GetUtils.isEmail(val)) {
                                return "Provide Correct Email...";
                              }
                            },
                            controller: _emailController,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: epccGray500,
                            ),
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: epccGray400, width: 1.5)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: epccBlue, width: 1.5)),
                              hintText: "abc@example.com",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                                fontFamily: comfortaa,
                              ),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: epccGray500,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (val) {
                              if (val!.isEmpty || val.length < 6) {
                                return "Provide Correct Password...";
                              }
                            },
                            controller: _passController,
                            obscureText: true,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: epccGray500,
                            ),
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 5),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: epccGray400, width: 1.5)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: epccBlue, width: 1.5)),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                fontFamily: comfortaa,
                              ),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: cbRemember,
                            onChanged: (cbRemember) => setState(() {
                              this.cbRemember = cbRemember!;
                            }),
                            activeColor: epccBlue,
                          ),
                          Text(
                            "Keep Me Logged-in",
                            style: TextStyle(
                                fontFamily: roboto,
                                fontSize: 16,
                                color: epccGray500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              try {
                                setState(() {
                                  isLoading = true;
                                });
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passController.text);
                                FirebaseAuth.instance
                                    .idTokenChanges()
                                    .listen((User? user) async {
                                  if (user != null) {
                                    this.cbRemember
                                        ? LoginController()
                                            .setLogin(this.cbRemember)
                                        : LoginController()
                                            .setLogin(this.cbRemember);
                                    print(user.uid);
                                    DBService().setUid(user.uid.toString());
                                    Get.off(() => BottomNavigation(),
                                        binding: HomePageBindings());

                                    isLoading = false;
                                    print(isLoading);
                                    Get.find<LoginController>().firstLogin
                                        ? DBService().addUser(
                                            _emailController.text, user.uid)
                                        : null;
                                    print(
                                        Get.find<LoginController>().firstLogin);
                                    Get.rawSnackbar(
                                        message: "Successfully Logged-in!",
                                        duration: Duration(seconds: 3));
                                  }
                                });
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  isLoading = false;
                                });
                                if (e.code == 'user-not-found') {
                                  Get.rawSnackbar(
                                      backgroundColor: epccBlue500,
                                      messageText: Text(
                                        "User Not Found!",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      icon: Icon(
                                        Icons.error,
                                        color: white,
                                        size: 22,
                                      ),
                                      duration: Duration(seconds: 2));
                                } else if (e.code == 'wrong-password') {
                                  Get.rawSnackbar(
                                      backgroundColor: epccBlue500,
                                      messageText: Text(
                                        "Invalid Password!",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      icon: Icon(
                                        Icons.error,
                                        color: white,
                                        size: 22,
                                      ),
                                      duration: Duration(seconds: 2));
                                } else {
                                  Get.rawSnackbar(
                                      backgroundColor: epccBlue500,
                                      messageText: Text(
                                        "Check Connection!",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      icon: Icon(
                                        Icons.error,
                                        color: white,
                                        size: 22,
                                      ),
                                      duration: Duration(seconds: 2));
                                }
                              }
                            }
                          },
                          child: Text("Let's Go"),
                          style: ElevatedButton.styleFrom(
                              primary: epccBlue500,
                              onPrimary: white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 22),
                              textStyle: TextStyle(
                                  fontFamily: montserrat,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)))),
                      isLoading
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: CupertinoActivityIndicator(
                                radius: 20,
                              )),
                            )
                          : Container()
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
