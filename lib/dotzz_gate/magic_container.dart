import 'package:flutter/material.dart';
import 'package:sugarcube_security/dotzz_gate/dotzz_gate_main.dart';

class MagicContainer extends StatelessWidget {
  final Widget child;
  final Widget gate;
  const MagicContainer({Key? key, required this.child, required this.gate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DotzzGateHomePage(child: gate)),
        );
      },
      child: child,
    );
  }
}
