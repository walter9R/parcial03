import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:parcial03/json/Data.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(Datos.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: (){
                  //
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 227, 235, 238),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width) - (MediaQuery.of(context).size.width)/15,
                          height: 100,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "Alumno: " + Datos[index]['name'] + " " + Datos[index]['lastname'] + 
                                "\n" "Carnet: " + Datos[index]['number']
                                , 
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}