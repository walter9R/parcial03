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
      backgroundColor: Color.fromARGB(223, 255, 255, 255),
      appBar: appBar(),
      body: datos(),
    );
  }

  Widget datos(){
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Stack(
      children: [
        Positioned(
          top: 10,
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              widget.gamedetalle.length != null?
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 0.75
                  ), 
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(61, 41, 103, 211),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                child: CachedNetworkImage(
                                  imageUrl: widget.gamedetalle['thumbnail'],
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.width /1.7,
                                left: 8,
                                child: Text(
                                  "Titulo: " + widget.gamedetalle['title'] + "\n" +"\n" 
                                  "Genero: " + widget.gamedetalle['genre'] + "\n" +"\n"
                                  "Plataforma: " + widget.gamedetalle['platform'] + "\n" +"\n"
                                  "Publicador: " + widget.gamedetalle['publisher'] + "\n" +"\n"
                                  "Desarrolladora: " + widget.gamedetalle['developer'] + "\n" +"\n"
                                  "Lanzamiento: " +widget.gamedetalle['release_date'] + "\n" +"\n"
                                  , 
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black
                                  ),
                                )
                              ),
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

  appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/img.png"),
                  fit: BoxFit.cover
                )
              ),
            ),
            const Text(
              "Parcial 03 ETPS3",
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

  
}
