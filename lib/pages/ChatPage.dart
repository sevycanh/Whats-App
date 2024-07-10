import 'package:flutter/material.dart';
import 'package:whats_app/CustomUI/CustomCard.dart';
import 'package:whats_app/Model/ChatModel.dart';
import 'package:whats_app/screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  

  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  const ChatPage({super.key, required this.chatmodels, required this.sourchat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const SelectContact()));
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatmodels[index],
          sourchat: widget.sourchat,
        ),
      ),
    );
  }
}
