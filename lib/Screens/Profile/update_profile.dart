import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_app/Screens/Home%20Screen/home.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

import 'package:event_app/GlobalComponents/button_global.dart';
import 'package:event_app/Services/api_manager.dart';
import 'package:event_app/constant.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailNameController,
    required this.mobileNameController,
    required this.token,
    required this.apiManager,
    required this.imageUrl,
  }) : super(key: key);

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailNameController;
  final TextEditingController mobileNameController;
  final String token;
  final ApiManager apiManager;
  final String imageUrl;

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  late String image;
  String strAttachmentImageName = 'Attachment';
  File? attachmentFile;
  String attachmentBytedata = "";

  @override
  void initState() {
    super.initState();
    image = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                // shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Update Profile',
                      style: kTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                  ),
                  const Divider(
                    color: kBgColor,
                    thickness: 1.0,
                  ),
                  ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: 90.0,
                      height: 90.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: ButtonGlobal(
                        buttontext: 'Select Image',
                        buttonDecoration:
                            kButtonDecoration.copyWith(color: kGreyTextColor),
                        onPressed: () async {
                          final _image = await imageFromGallery();
                          log(_image);
                          if (image != 'null') {
                            setState(() {
                              image = _image;
                            });
                            Fluttertoast.showToast(
                              msg: 'User Image Updated',
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'User Image Not Updated',
                            );
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: widget.firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: kTextStyle,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor),
                      ),
                      hintText: 'Enter your first name',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE8E7E5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: widget.lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: kTextStyle,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor),
                      ),
                      hintText: 'Enter your last name',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE8E7E5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTextField(
                    // enabled: false,
                    textFieldType: TextFieldType.EMAIL,
                    controller: widget.emailNameController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: kTextStyle,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor),
                      ),
                      hintText: 'Enter your email address',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE8E7E5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppTextField(
                    enabled: false,
                    textFieldType: TextFieldType.NAME,
                    controller: widget.mobileNameController,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      labelStyle: kTextStyle,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kMainColor),
                      ),
                      hintText: 'Enter your mobile number',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE8E7E5),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ButtonGlobal(
                      buttontext: 'Update',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () async {
                        try {
                          if (widget.mobileNameController.text.length == 10) {
                            EasyLoading.show(
                              status: 'Updating Profile',
                            );
                            final profile =
                                await widget.apiManager.updateProfile(
                              widget.token,
                              widget.firstNameController.text,
                              widget.lastNameController.text,
                              widget.mobileNameController.text,
                              widget.emailNameController.text,
                            );
                            if (profile.success == true) {
                              EasyLoading.showSuccess(
                                  profile.message.toString());
                              const Home().launch(context);
                            } else {
                              EasyLoading.showError(profile.message.toString());
                            }
                          } else {
                            EasyLoading.showError(
                              'Mobile number should be 10 digits',
                            );
                          }
                        } catch (e) {
                          EasyLoading.showError(e.toString());
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> imageFromGallery() async {
    try {
      PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxHeight: 200,
        maxWidth: 200,
      );
      if (pickedFile != null) {
        setState(() {
          attachmentFile = File(pickedFile.path);
          strAttachmentImageName = pickedFile.path.split('/').last;
          final bytes = File(pickedFile.path).readAsBytesSync();
          attachmentBytedata = base64Encode(bytes);
        });
        return await updateUserImage(pickedFile);
      } else {
        return 'null';
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
      return 'null';
    }
  }

  Future<String> updateUserImage(PickedFile pickedFile) async {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        pickedFile.path,
        filename: strAttachmentImageName,
      ),
    });
    try {
      log('token:' + widget.token);
      Dio dio = Dio();
      Response response = await dio.post(
        ApiManager.apiUrl + "profile/image",
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.token}',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('response: ' + response.data.toString());
      if (response.data['message'] == 'Image has been updated') {
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString(
        //   'userImage',
        //   image,
        // );
        return response.data['value'];
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong! Try after sometime.",
        );
        return 'null';
      }
    } on DioError catch (e) {
      log(e.message.toString());
      // Navigator.pop(context);
      Fluttertoast.showToast(msg: e.message ?? "");
      return 'null';
    }
  }
}
