import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  final Icon icon;
  const AppBarIcons({
    Key key,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
    );
  }
}
