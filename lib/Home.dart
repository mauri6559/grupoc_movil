import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistema_de_informacion/Canchas.dart';
import 'package:sistema_de_informacion/Dental.dart';
import 'package:sistema_de_informacion/Fotocopiadora.dart';
import 'package:sistema_de_informacion/Naf.dart';
import 'package:sistema_de_informacion/Plataforma.dart';
import 'package:sistema_de_informacion/src/flutter_flow/flutter_flow_icon_button.dart';
import 'src/flutter_flow/flutter_flow_theme.dart';

class HomeWidget extends StatefulWidget {

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {


  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF440D20),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF440D20),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                        child: FlutterFlowIconButton(
                          borderRadius: 20,
                          borderWidth: 1,
                          buttonSize: 20,
                          fillColor: Color(0xFFF7EAEF),
                          icon: Icon(
                            Icons.menu_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20,
                          ),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF440D20),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'MENU',
                          style: FlutterFlowTheme.of(context)
                              .displayMedium
                              .override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).blanco,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF440D20),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/images/pepe.jpg',
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).blanco,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              'Bienvenido',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFF090000),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/UNI1.png',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              'Modulos',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PlataformaWidget()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).rojouni,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlataformaWidget()));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/UNI3.png',
                                        width: 118,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Container(
                                      width: 281,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .rojouni,
                                      ),
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8, 8, 8, 8),
                                          child: Text(
                                            'Plataforma de atencion',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NafWidget()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).rojouni,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/UNI3.png',
                                      width: 118,
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: Container(
                                      width: 281,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .rojouni,
                                      ),
                                      child: Align(
                                        alignment:
                                        AlignmentDirectional(-1.00, 0.00),
                                        child: Text(
                                          'Naf',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30,
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DentalWidget()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).rojouni,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/UNI3.png',
                                      width: 118,
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    width: 281,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).rojouni,
                                    ),
                                    child: Align(
                                      alignment:
                                      AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Text(
                                          'Consultorio dental',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30,
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FotoWidget()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).rojouni,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/UNI3.png',
                                      width: 118,
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    width: 281,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).rojouni,
                                    ),
                                    child: Align(
                                      alignment:
                                      AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Text(
                                          'Fotocopiadora',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30,
                                          ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CanchasWidget()));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).rojouni,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/UNI3.png',
                                      width: 118,
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    width: 281,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color:
                                      FlutterFlowTheme.of(context).rojouni,
                                    ),
                                    child: Align(
                                      alignment:
                                      AlignmentDirectional(-1.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Text(
                                          'Canchas',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 30,
                                          ),
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
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: Text(
                              'Mas',
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).rojouni,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'Lector de QR',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 38,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).rojouni,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'Informacion de pisos',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 38,
                                ),
                              ),
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
    );
  }
}
