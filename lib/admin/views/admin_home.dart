import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHome extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: epccBlue500,
        title: Text("Admin Home"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 8,
            child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      final _data = snapshot.data!.docs;

                      return ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                _data[index].data() as Map<String, dynamic>;

                            return Constant.ADMINMAIL !=
                                    _data[index]["full_name"]
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        child: ListTile(
                                          trailing: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              size: 26,
                                            ),
                                            onPressed: () async {
                                              _showDialog(
                                                  context, _data[index].id);
                                            },
                                          ),
                                          leading: Container(
                                            width: 40,
                                            height: 40,
                                            child: data.length == 3
                                                ? Container(
                                                    child: CachedNetworkImage(
                                                      imageUrl: data["image"],
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            image:
                                                                imageProvider,
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CupertinoActivityIndicator(
                                                        radius: 15,
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(
                                                        Icons.person,
                                                        size: 60,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        shape: BoxShape.circle),
                                                    child: Icon(
                                                      Icons.person,
                                                      color: Colors.white,
                                                    )),
                                          ),
                                          title:
                                              Text(_data[index]["full_name"]),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          });
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(
                          radius: 22,
                          animating: true,
                        ),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "Delete User",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: new Text("Are you sure to delete?"),
          actions: <Widget>[
            TextButton(
              child: new Text("Yes"),
              onPressed: () async {
                try {
                  Get.back();
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(id)
                      .delete()
                      .then((value) {
                    Get.rawSnackbar(
                        message: "User has been deleted successfully",
                        duration: Duration(seconds: 2));
                  }).onError((error, stackTrace) {
                    Get.rawSnackbar(
                        message: "Failed $error",
                        duration: Duration(seconds: 2));
                  });
                } on FirebaseException catch (e) {
                  print(e);
                }
              },
            ),
            TextButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
