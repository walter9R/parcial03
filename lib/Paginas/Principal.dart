import 'dart:convert';

//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:parcial03/Paginas/Detalle.dart';
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

  Widget datos(){
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      children: [
        sliderDatos(),
        Positioned(
          top: 115,
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
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                left: 8,
                                child: Text(
                                  "Titulo: " + peliculas[index]['title'] + "\n" 
                                  "Genero: " + peliculas[index]['genre'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Colors.black
                                  ),
                                )
                              ),
                              //Positioned(
                                //top: 5,
                                //right: 13,
                                //child: CachedNetworkImage(
                                  //imageUrl: peliculas[index]['thumbnail'],
                                  //height:
                                  //    (isPortrait) ? 80 : MediaQuery.of(context).size.width * 0.22,
                                  //fit: BoxFit.cover,
                                //),
                              //),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        
                      },
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(255, 227, 235, 238),
                            ),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
