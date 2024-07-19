import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whats_app/Model/CountryModel.dart';
import 'package:whats_app/NewScreens/CountryPage.dart';
import 'package:whats_app/NewScreens/OtpScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryName = "VietNam";
  String countryCode = "+84";
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0,
        title: const Text(
          "Enter your phone number",
          style: TextStyle(
            color: Colors.teal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            wordSpacing: 1,
          ), // Textstyle
        ), // Text
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "WhatsApp will send an sms message to verify your number",
              style: TextStyle(fontSize: 13.5),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "What's my number?",
              style: TextStyle(fontSize: 12.8, color: Colors.cyan[800]),
            ),
            const SizedBox(
              height: 15,
            ),
            countryCard(),
            const SizedBox(
              height: 5,
            ),
            number(),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (_controller.text.length < 10) {
                  showMydilogue1();
                } else {
                  showMydilogue();
                }
              },
              child: Container(
                color: Colors.tealAccent[400],
                height: 40,
                width: 70,
                child: const Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "+",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  countryCode.substring(1),
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.teal,
              width: 1.8,
            ))),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Phone number"),
            ),
          )
        ],
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryPage(
                setCountryData: setCountryData,
              ),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Text(
                countryName,
                style: const TextStyle(fontSize: 16),
              ),
            )),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMydilogue() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "We will be verifying your phone number",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("$countryCode ${_controller.text}",
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const Text("Is this Ok or would you like to edit the number?",
                    style: TextStyle(fontSize: 13.5))
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Edit")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          countryCode: countryCode,
                          number: _controller.text,
                        ),
                      ));
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  Future<void> showMydilogue1() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "There is no number you entered",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }
}
