import 'package:flutter/material.dart';

class GmailMessageList extends StatelessWidget {
  const GmailMessageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            "https://media.istockphoto.com/id/1132758418/photo/close-up-portrait-of-her-she-nice-attractive-puzzled-ignorant-wavy-haired-girl-showing.jpg?s=612x612&w=0&k=20&c=3G3eEg2RHg6AmVDbZCIzVo3n-1kFnE-61sgH3qDdyIo="),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Indeed",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "10.00am",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            "Confirm your interest in quick message....\nstill interested in flutter developer?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.star)
        ],
      ),
    );
  }
}
