import 'package:sugarcube_security/dotzz_gate/magic_container.dart';

import './model/quotes.dart';
import './service/api.dart';
import 'package:flutter/material.dart';
import './constants/colors.dart';

class DotzzGateQuoteHomePage extends StatefulWidget {
  const DotzzGateQuoteHomePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<DotzzGateQuoteHomePage> createState() => _HomeState();
}

class _HomeState extends State<DotzzGateQuoteHomePage> {
  var size, height, width;

  Quotes? data;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        centerTitle: true,
        title: const Text("Dotzz Quote of Day"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh_outlined,
            ),
            iconSize: 30,
            onPressed: () {
              getQuotes();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getQuotes,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Pull to Refresh",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: width / 2,
              child: MagicContainer(
                  gate: widget.child,
                  child: Card(
                margin: const EdgeInsets.only(top: 20),
                color: tdBGColor ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data?.content ?? "Don't talk about what you have done or what you are going to do."}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 22),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            data?.author ?? "Thomas Jefferson",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getQuotes() async {
    data = await Api.getQuotes();
    setState(() {});
  }
}
