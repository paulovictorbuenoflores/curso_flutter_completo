import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Resultado extends StatelessWidget {
  const Resultado();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Parabéns'),
    );
  }
}


/**return Resposta(
            resp['texto'].toString(),
            () => quandoResponder(int.parse(resp['pontuacao'].toString())),
          ); */