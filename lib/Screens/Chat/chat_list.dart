import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import 'Model/lms_model.dart';
import 'Util/data_provider.dart';
import 'chat_inbox.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // ignore: non_constant_identifier_names
  List<LMSModel> list_data = maanGetChatList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kTitleColor),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Chat',
            style: kTextStyle.copyWith(color: kTitleColor),
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext bc) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_to_photos,
                        color: kGreyTextColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Add Contact',
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  value: "/Products",
                ),
              ],
              onSelected: (value) {
                Navigator.pushNamed(context, '$value');
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppTextField(
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(
                    border: outlineInputBorder(),
                    fillColor: const Color(0xFFF7F5F2),
                    contentPadding: const EdgeInsets.only(left: 10.0),
                    hintText: 'Search',
                    suffixIcon: const Icon(
                      Icons.search,
                      color: kTitleColor,
                    ),
                  ),
                ),
              ),
              Column(
                children: list_data.map(
                  (data) {
                    return SettingItemWidget(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      title: data.title.validate(),
                      subTitle: data.subTitle.validate(),
                      leading: Image.network(data.image.validate(),
                              height: 50, width: 50, fit: BoxFit.cover)
                          .cornerRadiusWithClipRRect(25),
                      trailing: Column(
                        children: [
                          Text('10.00 AM', style: secondaryTextStyle()),
                        ],
                      ),
                      onTap: () {
                        ChatInbox(
                                img: data.image.validate(),
                                name: data.title.validate())
                            .launch(context);
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
