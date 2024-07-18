import 'package:flutter/material.dart';
import 'package:whats_app/CustomUI/StatusPage/HeadOwnStatus.dart';
import 'package:whats_app/CustomUI/StatusPage/OthersStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: const Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            const HeadOwnStatus(),
            label("Recent updates"),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: true,
              statusNum: 1,
            ),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: true,
              statusNum: 2,
            ),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: false,
              statusNum: 15,
            ),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: false,
              statusNum: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            label("View updates"),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: true,
              statusNum: 1,
            ),
            const OthersStatus(
              name: "Ngoc Canh",
              imageName: "assets/2.jpeg",
              time: "01:27",
              isSeen: true,
              statusNum: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
