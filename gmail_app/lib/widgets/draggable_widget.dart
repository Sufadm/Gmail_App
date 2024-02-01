import 'package:flutter/material.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text("Not In use :"),
        Draggable(
          feedback: Icon(
            Icons.star,
            color: Colors.amber,
          ),
          data: "Not In use star",
          child: Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
        Draggable(
          feedback: Icon(
            Icons.star,
            color: Colors.orange,
          ),
          data: "Not In use star",
          child: Icon(
            Icons.star,
            color: Colors.orange,
          ),
        ),
        Draggable(
          feedback: Icon(
            Icons.star,
            color: Colors.orange,
          ),
          data: "Not In use star",
          child: Icon(
            Icons.star,
            color: Colors.orange,
          ),
        ),
        Draggable(
          feedback: Icon(
            Icons.star,
            color: Colors.orange,
          ),
          data: "Not In use star",
          child: Icon(
            Icons.star,
            color: Color.fromARGB(255, 61, 2, 76),
          ),
        ),
        Draggable(
          feedback: Icon(
            Icons.star,
            color: Colors.lightBlue,
          ),
          data: "Not In use star",
          child: Icon(
            Icons.star,
            color: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}
