import 'package:flutter/material.dart';


class TopOption extends StatefulWidget {
  final IconData icon;
  final String name;
  final Function action;
  const TopOption(
      {super.key,
      required this.icon,
      required this.name,
      required this.action});

  @override
  State<TopOption> createState() => _TopOptionState();
}

class _TopOptionState extends State<TopOption> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // hoverColor: Colors.blue,
      // hoverColor: Color.fromARGB(255, 166, 201, 255),
      onHover: (isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      onTap: () {
        widget.action();
      },
      // showModalSideSheet(
      //     context: context,
      //     ignoreAppBar: false,
      //     barrierDismissible: true,
      //     body: ListView.builder(
      //       itemCount: 5,
      //       itemBuilder: (context, index) {
      //         return ListTile(
      //           leading: Icon(Icons.face),
      //           title: Text("I am on $index index"),
      //           trailing: Icon(Icons.safety_divider),
      //         );
      //       },
      //     ));

      child: Column(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 30,
            color: _isHovered ? Colors.blue : Colors.white,
          ),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 15,
              color: _isHovered ? Colors.blueAccent : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
