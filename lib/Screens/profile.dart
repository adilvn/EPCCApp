import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Authentication/authentication.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
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

    setState(() {
      _image = image!;
      filename = (image != null ? basename(image.path) : null)!;
    });
  }

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    print(controller.uid);
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
                                    : Container(
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
                                          placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(
                                            radius: 25,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.person,
                                            size: 60,
                                            color: Colors.white,
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
                            Divider(),
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
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Profile Picture"),
                                  ElevatedButton(
                                    onPressed: () {
                                      pickImage().whenComplete(() {
                                        // _imageFile != null
                                        //     ? DBService().uploadImage(
                                        //         _imageFile, controller.uid)
                                        //     : null;
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
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
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
                            Divider(),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              Authenticate().sigout();
                              LoginController().setLogin(false);
                              BottomNavigation.selectedIndex = 1;
                              Get.off(() => Authenticate(),
                                  binding: HomePageBindings());
                              DBService().removeUid();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 70.0, vertical: 12.0),
                                shape: StadiumBorder(),
                                primary: epccBlue500),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
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
