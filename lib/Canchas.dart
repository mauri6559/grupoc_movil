import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_icon_button.dart';
import 'src/flutter_flow/flutter_flow_theme.dart';
import 'src/flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class CanchasWidget extends StatefulWidget {

  @override
  _CanchasWidgetState createState() => _CanchasWidgetState();
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

class _CanchasWidgetState extends State<CanchasWidget> {
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
        backgroundColor: FlutterFlowTheme.of(context).rojouni,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [

              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.77,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                    'assets/images/canchasbannerfoto.png',
                                    width: double.maxFinite,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 15, 15, 15),
                                    child: Text(
                                      'Aqui podras encontrar toda la informacion que necesites acerca de las canchas desde los deportes que puedes jugar, horarios y mucho mas.',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
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
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                                    style: FlutterFlowTheme.of(context)
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
                                      'Para hacer la reservación de la cancha deberas presentar una carta con los nombres de las personas que ocuparan la cancha, el horario en el que se ocupará la cancha y que deporte se jugará',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
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
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'DEPORTES',
                                style:
                                FlutterFlowTheme.of(context).headlineLarge,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Container(
                                        width: 183,
                                        height: 187,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .rojo2,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            //context.pushNamed('HomePage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 6, 6, 6),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    child: Image.asset(
                                                      'assets/images/futsal.jpg',
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                          context)
                                                          .height *
                                                          0.157,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 5, 8, 8),
                                                child: Text(
                                                  'Futsal',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .titleLarge
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .blanco,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Container(
                                        width: 183,
                                        height: 187,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .rojo2,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            //context.pushNamed('HomePage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 6, 6, 6),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    child: Image.asset(
                                                      'assets/images/volley.png',
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                          context)
                                                          .height *
                                                          0.157,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 5, 8, 8),
                                                child: Text(
                                                  'Volley',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .titleLarge
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .blanco,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 10, 10),
                                      child: Container(
                                        width: 183,
                                        height: 187,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .rojo2,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            //context.pushNamed('HomePage');
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(6, 6, 6, 6),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20),
                                                    child: Image.asset(
                                                      'assets/images/basket.jpg',
                                                      width: double.infinity,
                                                      height: MediaQuery.sizeOf(
                                                          context)
                                                          .height *
                                                          0.157,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 5, 8, 8),
                                                child: Text(
                                                  'Futsal',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .titleLarge
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .blanco,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Outfit',
                                                color: FlutterFlowTheme.of(
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .titleLarge
                                                  .override(
                                                fontFamily: 'Outfit',
                                                color: FlutterFlowTheme.of(
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(
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
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(
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
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'GALERIA',
                                style:
                                FlutterFlowTheme.of(context).headlineLarge,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 180,
                              child: CarouselSlider(
                                items: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/cancha1.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/cancha2.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/cancha3.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/cancha4.jpg',
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                                carouselController:
                                    CarouselController(),
                                options: CarouselOptions(
                                  initialPage: 1,
                                  viewportFraction: 0.5,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                ),
                              ),
                            ),
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
                            height: MediaQuery.sizeOf(context).height * 0.40,
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
                                      'UBICACIÓN',
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
                                  child: YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId: 'A0kbBB7doaI',
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
                                      'Avenida Tejada Sorzano, esquina calle Canada',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
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
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}