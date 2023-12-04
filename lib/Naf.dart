import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/Home.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_icon_button.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_widgets.dart';
import 'src/flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NafWidget extends StatefulWidget {

  @override
  _NafWidgetState createState() => _NafWidgetState();
}
//final nameController = TextEditingController();
//final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

void showToastMessage(String message) => Fluttertoast.showToast(msg: message);
bool esCorreoValido(String correo) {
  final regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return regExp.hasMatch(correo);
}


Future sendEmail() async{
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_cebjusa";
  const templateId = "template_o2kvhsd";
  const userId = "DkM-oXCqIYVAkEg3E";
  const to_email = "mauriciogarciam9@gmail.com";

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



YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'sk_T8BYNEI4',
  flags: YoutubePlayerFlags(
    autoPlay: true,
    mute: true,
  ),
);

class _NafWidgetState extends State<NafWidget> {
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
        resizeToAvoidBottomInset: false,
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
        backgroundColor: FlutterFlowTheme
            .of(context)
            .rojouni,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                Container(
                  width: double.infinity,
                  height: MediaQuery
                      .sizeOf(context)
                      .height * 0.77,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme
                        .of(context)
                        .secondaryBackground,
                  ),
                  child: SingleChildScrollView(
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
                                      'assets/images/nafbanner.png',
                                      width: double.maxFinite,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),//banner
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery
                                .sizeOf(context)
                                .height * 0.2,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'INFORMACIÓN',
                                      style: FlutterFlowTheme
                                          .of(context)
                                          .headlineLarge,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: Text(
                                        'NAF: Atención a impuestos: asesoramiento, declaración y resolución de problemas fiscales.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium,
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
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery
                                .sizeOf(context)
                                .height * 0.2,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      'REQUISITOS',
                                      style: FlutterFlowTheme
                                          .of(context)
                                          .headlineLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        color:Colors.black,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: Text(
                                        'Documentación financiera completa.\nInformación de seguridad social o identificación fiscal.\nRegistros de transacciones y deducciones válidas.',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
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
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 245, 245, 245),
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
                                          'assets/images/tax.jpg',
                                          'Contribuyente',
                                          '''
Brindar ayuda con las dudas contables y fiscales del contribuyente

Requisitos:
⨀ NIT.                           
⨀ Usuario.
⨀ Contraseña
⨀ CI
'''
                                      ),
                                      buildServiceCard(
                                          context,
                                          'assets/images/reiva.jpg',
                                          'RE-IVA',
                                          '''
Recibe ayuda con tus impuestos y la devolucion del mismo

Requisitos:
⨀ CI
⨀ N° de CUenta bancaria
⨀ Correo electrónico
⨀ Codigo de beneficiario
⨀ Usuario
⨀ Contraseña
'''
                                      ),
                                      buildServiceCard(
                                          context,
                                          'assets/images/formu.jpg',
                                          'Formulario 110',
                                          '''
Recibe ayuda con el llenado del formulario 110

Requisitos:
⨀ CI
⨀ Codigo de dependiente
⨀ Usuario
⨀ Contraseña
'''
                                      ),
                                      buildServiceCard(
                                          context,
                                          'assets/images/emifacturas.jpg',
                                          'Facturas',
                                          '''
Recibe ayuda con la emision de facturas fisicas o electronicas

Requisitos:
⨀ N° de autorización
⨀ Acceso
⨀ NIT
⨀ Usuario
⨀ Contraseña
⨀ Datos de cliente
⨀ Servicio o producto
'''
                                      ),buildServiceCard(
                                          context,
                                          'assets/images/facilidadpago.jpg',
                                          'Pagos',
                                          '''
Mantente al tanto de las facilidades de pago que existen

⨀ Requisitos:
⨀ Acceso
⨀ NIT
⨀ Usuario
⨀ Contraseña
'''
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                              height: MediaQuery
                                  .sizeOf(context)
                                  .height * 0.3,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme
                                    .of(context)
                                    .rojo2,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image
                                      .asset(
                                    'assets/images/FONDOG.jpg',
                                  )
                                      .image,
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
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .headlineLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .blanco,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 10),
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
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                'Lunes a viernes',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .titleLarge
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                '7:00 AM',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                '5:00 PM',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                'Sabado',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .titleLarge
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                '8:00 AM',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                '1:00 AM',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .of(
                                                    context)
                                                    .bodyMedium
                                                    .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme
                                                      .of(
                                                      context)
                                                      .blanco,
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
                              height: MediaQuery
                                  .sizeOf(context)
                                  .height * 0.38,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme
                                    .of(context)
                                    .rojo2,
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
                                        'UBICACIÓN',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .headlineLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .blanco,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: YoutubePlayer(
                                      controller: YoutubePlayerController(
                                        initialVideoId: 'l6P2Tv2rZ7k',
                                        flags: YoutubePlayerFlags(
                                          autoPlay: false,
                                          mute: false,

                                        ),

                                      ),

                                      showVideoProgressIndicator: true,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 0),
                                      child: Text(
                                        'PISO NRO 5 TORRE B',
                                        style: FlutterFlowTheme
                                            .of(context)
                                            .headlineLarge
                                            .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme
                                              .of(context)
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
                          child: Form(
                            child: Column(
                              children: [
                                Text(
                                  'Contáctanos',
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
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: FlutterFlowTheme.of(context).rojo2,
                                  ),
                                  child: Text(
                                    "Enviar",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),

                        ),

                        //sdfsss
                      ],
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
}

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Ajusta la altura para que ocupe toda la pantalla
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
      ),
    );
  }
}