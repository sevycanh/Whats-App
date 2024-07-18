import 'package:flutter/material.dart';

class HeadOwnStatus extends StatelessWidget {
  const HeadOwnStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/avatar.jpg"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent[700],
                radius: 10,
                child: const Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      title: const Text(
        "My Status",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        "Tap tp add status update",
        style: TextStyle(fontSize: 13, color: Colors.grey[900]),
      ),
    );
  }
}
