import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/Canchas.dart';
import 'package:sistema_de_informacion/Dental.dart';
import 'package:sistema_de_informacion/Fotocopiadora.dart';
import 'package:sistema_de_informacion/Mau/Cafeteria.dart';
import 'package:sistema_de_informacion/Mau/Biblioteca.dart';
import 'package:sistema_de_informacion/Mau/DireccionCarrera.dart';
import 'package:sistema_de_informacion/Naf.dart';
import 'package:sistema_de_informacion/Plataforma.dart';
import 'package:sistema_de_informacion/codecrafters/postgrado.dart';
import 'package:sistema_de_informacion/codecrafters/tramites.dart';
import 'package:sistema_de_informacion/genesisgroup/cajas.dart';
import 'package:sistema_de_informacion/genesisgroup/psicologia.dart';
import 'package:sistema_de_informacion/genesisgroup/medico.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List imgData = [
    "assets/images/movilnaf.png",
    "assets/images/movilplataforma.png",
    "assets/images/movildeportes.png",
    "assets/images/movilfotoco.png",
    "assets/images/movilodonto.png",

    //grupo marvel
    "assets/images/movilgabinete.png",
    "assets/images/movilcajas.png",
    "assets/images/movilpsicologia.jpg",

    //grupo marcelo y mauri
    "assets/images/movilpostgrado.png",
    "assets/images/moviltramites.png",
    "assets/images/movilcafeteria.png",
    "assets/images/movilbiblioteca.png",
    "assets/MauImagenes/ddc.png",
  ];

  List titles = [
    "NAF",
    "Plataforma de atención",
    "Deportes",
    "Fotocopiadora",
    "Clínica Odontológica",
    //grupo marvel
    "Gabinete Medico",
    "Cajas",
    "Psicología",
    //grupo marcelo
    "Postgrado",
    "Trámites",
    "Cafeteria",
    "Biblioteca",
    "Dirección de carreras",



  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height-60;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 122, 0, 49),
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              ),
              height: height * 0.25,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top:35,
                      left: 20,
                      right: 20
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /*InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),*/
                        /*Container(
                          height: 50,
                          width: 50,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:Colors.white,
                            /*image: DecorationImage(
                              image: AssetImage(
                                "assets/images/info.png",
                              )
                            )*/
                          ),

                        )*/
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top:50,
                        left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Univalle",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Conoce los servicios de univalle",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              height: height * 0.75,
              width: width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 25,
                ),
                shrinkWrap: true,
                itemCount: imgData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NafWidget()),
                        );
                      }else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlataformaWidget()),
                        );
                      }else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CanchasWidget()),
                        );
                      }else if (index == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FotoWidget()),
                        );
                      }else if (index == 4) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DentalWidget()),
                        );
                      }else if (index == 5) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => medicoWidget()),
                        );
                      }else if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cajasWidget()),
                        );
                      }else if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => psicoloWidget()),
                        );
                      }else if (index == 8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => postgradoWidget()),
                        );
                      }else if (index == 9) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => tramitesWidget()),
                        );
                      }else if (index == 10) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CafeteriaWidget()),
                        );
                      }else if (index == 11) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BibliotecaWidget()),
                        );
                      }else if (index == 12) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DireccionCarreraWidget()),
                        );
                      }

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 6
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            imgData[index],
                            width: 100,
                          ),
                          Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}