import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DiologueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  VoidCallback ontap;

  DiologueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 170,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name new Signature",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 7,
            ),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Signature Name', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.clear();
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue)),
                    onPressed: ontap,
                    child: const Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(
        text,
      ),
    );
  }
}
