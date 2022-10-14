import 'dart:ui';
import 'package:flutter/material.dart';

class AppLifecycleOverlay extends StatefulWidget {
  const AppLifecycleOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AppLifecycleOverlay> createState() => _AppLifecycleOverlayState();
}

class _AppLifecycleOverlayState extends State<AppLifecycleOverlay>
    with WidgetsBindingObserver {
  bool shouldBlur = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      shouldBlur = state == AppLifecycleState.inactive ||
          state == AppLifecycleState.paused;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shouldBlur) {
      return Stack(
        children: [
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Center(
                child: Container(
                  // padding: const EdgeInsets.all(0.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      scale: 0.5,
                      fit: BoxFit.fill,
                      image: AssetImage("images/logo.png"),
                    ),
                  ),
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
          )
        ],
      );
    }

    return widget.child;
  }
}