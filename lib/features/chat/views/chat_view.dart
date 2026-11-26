// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:scholar_chat/features/auth/views/login_view.dart';
import 'package:scholar_chat/features/chat/class/puble_class.dart';
import 'package:scholar_chat/features/chat/model/model_message.dart';
import 'package:scholar_chat/features/chat/widget/chat_puble.dart';
import 'package:scholar_chat/shared/custom_text.dart';
import 'package:scholar_chat/shared/custom_text_field.dart';
import 'package:scholar_chat/static/static.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({Key? key, this.email}) : super(key: key);
  final String? email;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollectionMessages);
  TextEditingController chatController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(255, 16, 32, 45),
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
        appBar: AppBar(
          actionsPadding:const EdgeInsets.only(right: 10),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                primaryImage,
                height: 60,
              ),
              const Gap(5),
              const CustomText(
                textFont: "Chat App",
                textSize: 20,
                fontFamily: primaryFontFamly,
              )
            ],
          ),
          actions: [
            InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 30,
                ))
          ],
          backgroundColor: primaryColor,
          toolbarHeight: 55,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: messages.orderBy(kTime, descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ModelMessage> readMessage = [];
              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                readMessage.add(ModelMessage.fromjson(snapshot.data!.docs[i]));
              }
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(children: [
                  Positioned.fill(
                    child: Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(bottom: 69),
                      child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: readMessage.length,
                        itemBuilder: (context, index) {
                          return readMessage[index].id == email
                              ? ChatPuble(
                                  color: primaryColor,
                                  modelMessage: readMessage[index],
                                  alignment: Alignment.topLeft,
                                  radiusPuble: RadiusPuble(
                                      topLeft: 40,
                                      topRight: 40,
                                      bottomRight: 40),
                                  marginPuble: MarginPuble(
                                    marginHorizontal: 10,
                                    marginVertical: 15,
                                  ),
                                  paddingPuble: PaddingPuble(
                                    paddingBottom: 15,
                                    paddingTop: 15,
                                    paddingLeft: 20,
                                    paddingRight: 20,
                                  ),
                                  textPuble: TextPuble(
                                    textFont: "${readMessage[index]}",
                                    textSize: 20,
                                  ),
                                )
                              : ChatPuble(
                                  color: Colors.blue,
                                  modelMessage: readMessage[index],
                                  alignment: Alignment.topRight,
                                  radiusPuble: RadiusPuble(
                                    topLeft: 40,
                                    topRight: 40,
                                    bottomLeft: 40,
                                  ),
                                  marginPuble: MarginPuble(
                                    marginHorizontal: 10,
                                    marginVertical: 15,
                                  ),
                                  paddingPuble: PaddingPuble(
                                    paddingBottom: 15,
                                    paddingTop: 15,
                                    paddingLeft: 20,
                                    paddingRight: 20,
                                  ),
                                  textPuble: TextPuble(
                                    textFont: "${readMessage[index]}",
                                    textSize: 20,
                                  ));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.translate(
                            offset: const Offset(-3, 6.5),
                            child: IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: primaryColor,
                                ),
                                color: Colors.white,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                )),
                          ),
                          const Gap(4),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(116, 0, 0, 0),
                                        blurRadius: 50,
                                        offset: Offset(1, 3))
                                  ],
                                  borderRadius: BorderRadius.circular(999),
                                  color: Colors.white),
                              child: CustomTextField(
                                controller: chatController,
                                onSubmitted: (value) {
                                  messages
                                      .add({
                                        kMessage: value,
                                        kTime: DateTime.now(),
                                        kid: email,
                                      })
                                      .then((value) => print("User Added"))
                                      .catchError((error) =>
                                          print("Failed to add user: $error"));
                                  chatController.clear();
                                  scrollController.animateTo(
                                      scrollController.position.minScrollExtent,
                                      curve: Curves.slowMiddle,
                                      duration:
                                          const Duration(milliseconds: 500));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              );
            } else {
              return const Center(
                child: CustomText(
                  textFont: "Loading.....",
                  textSize: 20,
                  textColor: primaryColor,
                ),
              );
            }
          },
        ));
  }
}
