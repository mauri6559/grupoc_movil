import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_theme.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class psicoloWidget extends StatefulWidget {
  const psicoloWidget({super.key});

  @override
  State<psicoloWidget> createState() => _psicoloWidgetState();
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
    // Muestra un toast rojo indicando que la dirección de correo es inválida
    Fluttertoast.showToast(
        msg: "Correo electrónico no válido",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
    return;
  }
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "to_email": to_email,
          "message": messageController.text,
          "user_email": emailController.text,
        }
      }));

  // Verifica que el correo se haya enviado correctamente
  if (response.statusCode == 200) {
    // Borra los campos después de enviar el correo
    emailController.clear();
    messageController.clear();

    // Muestra un toast verde indicando que el correo se envió correctamente
    Fluttertoast.showToast(
        msg: "Correo enviado correctamente",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  } else {
    // Muestra un toast rojo indicando que hubo un problema al enviar el correo
    Fluttertoast.showToast(
        msg: "Error al enviar el correo",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  return print(response.statusCode);
}
//todo es para la parte de correo


class _psicoloWidgetState extends State<psicoloWidget> {
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
                    'assets/imamarvel/banner.png',
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
                  //banner
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
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
                                  'assets/imamarvel/psciofotor.jpg',
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
                  ),
                  //servicios
                  Container(
                    margin: EdgeInsets.only(bottom: 2),
                    child:Container (
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
                                  'assets/imamarvel/psiasesora.png',
                                  'Asesoramiento',
                                  '\n● Sesiones de apoyo emocional.'
                                      '\n\n● Evaluación de necesidades específicas de cada estudiante.'
                                      '\n\n● Diseño de estrategias personalizadas de intervención.',
                                ),
                                buildServiceCard(
                                  context,
                                  'assets/imamarvel/psiintergrup.png',
                                  'Intervención Grupal',
                                  '\n● Talleres de estrategias de aprendizaje.'
                                      '\n\n● Talleres de autorregulación emocional.'
                                      '\n\n● Talleres de resolución de conflictos.'
                                      '\n\n● Sesiones de trabajo en grupo para fomentar la comunicación y el apoyo entre estudiantes.',
                                ),
                                buildServiceCard(
                                  context,
                                  'assets/imamarvel/psievaluacion.jpg',
                                  'Evaluaciones',
                                  '\n● Pruebas estandarizadas para evaluar habilidades cognitivas.'
                                      '\n\n● Evaluación de habilidades socioemocionales.'
                                      '\n\n● Identificación de posibles dificultades de aprendizaje.',
                                ),
                                buildServiceCard(
                                  context,
                                  'assets/imamarvel/psivocacional.jpg',
                                  'Orientacion Vocacional',
                                  '\n● Entrevistas individuales para explorar intereses y aptitudes.'
                                      '\n\n● Pruebas de orientación vocacional.'
                                      '\n\n● Asesoramiento sobre opciones educativas y profesionales.',
                                ),
                                buildServiceCard(
                                  context,
                                  'assets/imamarvel/psitalleres.jpg',
                                  'Talleres',
                                  '\t\t● APRENDIZAJE'
                                      '\n⨀ Desarrollo de habilidades de estudio.'
                                      '\n\n⨀ Estrategias para mejorar la concentración. '
                                      '\n\n⨀ Métodos efectivos de toma de apuntes.'
                                      '\n\n\t\t● DESARROLLO PERSONAL '
                                      '\n⨀ Sesiones sobre autoconocimiento y autoestima.'
                                      '\n\n⨀ Desarrollo de habilidades sociales.'
                                      '\n\n⨀ Gestión del tiempo y establecimiento de metas.',
                                ),
                                buildServiceCard(
                                  context,
                                  'assets/imamarvel/psievaluaciones.jpg',
                                  'Evaluacion Psicologica',
                                  '\t\t● POSTULANTES A INTERCAMBIO'
                                      '\n⨀ Evaluación de adaptabilidad y habilidades sociales.'
                                      '\n\n⨀ Identificación de posibles desafíos emocionales durante el intercambio.'
                                      '\n\n⨀ Asesoramiento para una transición exitosa.'
                                      '\n\n\t\t● POSTULANTES A INTERNADO ROTATORIO '
                                      '\n⨀ Evaluación de habilidades de trabajo en equipo.'
                                      '\n\n⨀ Identificación de factores de estrés relacionados con el internado.'
                                      '\n\n⨀ Apoyo emocional durante la transición al entorno clínico.',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                  //horarios
                  Container(
                    margin: EdgeInsets.only(bottom: 23),
                    child: Align(
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
                    )
                  ),
                  //VIDEO reproductor ubicacion
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Align(
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.36,
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
                                  initialVideoId: '4ZwOjZHXXME', // Solo el ID del video
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

                                    'Sub Suelo 1 - Torre Innovacion',
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
                    )
                  ),
                  //contactanos
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.45,
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
                                        '¡ENVIANOS TU DUDA!',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(padding: const EdgeInsets.only(bottom: 15)),
                                      TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.email, color: Colors.white), // Color del icono
                                          hintText: 'Ingrese su Correo',
                                          labelText: 'Ingrese su Correo',
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
                                          hintText: 'Ingrese su mensaje',
                                          labelText: 'Ingrese su mensaje',
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
                                      ),
                                      SizedBox(height: 15), // Espacio entre el botón y el mensaje adicional
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Este mensaje sera enviado al encargado del gabinete psicologico.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                  //APARTADO DE DIFUSION
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.25,
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
                                    'ENCUENTRANOS \n\t\t\t\t\ttambien en:',
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
                              //TODO area de links a otras platafomas
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildLink('assets/imamarvel/logoradio.png', 'https://zeno.fm/radio/univalle-online-radio-hldi/'),
                                  _buildLink('assets/imamarvel/logotv.png', 'https://univalletelevision.com/'),
                                  _buildLink('assets/imamarvel/logoyoutube.png', 'https://www.youtube.com/@univallelapaz'),
                                  // Agrega más enlaces según sea necesario
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget _buildLink(String imagePath, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Column(
        children: [
          Container(
            width: 100.0, // Ajusta el ancho del icono según sea necesario
            height: 100.0, // Ajusta la altura del icono según sea necesario
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // Cambia al color que deseas
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Función para abrir la URL
  _launchURL(String url) {
    launch(url).then((_) {
      print("La URL se abrió correctamente");
    }).catchError((error) {
      print("Error al abrir la URL: $error");
    });
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
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    serviceName,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).blanco,
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
