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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: 150,
                          height: 150,
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
                        )),
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
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
                                  horizontal: 20, vertical: 10),
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
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Padding(
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
                                  horizontal: 70.0, vertical: 0.0),
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
                    ),
                    SizedBox(
                      height: 10,
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
}
