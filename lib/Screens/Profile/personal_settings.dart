import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../Screens/Authentication/signin.dart';
import '../../Screens/Home%20Screen/home.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';

class PersonalSettings extends StatefulWidget {
  const PersonalSettings(
      {Key? key,
      required this.mobile,
      required this.lastName,
      required this.firstName,
      required this.email})
      : super(key: key);
  final String firstName, lastName, mobile, email;

  @override
  _PersonalSettingsState createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
  final ApiManager _apiManager = ApiManager();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String token = '';
  String strAttachmentImageName = 'Attachment';
  File? attachmentFile;
  String attachmentBytedata = "";
  String strUserImage = "https://cdn-icons-png.flaticon.com/512/149/149071.png";

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;

    setState(() {
      token = preferences.getString('token')!;
      strUserImage = preferences.getString('userImage') ??
          "https://cdn-icons-png.flaticon.com/512/149/149071.png";
    });
  }

  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    mobileController.text = widget.mobile;
    emailController.text = widget.email;
    getToken();
    super.initState();
  }

  void showUpdate() {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        ),
        builder: (BuildContext contextModel) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              height: 450,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
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
                        strUserImage,
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
                            ImageFromGallery();
                          }),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      textFieldType: TextFieldType.NAME,
                      controller: firstNameController,
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
                      controller: lastNameController,
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
                      textFieldType: TextFieldType.EMAIL,
                      controller: emailController,
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
                      textFieldType: TextFieldType.NAME,
                      controller: mobileController,
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
                            EasyLoading.show(status: 'Updating Profile');
                            final profile = await _apiManager.updateProfile(
                              token,
                              firstNameController.text,
                              lastNameController.text,
                              mobileController.text,
                              emailController.text,
                            );
                            if (profile.success == true) {
                              EasyLoading.showSuccess(
                                  profile.message.toString());
                              const Home().launch(context);
                            } else {
                              EasyLoading.showError(profile.message.toString());
                            }
                          } catch (e) {
                            EasyLoading.showError(e.toString());
                          }
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Personal Settings',
          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => showUpdate(),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: context.width(),
              height: 60.0,
              child: Row(
                children: [
                  Text(
                    'Personal Details',
                    style: kTextStyle,
                  ),
                  const Spacer(),
                  Text(
                    widget.firstName + ' ' + widget.lastName,
                    style: kTextStyle.copyWith(color: kGreyTextColor),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kGreyTextColor,
                  ),
                ],
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () => showUpdate(),
          //   child: Container(
          //     padding: const EdgeInsets.all(20.0),
          //     width: context.width(),
          //     height: 60.0,
          //     child: Row(
          //       children: [
          //         Text(
          //           'Change Mobile',
          //           style: kTextStyle,
          //         ),
          //         const Spacer(),
          //         Text(
          //           widget.mobile,
          //           style: kTextStyle.copyWith(color: kGreyTextColor),
          //         ),
          //         const Icon(
          //           Icons.arrow_forward_ios,
          //           color: kGreyTextColor,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () => showUpdate(),
          //   child: Container(
          //     padding: const EdgeInsets.all(20.0),
          //     width: context.width(),
          //     height: 60.0,
          //     child: Row(
          //       children: [
          //         Text(
          //           'Email',
          //           style: kTextStyle,
          //         ),
          //         const Spacer(),
          //         Text(
          //           widget.email,
          //           style: kTextStyle.copyWith(color: kGreyTextColor),
          //         ),
          //         const Icon(
          //           Icons.arrow_forward_ios,
          //           color: kGreyTextColor,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          GestureDetector(
            onTap: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                builder: (BuildContext contextModel) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 400.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Change Password',
                                style: kTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                            const Divider(
                              color: kBgColor,
                              thickness: 1.0,
                            ),
                            AppTextField(
                              textFieldType: TextFieldType.PASSWORD,
                              controller: currentPasswordController,
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                labelStyle: kTextStyle,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                ),
                                hintText: 'Enter your current password',
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
                              textFieldType: TextFieldType.PASSWORD,
                              controller: newPasswordController,
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                labelStyle: kTextStyle,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                ),
                                hintText: 'Enter your new password',
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
                              textFieldType: TextFieldType.PASSWORD,
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                labelStyle: kTextStyle,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: kMainColor),
                                ),
                                hintText: 'Confirm your new password',
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE8E7E5),
                                  ),
                                ),
                              ),
                            ),
                            ButtonGlobal(
                                buttontext: 'Update',
                                buttonDecoration: kButtonDecoration.copyWith(
                                    color: kMainColor),
                                onPressed: () async {
                                  if (currentPasswordController.text.isEmpty) {
                                    toast('Please enter your current password');
                                  } else if (newPasswordController
                                      .text.isEmpty) {
                                    toast('Please enter your new password');
                                  } else if (confirmPasswordController
                                      .text.isEmpty) {
                                    toast('Please confirm your new password');
                                  } else if (newPasswordController.text !=
                                      confirmPasswordController.text) {
                                    toast(
                                        'Your new password doesn\'t match with confirm password');
                                  } else {
                                    try {
                                      EasyLoading.show(
                                          status: 'Changing password');
                                      final status =
                                          await _apiManager.changePassword(
                                              currentPasswordController.text,
                                              newPasswordController.text,
                                              confirmPasswordController.text,
                                              token);
                                      if (status.success == true) {
                                        EasyLoading.showSuccess(
                                            status.message.toString());
                                        const SignIn()
                                            .launch(context, isNewTask: true);
                                      } else {
                                        status.error == ''
                                            ? toast(status.message.toString())
                                            : toast(status.error.toString());
                                      }
                                    } catch (e) {
                                      toast(e.toString());
                                    }
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              width: context.width(),
              height: 60.0,
              child: Row(
                children: [
                  Text(
                    'Change Password',
                    style: kTextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kGreyTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ImageFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    if (pickedFile != null) {
      setState(() {
        attachmentFile = File(pickedFile.path);
        print(attachmentFile.toString());
        strAttachmentImageName = pickedFile.path.split('/').last;
        final bytes = File(pickedFile.path).readAsBytesSync();
        attachmentBytedata = base64Encode(bytes);
        print(strAttachmentImageName);
        print(attachmentBytedata);
        updateUserImage(pickedFile);
      });
    }
  }

  Future<void> updateUserImage(PickedFile pickedFile) async {
    FormData formData = new FormData.fromMap({
      'image': await MultipartFile.fromFile(pickedFile.path,
          filename: strAttachmentImageName),
    });
    try {
      Dio dio = Dio();
      Response response = await dio.post(ApiManager.apiUrl + "profile/image",
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ' + ' ' + token,
          }));

      if (response.data['message'] == 'Image has been updated') {
        Fluttertoast.showToast(msg: 'User Image Updated');
        // Navigator.pop(context); //pop dialog
        strUserImage = response.data['value'];
        final SharedPreferences prefs = await _prefs;
        prefs.setString(
          'userImage',
          strUserImage,
        );
        setState(() {});
      } else {
        //Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Something went wrong! Try after sometime.",
        );
      }
    } on DioError catch (e) {
      // Navigator.pop(context);
      Fluttertoast.showToast(msg: e.message);
    }
  }
}
