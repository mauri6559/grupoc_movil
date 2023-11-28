import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_theme.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class postgradoWidget extends StatefulWidget {
  const postgradoWidget({super.key});

  @override
  State<postgradoWidget> createState() => _postgradoWidgetState();
}

final emailController = TextEditingController();
final messageController = TextEditingController();

Future sendEmail() async{
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_cebjusa";
  const templateId = "template_o2kvhsd";
  const userId = "DkM-oXCqIYVAkEg3E";
  const to_email = "mauriciogarciam9@gmail.com";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params":{
          //"name": nameController.text,
          //"subject": subjectController.text,
          "to_email": to_email,
          "message": messageController.text,
          "user_email": emailController.text,
        }
      })
  );
  return print(response.statusCode);
}

class _postgradoWidgetState extends State<postgradoWidget> {


  List pages = [
    Dashboard(),
    qrPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {


    return GestureDetector(

        child: Scaffold(

          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 45, 45, 54),
            iconTheme: IconThemeData(color: Color(0xFFFEFEFE)),
            automaticallyImplyLeading: true,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.asset(
                    'assets/imgenesis/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.13,
            elevation: 115,
          ),

          bottomNavigationBar: BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: onTap,
            currentIndex: currentIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem( icon: Icon(Icons.apps), label: "Home"),
              BottomNavigationBarItem( icon: Icon(Icons.qr_code), label: "Bar"),
            ],
          ),


          key: scaffoldKey,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFFFFFFF),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/imgenesis/postgrado.jpg',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),



                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [



                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'POSTGRADOS',
                            style: TextStyle(
                              color: Color.fromARGB(255, 161, 0, 71), // Cambia el color a azul (puedes usar cualquier otro color)
                              fontSize: 24, // Tamaño de la fuente
                              fontWeight: FontWeight.bold, // Puedes ajustar el peso de la fuente
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/post01.jpeg',
                                  'Postgrado Doctorado',
                                  '''El grado de Doctor (Ph.D) se confiere al doctorando que ha obtenido un grado de Magister en la respectiva disciplina y que ha aprobado un programa de correspondiente, acreditando que quien lo posee, tiene competencias necesarias para efectuar investigaciones originales. El Programa de Doctorado contempla necesariamente la elaboración presentación sustentación, defensa y aprobación de una tesis doctoral, consistente en una investigación original desarrollada en forma autónoma y que signifique una contribución a la disciplina de que se trate.
                                     ⨀ Requisitos:
                                       a) Solicitud de admisión al programa.
                                       b) 2 copias legalizadas de Diploma Académico de Maestría.
                                       c) 2 copias legalizadas del Título en Provisión Nacional de Licenciatura.
                                       d) Contrato de estudios.
                                       e) 2 Cartas de recomendación.
                                       f) Currículo vitae.
                                       g) 2 fotocopias del carnet de identidad.
                                       h) 2 Cartas de recomendación.
                                       i) 1 Certificado de nacimiento original.
                                       j) 4 Fotografías 4x4 fondo plomo..'''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/post02.jpeg',
                                  'Postgrado Maestría',
                                  '''Los Programas de Maestría brindan conocimientos, destrezas y habilidades en diferentes campos y disciplinas científicos. Tiene como sustento el entrenamiento sistemático y riguroso en métodos, técnicas y procedimientos de investigación, los mismos que permiten al maestrante organizar el proceso de construcción de conocimientos en diferentes áreas y disciplinas de la ciencia y la tecnología.
                                     ⨀ Requisitos:
                                       a) Currículum Vitae no documentado.
                                       b) Solicitud de admisión al programa.
                                       c) 2 copias legalizadas de Titulo en Provisión Nacional.
                                       d) 2 copias legalizadas de diploma académico.
                                       e) 2 copias de Cédula de identidad
                                       f) 2 certificados de nacimiento original.
                                       g) 4 fotos 4x4 fondo plomo.
                                       h) Contrato de estudio y Formulario de Inscripción.
                                       i) Carta de aceptación al programa. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/post03.jpeg',
                                  'Postgrado Diplomado',
                                  '''El Diplomado es un programa de postgrado de carácter sistemático que tiene como propósito profundizar y actualizar conocimientos, habilidades y destrezas que requiere el ejercicio profesional en un área o en una disciplina específica.
                                     ⨀ Requisitos:
                                       a) Título en Provisión Nacional.
                                       b) Fotocopia Diploma Académico.
                                       c) Carnet de Identidad.
                                       d) Certificado de Nacimiento actualizado.
                                       e) Currículum Vitae sin documentar.
                                       f) 4 fotos 4x4 fondo plomo (físico). '''
                              ),
                            ],
                          ),
                        )
                      ],
                    ),



                  ),










                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).rojo2,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/FONDOG.jpg',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  'HORARIOS',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .blanco,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 1,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          'Lunes a viernes',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '8:00 AM  -',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '18:00 PM',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          'Sabado',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '8:00 AM  -',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0.00, 0.00),
                                        child: Text(
                                          '12:00 PM',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context).blanco,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).rojo2,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  'UBICACION',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .blanco,
                                  ),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                'assets/images/maps.png',
                                width: 342,
                                height: MediaQuery.sizeOf(context).height *
                                    0.176,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: Text(
                                  'PISO NRO. 5 TORRE B',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .blanco,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
                    child: Form(
                      child: Column(
                        children: [
                          Text(
                            'Contactanos',
                            style: TextStyle(fontSize: 25),
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 15)),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.email),
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            controller: messageController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.message),
                              hintText: 'Message',
                              labelText: 'Message',
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              sendEmail();
                            },
                            child: Text(
                              "Enviar",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );


  }
}



//aca creo todos los cards para poder personalizarlo de manera individual
Widget buildServiceCard(BuildContext context, String imageUrl, String serviceName, String serviceDetails) {
  return Align(
    alignment: AlignmentDirectional(0.00, 0.00),
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(
                imageUrl: imageUrl,
                serviceName: serviceName,
                serviceDetails: serviceDetails,
              ),
            ),
          );
        },
        child: Container(
          width: 183,
          height: 187,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).rojo2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.157,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 5, 8, 8),
                child: Text(
                  serviceName,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).blanco,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


//crea una pantalla nueva para mostrar informacion mas a detalle de los cards personalizados
class ServiceDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String serviceName;
  final String serviceDetails;

  ServiceDetailsScreen({
    required this.imageUrl,
    required this.serviceName,
    required this.serviceDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 54),
        iconTheme: IconThemeData(color: Color(0xFFFEFEFE)),
        automaticallyImplyLeading: true,
        actions: [],
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/imgenesis/banner.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        elevation: 115,
      ),
      backgroundColor: Color.fromARGB(255, 161, 0, 71),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 161, 0, 71),
              Color.fromARGB(255, 45, 45, 54),
            ],
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              serviceName,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              serviceDetails,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            // Agrega más contenido de detalles si es necesario
          ],
        ),
      ),
    );
  }
}
