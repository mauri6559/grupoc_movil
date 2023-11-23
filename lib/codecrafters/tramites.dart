import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/codecrafters/cambio.dart';
import 'package:sistema_de_informacion/codecrafters/certificados.dart';
import 'package:sistema_de_informacion/codecrafters/convalidacion.dart';
import 'package:sistema_de_informacion/codecrafters/extension.dart';
import 'package:sistema_de_informacion/codecrafters/legalizaciones.dart';
import 'package:sistema_de_informacion/codecrafters/titulo.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_theme.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class tramitesWidget extends StatefulWidget {
  const tramitesWidget({super.key});

  @override
  State<tramitesWidget> createState() => _tramitesWidgetState();
}

class _tramitesWidgetState extends State<tramitesWidget> {

  var height, width;
  List imgData = [
    "assets/imgenesis/traico01.png",
    "assets/imgenesis/traico02.png",
    "assets/imgenesis/traico03.png",
    "assets/imgenesis/traico04.png",
    "assets/imgenesis/traico05.png",
    "assets/imgenesis/traico06.png",
  ];

  List titles = [
    "Certificados",
    "Legalizaciones",
    "Extensión de documentos de defensa pública",
    "Título en provisión nacional",
    "Cambio de Apellido y Nacionalidad",
    "Convalidación de materias y traspasos",
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
                            MaterialPageRoute(builder: (context) => CertificadosWidget()),
                          );
                        }else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LegalizacionesWidget()),
                          );
                        }else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExtensionWidget()),
                          );
                        }else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TituloWidget()),
                          );
                        }else if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CambioWidget()),
                          );
                        }else if (index == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConvalidacionWidget()),
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
