import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool forPassword;
  final String hintText;
  final String label;
  const MyTextInput(
      {super.key,
      required this.textEditingController,
      required this.forPassword,
      required this.hintText,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: textEditingController,
            obscureText: forPassword,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
