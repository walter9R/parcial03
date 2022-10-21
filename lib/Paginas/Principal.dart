import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial03/json/Data.dart';

class PrincipalP03 extends StatefulWidget {
  const PrincipalP03({super.key});

  @override
  State<PrincipalP03> createState() => _PrincipalP03State();
}

class _PrincipalP03State extends State<PrincipalP03> {
  var PeliAPI = "https://www.freetogame.com/api/games";
  List peliculas = [];
  @override
  Widget build(BuildContext context) {
    //print(peliculas);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: datos(),
    );
  }

  appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Parcial 03 ETPS-",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ])),
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          sliderDatos(),
          datos()
        ],
      ),
    );
  }

  Widget datos(){
    return Stack(
      children: [
        sliderDatos(),
        Positioned(
          top: 100,
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              peliculas.length != null?
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.4
                  ), 
                  itemCount: peliculas.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                left: 20,
                                child: Text(
                                  peliculas[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.blueGrey
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ):
              Center(
                child: CircularProgressIndicator(),
              )
            ]
          ),
        )
      ],
    );
  }

  Widget sliderDatos() {
    return Container(
      //height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: List.generate(Datos.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Container(
                    //height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: Color.fromARGB(255, 227, 235, 238),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Container(
                            color: Color.fromARGB(255, 227, 235, 238),
                            width: (MediaQuery.of(context).size.width) -
                                (MediaQuery.of(context).size.width) / 15,
                            height: 100,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "Alumno: " +
                                      Datos[index]['name'] +
                                      " " +
                                      Datos[index]['lastname'] +
                                      "\n" "Carnet: " +
                                      Datos[index]['number'],
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Peliculas();
    }
  }

  void Peliculas() {
    var url = Uri.https("www.freetogame.com", "/api/games");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodeJsonData = jsonDecode(value.body);
        peliculas = decodeJsonData;
        setState(() {});
      }
    });
  }
}
