import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_app/Screens/Profile/update_profile.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart' hide log;

import '../../GlobalComponents/button_global.dart';
import '../../Screens/Authentication/signin.dart';
import '../../Screens/Home%20Screen/home.dart';
import '../../Services/api_manager.dart';
import '../../constant.dart';

class PersonalSettings extends StatefulWidget {
  const PersonalSettings({
    Key? key,
    required this.mobile,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.imageUrl,
    required this.userName,
  }) : super(key: key);
  final String firstName, lastName, mobile, email, imageUrl, userName;

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
  late String strUserImage;

  Future<void> getToken() async {
    SharedPreferences preferences = await _prefs;

    setState(
      () {
        token = preferences.getString('token')!;
        // strUserImage = preferences.getString('userImage') ??
        //     "https://cdn-icons-png.flaticon.com/512/149/149071.png";
      },
    );
  }

  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    mobileController.text = widget.mobile;
    emailController.text = widget.email;
    strUserImage = widget.imageUrl;
    getToken();
    super.initState();
  }

  void showUpdate() async {
    SharedPreferences preferences = await _prefs;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext contextModel) {
        return UpdateProfileWidget(
          emailNameController: emailController,
          firstNameController: firstNameController,
          lastNameController: lastNameController,
          mobileNameController: mobileController,
          imageUrl: strUserImage,
          token: preferences.getString('token') ?? '',
          apiManager: _apiManager,
        );
      },
    );
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
          if (widget.userName.isNotEmpty)
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
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
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
                                    if (currentPasswordController
                                        .text.isEmpty) {
                                      toast(
                                          'Please enter your current password');
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
                                              ? EasyLoading.showError(
                                                  status.message.toString(),
                                                )
                                              : EasyLoading.showError(
                                                  status.error.toString(),
                                                );
                                        }
                                      } catch (e) {
                                        EasyLoading.showError(e.toString());
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
}
