
import 'package:flutter/material.dart';
import 'package:whats_app/CustomUI/ButtonCard.dart';
import 'package:whats_app/Model/ChatModel.dart';
import 'package:whats_app/screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
      name: "Decade Xu Dua",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Sevycanh",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),

    ChatModel(
      name: "Canh Mai",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),

    ChatModel(
      name: "Ngoc Canh",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),

    // ChatModel(
    //   name: "NodeJs Group",
    //   isGroup: true,
    //   currentMessage: "New NodejS Post",
    //   time: "2:00",
    //   icon: "group.svg",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatModels.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  sourceChat = chatModels.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => HomeScreen(
                                chatModels: chatModels,
                                sourChat: sourceChat,
                              )));
                },
                child: ButtonCard(
                  name: chatModels[index].name,
                  icon: Icons.person,
                ),
              )),
    );
  }
}
