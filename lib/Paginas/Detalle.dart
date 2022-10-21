import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetalleP03 extends StatefulWidget {
  final gamedetalle;
  final Color color;
  final int idgame;

  const DetalleP03(
      {super.key,
      required this.gamedetalle,
      required this.color,
      required this.idgame});

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
          padding: const EdgeInsets.only(left: 0, right: 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Parcial 03 ETPS - Detalle ",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              minWidth: 30.0,
              height: 40.0,
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.grey,
              child: const Icon(
                FeatherIcons.logOut,
                color: Colors.white,
              ),
            ),
          ])),
    );
  }

  body() {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 80,
          left: 120,
          child: Text(
            widget.gamedetalle['title'],
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: ancho,
            height: alto * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Nombre: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['title'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Genero: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['genre'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Plataforma: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['platform'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Publicador: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['publisher'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Desarrollador: ",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['developer'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  "Fecha lanzamiento:",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )),
                            Container(
                                width: ancho * 0.3,
                                child: Text(
                                  widget.gamedetalle['release_date'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          top: (alto * 0.18) - 10,
          child: CachedNetworkImage(
              imageUrl: widget.gamedetalle['thumbnail'],
              height: 170,
              fit: BoxFit.fitHeight),
        )
      ],
    );
  }
}
