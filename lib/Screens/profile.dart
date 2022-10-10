import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Authentication/authentication.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';

import 'package:epcc/admin/bindings/loginBinding.dart';
import 'package:epcc/admin/views/adduser.dart';
import 'package:epcc/admin/views/admin_home.dart';
import 'package:epcc/controllers/loginController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  XFile? _image;
  late String filename = "";
  final _pickimage = ImagePicker();
  Future pickImage() async {
    XFile? image = await _pickimage.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
        filename = basename(image.path);
      });
    }
  }

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: epccBlue500,
        title: Text(
          "User Profile",
          style: TextStyle(
              color: white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: users.doc(controller.uid).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("wei"),
              );
            }
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              var val = data.length == 3 ? "image" : "full_name";

              return Container(
                alignment: Alignment.center,
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(48.0),
                          child: Container(
                            width: 150,
                            height: 150,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle),
                            child: filename == ""
                                ? data[val] == ""
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          pickImage().whenComplete(() {
                                            filename != ""
                                                ? DBService().uploadImage(
                                                    File(_image!.path),
                                                    controller.uid)
                                                : null;
                                          });
                                        },
                                        child: Container(
                                          child: CachedNetworkImage(
                                            imageUrl: data[val],
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: imageProvider,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Center(
                                                    child:
                                                        CupertinoActivityIndicator(
                                              radius: 25,
                                            )),
                                            errorWidget:
                                                (context, url, error) => Icon(
                                              Icons.person,
                                              size: 60,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                : Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                FileImage(File(_image!.path)))),
                                  ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Username"),
                                  Text(data["full_name"].toString().substring(
                                      0, data["full_name"].indexOf("@")))
                                ],
                              ),
                            ),
                            divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Email"),
                                  Text(data["full_name"])
                                ],
                              ),
                            ),
                            divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Profile Picture"),
                                  ElevatedButton(
                                    onPressed: () {
                                      pickImage().whenComplete(() {
                                        filename != ""
                                            ? DBService().uploadImage(
                                                File(_image!.path),
                                                controller.uid)
                                            : null;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        shape: StadiumBorder(),
                                        primary: epccBlue500),
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Change Password"),
                                  ElevatedButton(
                                    onPressed: () {
                                      _showDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        shape: StadiumBorder(),
                                        primary: Color(0xff00B8AC)),
                                    child: Text(
                                      "Change",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Signout"),
                                  ElevatedButton(
                                    onPressed: () {
                                      Authenticate().sigout();
                                      LoginController().setLogin(false);

                                      BottomNavigation.selectedIndex = 1;
                                      Get.off(() => Authenticate(),
                                          binding: HomePageBindings());
                                      DBService().removeUid();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        shape: StadiumBorder(),
                                        primary: Colors.red),
                                    child: Text(
                                      "Signout",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            divider(),
                            FirebaseAuth.instance.currentUser!.email ==
                                    Constant.ADMINMAIL
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Add User"),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.to(AddUser(),
                                                    binding: LoginBinding(),
                                                    fullscreenDialog: true);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.0,
                                                      vertical: 10.0),
                                                  shape: StadiumBorder(),
                                                  primary: Colors.orange
                                                  // primary: Color(0xffFFBA44)
                                                  ),
                                              child: Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      divider()
                                    ],
                                  )
                                : Container(),
                            FirebaseAuth.instance.currentUser!.email!
                                    .contains(Constant.ADMINMAIL)
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("View Users"),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.to(AdminHome(),
                                                    binding: LoginBinding(),
                                                    fullscreenDialog: true);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 28.0,
                                                      vertical: 10.0),
                                                  shape: StadiumBorder(),
                                                  primary: epccBlue),
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      divider()
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 25,
                ),
              );
            }
          }),
    );
  }

  divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Divider(
        color: Colors.black,
      ),
    );
  }

  _showDialog(BuildContext context) {
    final _key = GlobalKey<FormState>();
    final TextEditingController _oldController = TextEditingController();
    final TextEditingController _newController = TextEditingController();

    final TextEditingController _confirmController = TextEditingController();
    return Get.defaultDialog(
        title: "",
        onConfirm: () async {
          final _state = _key.currentState;
          if (_state!.validate() &&
              _newController.text.contains(_confirmController.text)) {
            _state.save();
            Get.back();
            await FirebaseAuth.instance.currentUser!
                .updatePassword(_newController.text)
                .then((value) {
              LoginController().setLogin(false);
              BottomNavigation.selectedIndex = 1;
              Get.off(() => Authenticate(), binding: HomePageBindings());
              DBService().removeUid();
              Get.rawSnackbar(
                  duration: Duration(seconds: 2),
                  message: "Password Changed successfully");
            });
          }
        },
        textConfirm: "Confirm",
        confirmTextColor: white,
        cancelTextColor: Colors.black,
        barrierDismissible: true,
        buttonColor: epccBlue500,
        radius: 10,
        textCancel: "Cancel",
        content: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.center,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _oldController,
                  decoration:
                      const InputDecoration(labelText: 'Current Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '***';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _newController,
                  decoration: const InputDecoration(labelText: 'New Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '***';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _confirmController,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '***';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
