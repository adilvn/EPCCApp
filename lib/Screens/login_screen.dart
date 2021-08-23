import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/controllers/loginController.dart';
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

  final controller = Get.lazyPut(() => LoginController());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        print("hello");
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          body: SingleChildScrollView(
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
                  color: epccBlue500,
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
                            autofocus: false,
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
                                fontFamily: roboto,
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
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 16,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passController.text = "";
                                  });
                                },
                              ),
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
                                fontFamily: roboto,
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
                                UserCredential user = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passController.text);

                                if (user.user != null) {
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(user.user!.uid)
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      DBService()
                                          .setUid(user.user!.uid.toString());
                                      DBService().setpass(_passController.text);
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Get.off(() => BottomNavigation(),
                                          transition: Transition.leftToRight,
                                          duration: Duration(seconds: 1),
                                          binding: HomePageBindings());

                                      this.cbRemember
                                          ? LoginController()
                                              .setLogin(this.cbRemember)
                                          : LoginController()
                                              .setLogin(this.cbRemember);

                                      Get.rawSnackbar(
                                          message: "Successfully Logged-in!",
                                          duration: Duration(seconds: 3));
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Get.rawSnackbar(
                                          message: "User does not exist",
                                          duration: Duration(seconds: 3));
                                    }
                                  }).onError((error, stackTrace) {
                                    print(error.toString());
                                  });
                                }
                                // });
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
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              primary: epccBlue500,
                              onPrimary: white,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 28),
                              textStyle: TextStyle(
                                  fontFamily: montserrat,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)))),
                      SizedBox(
                        height: 10,
                      ),
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
      )),
    );
  }
}
