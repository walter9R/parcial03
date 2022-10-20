import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PrincipalP03 extends StatefulWidget {
  const PrincipalP03({super.key});

  @override
  State<PrincipalP03> createState() => _PrincipalP03State();
}

class _PrincipalP03State extends State<PrincipalP03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: body(),
    );
  }

  appBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Parcial 03 ETPS-",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ])),

    );
  }

  body(){
    return SingleChildScrollView(
      child:  Column(
        children: [
          sliderDatos()
        ],
      ),
    );
  }

  Widget sliderDatos(){
    return Container();
  }
}