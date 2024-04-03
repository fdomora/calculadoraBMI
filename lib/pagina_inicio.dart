import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icono_contenido.dart';
import 'tarjeta_reusable.dart';
import 'constantes.dart';
import 'pagina_resultado.dart';

enum Genero {hombre, mujer}

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  Color colorTarjetaMujer = kColorInactivo;
  Color colorTarjetaHombre = kColorInactivo;
  Genero generoElegido = Genero.mujer;
  int altura=173;
  int peso=60;
  int edad=25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: TarjetaReusable(
                alPresionar: (){
                  setState(() {
                    generoElegido=Genero.hombre;
                  });
                },
                colorido: generoElegido== Genero.hombre?kColorActivo:kColorInactivo,
                tarjetaChild: IconoContenido(icono: FontAwesomeIcons.mars, etiqueta:"HOMBRECITO",),
              )),
              Expanded(child: TarjetaReusable(
                     alPresionar: (){
                        setState(() {
                        generoElegido=Genero.mujer;
                         });
                        },
                  colorido: generoElegido== Genero.mujer?kColorActivo:kColorInactivo,
                tarjetaChild: IconoContenido(icono: FontAwesomeIcons.venus, etiqueta:"MUJERES",)
              )),
            ],
          )),

          Expanded(
              child: TarjetaReusable(
                alPresionar:(){},
                colorido: kColorActivo,
                tarjetaChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ALTURA', style: kEtiquetaTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(altura.toString(), style: kNumeroTextStyle),
                        Text('cm', style: kEtiquetaTextStyle,),
                      ],
                    ),
                    Slider(
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8d8e98),
                      onChanged: (double nuevoValor){
                        setState(() {
                          altura=nuevoValor.round();
                        });
                      },
                    ),
                  ],
                ),
              )
          ),

          Expanded(child: Row(
            children: [
              Expanded(
                  child: TarjetaReusable(
                    alPresionar:(){},
                    colorido: kColorActivo,
                    tarjetaChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PESO'),
                        Text(peso.toString(), style: kNumeroTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           IconoRedondo(iconito: FontAwesomeIcons.minus,
                             alPresionar: (){
                                setState(() {
                                  peso--;
                                });
                             }
                           ),
                            SizedBox(width: 10.0),
                            IconoRedondo(iconito: FontAwesomeIcons.plus,
                               alPresionar: () {
                                  setState(() {
                                    peso++;
                                  });
                               },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                child: TarjetaReusable(
                  alPresionar:(){},
                  colorido: kColorActivo,
                  tarjetaChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('EDAD'),
                      Text(edad.toString(), style: kNumeroTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconoRedondo(iconito: FontAwesomeIcons.minus,
                              alPresionar: (){
                                setState(() {
                                  edad--;
                                });
                              }
                          ),
                          SizedBox(width: 10.0),
                          IconoRedondo(iconito: FontAwesomeIcons.plus,
                            alPresionar: () {
                              setState(() {
                                edad++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
             ],
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaResultados()));
            },
            child: Container(
              child: Center(child: Text('CALCULAR', style: kBotonLargoTextStyle,)),
              color: kColorContenedorAbajo,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kAlturaContenedorAbajo,
            ),
          ),
        ],
      ),
    );
  }
}

class IconoRedondo extends StatelessWidget {

  IconoRedondo({required this.iconito, required this.alPresionar});
  final IconData iconito;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
     child: Icon(iconito),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
        elevation: 6.0,
        onPressed: alPresionar,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

