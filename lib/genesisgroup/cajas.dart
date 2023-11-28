import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_theme.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class cajasWidget extends StatefulWidget {
  const cajasWidget({super.key});

  @override
  State<cajasWidget> createState() => _cajasWidgetState();
}
//todo es para la parte de correo
final emailController = TextEditingController();
final messageController = TextEditingController();

bool esCorreoValido(String correo) {
  final regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return regExp.hasMatch(correo);
}

Future sendEmail() async{
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_cebjusa";
  const templateId = "template_o2kvhsd";
  const userId = "DkM-oXCqIYVAkEg3E";
  const to_email = "soriamarvel8@gmail.com";

  // Validar dirección de correo electrónico
  if (!esCorreoValido(emailController.text)) {
    // Manejar el caso de un correo electrónico no válido según tus necesidades
    print('Correo electrónico no válido');
    return;
  }

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
  // Verifica que el correo se haya enviado correctamente
  if (response.statusCode == 200) {
    // Borra los campos después de enviar el correo
    emailController.clear();
    messageController.clear();
  }
  return print(response.statusCode);
}
//todo es para la parte de correo

class _cajasWidgetState extends State<cajasWidget> {


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
    // Bloquea la rotación horizontal del video
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

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
                          color: Color(0xFFB22A2A),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/imamarvel/bancafotor.jpg',
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
                          'SERVICIOS',
                          style: TextStyle(
                            color: Colors.black, // Cambia el color a azul (puedes usar cualquier otro color)
                            fontSize: 24, // Tamaño de la fuente
                            fontWeight: FontWeight.normal, // Puedes ajustar el peso de la fuente
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
                              'assets/imamarvel/colegiatura.png',
                              'Colegiatura',
                              '\n● Datos del estudiante.'
                                  '\n\n● Estudiante Nuevo (Llevar el formulario de inscripción).'
                                  '\n\n● Indica la mensualidad o el semestre que desea cancelar.',
                            ),
                            buildServiceCard(
                              context,
                              'assets/imamarvel/tramites.jpg',
                              'Trámites',
                              '\n● Datos del estudiante.'
                                  '\n\n● Formulario de solvencia emitido por el área de trámites.'
                                  '\n\n● Indica la mensualidad o el semestre que desea cancelar.',
                            ),
                            buildServiceCard(
                              context,
                              'assets/imamarvel/deudas.jpg',
                              'Deudas',
                              '● Datos del estudiante.',
                            ),
                            buildServiceCard(
                              context,
                              'assets/imamarvel/cheques.jpg',
                              'Cheques',
                              '\n● Carnet de identidad - indispensable.'
                                  '\n\n● En caso de terceros se requiere una carta autorizada.',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //horarios
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
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
                                'HORARIOS DE ATENCION',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
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
                //VIDEO reproductor
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.35,
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
                                'UBICANOS',
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
                          YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: 'XGy3rzGqds0', // Solo el ID del video
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressColors: ProgressBarColors(
                              playedColor: Colors.amber, // Color de la barra de progreso reproducido
                              handleColor: Colors.amberAccent, // Color del manipulador de progreso
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(

                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 0),
                              child: Text(

                                'Piso 1 - Torre Innovacion',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .blanco,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //contactanos
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).rojo2,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //TODO contactanos parte
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
                            child: Form(
                              child: Column(
                                children: [
                                  Text(
                                    'ENVIANOS TU DUDA!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.italic
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.only(bottom: 15)),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.email, color: Colors.white), // Color del icono
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      labelStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white), // Color de la línea inferior
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white), // Color de la línea inferior cuando está enfocado
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      icon: const Icon(Icons.message, color: Colors.white), // Color del icono
                                      hintText: 'Message',
                                      labelText: 'Message',
                                      labelStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white), // Color de la línea inferior
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white), // Color de la línea inferior cuando está enfocado
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      sendEmail();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber, // Color del fondo del botón
                                    ),
                                    child: Text(
                                      "Enviar",
                                      style: TextStyle(fontSize: 20, color: Colors.white),
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 45, 45, 54),
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                serviceName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
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
              height: MediaQuery.of(context).size.height, // Ajusta la altura para que ocupe toda la pantalla
              padding: EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 7.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        serviceDetails,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      // Puedes agregar más contenido si es necesario
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






