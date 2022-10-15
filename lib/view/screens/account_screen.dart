import 'package:eeese_hackathon/controllers/auth_controller.dart';
import 'package:eeese_hackathon/utils/constants.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic>? userData = {};
  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    var snap =
        await firestore.collection("users").doc(auth.currentUser!.uid).get();
    setState(() {
      userData = snap.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userData!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage('${userData!['profilePic']}'),
                    radius: Dimensions.radius36 * 3,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  AccountContainer(
                      icon: Icons.person,
                      color: Colors.deepOrange,
                      text: '${userData!['username']}'),
                  AccountContainer(
                      icon: Icons.email,
                      color: Colors.deepOrangeAccent,
                      text: '${userData!['email']}'),
                  AccountContainer(
                      icon: Icons.vpn_key,
                      color: Colors.deepOrangeAccent,
                      text: "${userData!['uniNumber']}"),
                  Container(
                    height: Dimensions.height45,
                    width: Dimensions.height200,
                    padding: EdgeInsets.all(Dimensions.height10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.white,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await Get.find<AuthController>().signOut();
                        Get.offNamed("/login");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout_sharp,
                            color: Colors.deepOrangeAccent,
                          ),
                          SizedBox(
                            width: Dimensions.height10,
                          ),
                          Text(
                            "Sign out",
                            style: TextStyle(fontSize: Dimensions.font20),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}

class AccountContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const AccountContainer({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: Dimensions.height15,
          left: Dimensions.height15,
          right: Dimensions.height15),
      padding: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.width20,
          bottom: Dimensions.height10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(
            width: Dimensions.width20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: Dimensions.font20),
          ),
        ],
      ),
    );
  }
}
