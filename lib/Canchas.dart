import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/dashboard_page.dart';
import 'package:sistema_de_informacion/qr_page.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_icon_button.dart';
import 'src/flutter_flow/flutter_flow_theme.dart';

class CanchasWidget extends StatefulWidget {

  @override
  _CanchasWidgetState createState() => _CanchasWidgetState();
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
                height: MediaQuery.sizeOf(context).height * 0.05,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).rojouni,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).rojo2,
                      borderRadius: 20,
                      borderWidth: 1,
                      buttonSize: 40,
                      fillColor: FlutterFlowTheme.of(context).rosa,
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: FlutterFlowTheme.of(context).blanco,
                        size: 24,
                      ),
                      onPressed: () async {
                        //context.pushNamed('HomePage');
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).rojouni,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'Canchas Univalle',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).blanco,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 3, 15, 3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/usuario.png',
                          width: MediaQuery.sizeOf(context).width * 0.1,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.90,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.251,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: double.infinity,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).rojo2,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.20, -0.10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/pelota1.png',
                                  width: 218,
                                  height: 216,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.84, -0.01),
                              child: Text(
                                'Te damos la bienvenida a \nnuestras canchas',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                  fontFamily: 'Outfit',
                                  color:
                                  FlutterFlowTheme.of(context).blanco,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).salmon,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'INFORMACION',
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
                            color: FlutterFlowTheme.of(context).rosa,
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
                                      color:
                                      FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 15, 15, 15),
                                    child: Text(
                                      'Para poder reservar una de las canchas tienes que ser alumno de la univalle y portar tu credencial',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .info,
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
                          color: FlutterFlowTheme.of(context).blanco,
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
                          color: FlutterFlowTheme.of(context).salmon,
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
                                      'PISO NRO 4 TORRE A',
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 10, 10, 80),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).blanco,
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
                                      'CONTACTOS',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF090000),
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                          child: Container(
                                            width: 183,
                                            height: 187,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .rojo2,
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 16, 16, 6),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                      child: Image.asset(
                                                        'assets/images/usuario.png',
                                                        width: double.infinity,
                                                        height:
                                                        MediaQuery.sizeOf(
                                                            context)
                                                            .height *
                                                            0.104,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 5, 8, 8),
                                                  child: Text(
                                                    'Encargado B\n78541254',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .titleLarge
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .blanco,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                          child: Container(
                                            width: 183,
                                            height: 187,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .rojo2,
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 16, 16, 6),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                      child: Image.asset(
                                                        'assets/images/usuario.png',
                                                        width: double.infinity,
                                                        height:
                                                        MediaQuery.sizeOf(
                                                            context)
                                                            .height *
                                                            0.104,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 5, 8, 8),
                                                  child: Text(
                                                    'Encargado C\n78541254',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .titleLarge
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .blanco,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 10, 10, 10),
                                          child: Container(
                                            width: 183,
                                            height: 187,
                                            decoration: BoxDecoration(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .rojo2,
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16, 16, 16, 6),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          20),
                                                      child: Image.asset(
                                                        'assets/images/usuario.png',
                                                        width: double.infinity,
                                                        height:
                                                        MediaQuery.sizeOf(
                                                            context)
                                                            .height *
                                                            0.104,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 5, 8, 8),
                                                  child: Text(
                                                    'Encargado A\n78541254',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .titleLarge
                                                        .override(
                                                      fontFamily: 'Outfit',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .blanco,
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
                              ],
                            ),
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