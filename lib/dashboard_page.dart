import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/Canchas.dart';
import 'package:sistema_de_informacion/Dental.dart';
import 'package:sistema_de_informacion/Fotocopiadora.dart';
import 'package:sistema_de_informacion/Naf.dart';
import 'package:sistema_de_informacion/Plataforma.dart';
import 'package:sistema_de_informacion/genesisgroup/cajas.dart';
import 'package:sistema_de_informacion/genesisgroup/psicologia.dart';
import 'package:sistema_de_informacion/genesisgroup/medico.dart';

class Dashboard extends StatelessWidget {
  var height, width;

  List imgData = [
    "assets/images/mcqs.png",
    "assets/images/quiz.png",
    "assets/images/pastpapers.png",
    "assets/images/pdf.png",
    "assets/images/job.png",
    "assets/images/about.png",
    //grupo marcelo

    //grupo marvel
    "assets/imgenesis/medicine.png",
    "assets/imgenesis/pago.png",
    "assets/imgenesis/psychology.png",

  ];

  List titles = [
    "NAF",
    "Plataforma de atencion",
    "Canchas",
    "Fotocopiadora",
    "Consultorio dental",
    "Opcion 5",
    //grupo marcelo

    //grupo marvel
    "Gabinete Medico",
    "Cajas",
    "Area Psicologia",

  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
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
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/info.png",
                              )
                            )
                          ),

                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top:20,
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
                      }else if (index == 6) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => medicoWidget()),
                        );
                      }else if (index == 7) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cajasWidget()),
                        );
                      }else if (index == 8) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => psicoloWidget()),
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