import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/admin/controllers/loginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  void dispose() {
    controller.email.dispose();
    controller.pass.dispose();
    controller.conPass.dispose();

    super.dispose();
  }

  final controller = Get.find<loginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: epccBlue500,
          title: Text("ADD USER"),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Form(
              key: controller.formState,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                          width: 200,
                          height: 250,
                          /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset('assets/images/logo.png')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      validator: (val) {
                        if (val!.isEmpty || !GetUtils.isEmail(val.toString())) {
                          return "provide correct email";
                        }
                        return null;
                      },
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: controller.pass,
                      validator: (val) {
                        if (val!.isEmpty || val.length < 6) {
                          return "weak password";
                        }
                        return null;
                      },
                      obscureText: controller.showPass,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye,
                                color: controller.showPass
                                    ? Colors.grey
                                    : epccBlue500),
                            onPressed: () {
                              controller.setPassView(!controller.showPass);
                            },
                          ),
                          hintText: 'Enter valid password'),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: controller.conPass,
                      validator: (val) {
                        if (!controller.pass.text.contains(val!)) {
                          return "password not matched";
                        }
                        return null;
                      },
                      onChanged: (val) {},
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm password'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          shape: StadiumBorder(),
                          primary: epccBlue500),
                      onPressed: () async {
                        if (controller.formState.currentState!.validate()) {
                          controller.formState.currentState!.save();
                          try {
                            controller.setLoading(true);
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: controller.email.text,
                                    password: controller.pass.text);

                            if (userCredential.user != null) {
                              Get.back();
                              await DBService().addUser(controller.email.text,
                                  userCredential.user!.uid);

                              final _pass = await DBService().getPass();
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: Constant.ADMINMAIL,
                                      password: _pass);
                            }
                          } on FirebaseAuthException catch (e) {
                            controller.setLoading(false);
                            print(e.code);
                            if (e.code == 'email-already-in-use') {
                              Get.rawSnackbar(
                                  backgroundColor: epccBlue500,
                                  messageText: Text(
                                    "User already exist!",
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
                      child: Text(
                        'ADD USER',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  controller.isLoading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: CupertinoActivityIndicator(
                            radius: 20,
                          )),
                        )
                      : Container()
                ],
              ),
            ),
          );
        }));
  }
}
