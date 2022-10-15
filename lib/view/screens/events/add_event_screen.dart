import 'dart:io';
import 'package:eeese_hackathon/utils/colors.dart';
import 'package:eeese_hackathon/utils/dimensions.dart';
import 'package:eeese_hackathon/utils/style.dart';
import 'package:eeese_hackathon/view/widgets/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _maxAttdController = TextEditingController();
  final List<String> deps = [
    'Electrical',
    'Mechanical',
    'Civil',
    'Chemical',
    'Survey',
    'Agricultral',
    'Petroleum',
    'Mining'
  ];

  final List<String> categories = ["academic", "sports", "socail"];
  File? _image;
  String? _pathName;

  void _selectImage(ImageSource imageSource) async {
    var pickedImage = await imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _pathName = basename(pickedImage.path);
      });
    }
  }

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () async {
          if (_image == null) {
            showSnackBar(title: 'Error', message: 'Please upload an image');
          } else {
//here goes the uploading
          }
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10, vertical: Dimensions.height10),
            child: Column(
              children: [
                Text(
                  'Add Event details in form below',
                  style: MyTextStyle().mediumText(Colors.black).copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                    controller: _nameController,
                    decoration: MyInputTheme.mytheme('Name')),
                SizedBox(
                  height: Dimensions.height20,
                ),

                TextField(
                    controller: _descriptionController,
                    decoration: MyInputTheme.mytheme('Descrption')),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                    controller: _locationController,
                    decoration: MyInputTheme.mytheme('Location')),
                SizedBox(
                  height: Dimensions.height20,
                ),
                TextField(
                    controller: _maxAttdController,
                    decoration: MyInputTheme.mytheme('Max Attendance')),
                SizedBox(
                  height: Dimensions.height20,
                ),

                DropdownButtonFormField(
                  decoration: MyInputTheme.mytheme('Category'),
                  items: deps
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: ((value) {}),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),

                DropdownButtonFormField(
                  decoration: MyInputTheme.mytheme('Department'),
                  items: deps
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: ((value) {}),
                ),
                // Add Photo Section
                Text(
                  'Add a photo',
                  style: MyTextStyle().mediumText(Colors.black).copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                _image != null
                    ? Container(
                        height: Dimensions.height200,
                        width: Dimensions.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image as File),
                                fit: BoxFit.cover),
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Dimensions.radius20))),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  width: Dimensions.width150 * 1.5,
                  height: Dimensions.height50,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => _selectImage(ImageSource.gallery),
                          icon: const Icon(
                            Icons.photo_album,
                            color: AppColors.greyColor,
                          )),
                      Container(
                        height: Dimensions.height50,
                        width: 1,
                        color: AppColors.greyColor,
                      ),
                      IconButton(
                          onPressed: () => _selectImage(ImageSource.camera),
                          icon: const Icon(
                            Icons.camera_alt,
                            color: AppColors.greyColor,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
