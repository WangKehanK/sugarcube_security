import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IconButton extends StatelessWidget {
  final Text label;
  final String? name;

  IconButton({required this.label, required this.name});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(Icons.ac_unit),
      label: label,
      onPressed: () async {
        try {
          print(label.toString());
          if (await FlutterDynamicIcon.supportsAlternateIcons) {
            await FlutterDynamicIcon.setAlternateIconName(name,
                showAlert: true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("App icon change successful"),
            ));
            return;
          }
        } on PlatformException {
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Failed to change app icon because of $e"),
          ));
        }
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to change app icon"),
        ));
      },
    );
  }
}

class DynamicIconChangeField extends StatefulWidget {
  const DynamicIconChangeField({
    Key? key,
  }) : super(key: key);

  @override
  State<DynamicIconChangeField> createState() => DynamicChangeIconState();
}

class DynamicChangeIconState extends State<DynamicIconChangeField> {
  // DynamicChangeIconState();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 100),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
              label: Text('Pikachu'),
              name: 'pikachu',
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              label: Text('Petcom'),
              name: 'petcom',
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              label: Text('Restore Icon'),
              name: null,
            ),
          ],
        ),
      )
    ]);
    //return widget.children
  }
}
