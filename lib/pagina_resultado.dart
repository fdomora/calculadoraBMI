import 'package:calculadoraimc/constantes.dart';
import 'package:calculadoraimc/tarjeta_reusable.dart';
import 'package:flutter/material.dart';

class PaginaResultados extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Text('El resultado es: ', style: kTituloTextStyle),
          ),
          Expanded(
            flex: 5,
            child: TarjetaReusable(
              alPresionar: (){},
              colorido: kColorActivo,
              tarjetaChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Normal', style: kResultadoTExt,),
                  Text('18.3', style: kIMCTextStyle),
                  Text('El resultado IMC es bajo, debe comer más!!!', style: kBodyTextStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
