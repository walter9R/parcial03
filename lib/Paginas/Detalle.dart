import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class DetalleP03 extends StatefulWidget {
  const DetalleP03({super.key});

  @override
  State<DetalleP03> createState() => _DetalleP03State();
}

class _DetalleP03State extends State<DetalleP03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: body(),
    );
  }

  appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Parcial 03 ETPS-",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              minWidth: 30.0,
              height: 40.0,
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.amber,
              child: const Icon(
                FeatherIcons.logOut,
                color: Colors.white,
              ),
            ),
          ])),
    );
  }

  
  body(){
    return SingleChildScrollView(
      child: Column(
        children: [

        ],
      ),
    );
  }
}