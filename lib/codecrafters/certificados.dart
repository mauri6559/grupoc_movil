import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_theme.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CertificadosWidget extends StatefulWidget {
  const CertificadosWidget({super.key});

  @override
  State<CertificadosWidget> createState() => _CertificadosWidgetState();
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

class _CertificadosWidgetState extends State<CertificadosWidget> {

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
                                'assets/imgenesis/certificados.jpeg',
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
                            'CERTIFICADOS',
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
                                  'assets/imgenesis/cer01.jpeg',
                                  'Certificado De Estudiante Regular',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada)..
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución).
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones.'''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer02.jpeg',
                                  'Certificado De Culminación De Plan De Estudios',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).. 
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución).. 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer03.jpeg',
                                  'Certificado De Vencimiento De Plan De Estudios',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada)... 
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución).. 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer04.jpeg',
                                  'Certificado De Puntaje',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer05.jpeg',
                                  'Certificado De Carga Horaria (horas Reloj Y Académica)',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer06.jpeg',
                                  'Nomina De Docentes',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer07.jpeg',
                                  'Historial Académico',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer08.jpeg',
                                  'Plan De Estudios En Hora Reloj',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer09.jpeg',
                                  'Certificado De Promedio',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Indicar a donde o a quien debe ir dirigido dicho certificado (Empresa, Institución). 
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer10.jpeg',
                                  'Orden De Mérito O Ranking',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer11.jpeg',
                                  'Certificado De Internado Rotatorio (urbano Y Rural)',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (2 ejemplares) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Una fotocopia de C.I. (Estudiante Nacional), Pasaporte y Visa Estudiantil Vigente (Estudiantes Extranjeros).
                                     ⨀ Fotocopia del Memorandum o Resolución Administrativa (área urbana, provincia).
                                     ⨀ Fotocopia del certificado del Diploma de conclusión (área rural, ciudad).
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones.
                                     ⨀ Presentar los documentos solicitados en ventanilla de trámites. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer12.jpeg',
                                  'Informe Técnico Del 5.s.s.r.o.',
                                  '''Todos los trámites son de manera personal. (Duración del trámite 72Hrs.)
                                     ⨀ Solicitar el Formulario de Certificado, otorgado por ventanilla de trámites o presentar una carta (1 ejemplar) de solicitud al VICERRECTOR de la Universidad (M. Sc. Ing. Franklin Nestor Rada).
                                     ⨀ Una fotocopia de C.I. (Estudiante Nacional), Pasaporte y Visa Estudiantil Vigente (Estudiantes Extranjeros).
                                     ⨀ Fotocopia del Memorandum, área urbana (provincia).
                                     ⨀ Estado Económico, solicitado en Plataforma de Informaciones. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer13.jpeg',
                                  'Certificados De Calificaciones Y Programas Analíticos',
                                  '''La entrega del trámite de Certificados y Programas Analíticos es personal, y se debe adjuntar una copia de la carta y la factura original, según su número de trámite respectivo. La entrega de los certificados y programas analíticos es personal o con poder notariado. Duración del trámite: 10 días hábiles a partir del pago.
                                     ⨀ Presentar una carta dirigida al Ing. MSc. Franklin Nestor Rada, Vicerrector de la Universidad Privada del Valle.
                                     ⨀ Llenado de una encuesta entregada por trámites de la Universidad Privada del Valle.
                                     ⨀ Presentar una carta dirigida al Ing. MSc. Franklin Nestor Rada, Vicerrector de la Universidad Privada del Valle.
                                     ⨀ Recoger un formulario de solvencia interna para su llenado y sellado correspondiente en las diferentes secciones de la universidad.
                                     ⨀ Presentar en la ventanilla de trámites.
                                     ⨀ A la entrega de la documentación se adjuntará una comunicación interna mediante la cual se realizará la cancelación correspondiente de los Certificados de Calificaciones en caja.
                                     ⨀ El costo por.
                                     ⨀ Adjuntar una fotocopia de la factura. '''
                              ),
                              buildServiceCard(
                                  context,
                                  'assets/imgenesis/cer14.jpeg',
                                  'Certificados De Calificaciones',
                                  '''La entrega del trámite de Certificados y Programas Analíticos es personal, y se debe adjuntar una copia de la carta y la factura original, según su número de trámite respectivo. La entrega de los certificados y programas analíticos es personal o con poder notariado. Duración del trámite: 10 días hábiles a partir del pago.
                                     ⨀ Presentar una carta dirigida al Ing. MSc. Franklin Nestor Rada, Vicerrector de la Universidad Privada del Valle.
                                     ⨀ Recoger un formulario de solvencia interna para su llenado y sellado correspondiente en las diferentes secciones de la universidad.
                                     ⨀ Presentar en la ventanilla de trámites.
                                     ⨀ A la entrega de la documentación se adjuntará una comunicación interna mediante la cual se realizará la cancelación correspondiente de los Certificados de Calificaciones en caja.
                                     ⨀ El costo por.
                                     ⨀ Adjuntar una fotocopia de la factura. '''
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
