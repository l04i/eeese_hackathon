import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class ProfilePictureScreen extends StatefulWidget {
  const ProfilePictureScreen({super.key});

  @override
  State<ProfilePictureScreen> createState() => _ProfilePictureScreenState();
}

class _ProfilePictureScreenState extends State<ProfilePictureScreen> {
  File? _image;

  String? _pathName;

  final imagePicker = ImagePicker();
  Future<void> _selectImage(ImageSource imageSource) async {
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _pathName = basename(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Dimensions.height20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image == null
                ? Center(
                    child: CircleAvatar(
                      radius: Dimensions.radius30 * 3.5,
                      backgroundImage: const NetworkImage(
                          'https://www.maxpixel.net/static/photo/1x/Insta-Instagram-Instagram-Icon-User-3814081.png'),
                    ),
                  )
                : Center(
                    child: CircleAvatar(
                      radius: Dimensions.radius30 * 3.5,
                      backgroundImage: FileImage(_image as File),
                    ),
                  ),
            SizedBox(
              height: Dimensions.height120,
            ),
            InkWell(
              onTap: () async {
                await _selectImage(ImageSource.gallery);
              },
              child: Text(
                'Upload a picture',
                style: MyTextStyle().bigText(Colors.deepOrangeAccent),
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: Text(
                      'Or',
                      style: MyTextStyle().mediumText(Colors.grey),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            InkWell(
              onTap: () async {
                await _selectImage(ImageSource.camera);
              },
              child: Text(
                'Take a new picture',
                style: MyTextStyle().bigText(Colors.grey),
              ),
            ),
            const Spacer(),
            AppButton(
                onTap: () {}, color: Colors.deepOrangeAccent, text: 'Skip')
          ],
        ),
      )),
    );
  }
}
