class Carro {
  final int velocidadeMaxima;
  int _velocidadeAtual = 0;

  Carro.velocidadeMax({this.velocidadeMaxima = 100}) {
    //velocidadeAtual = 0;
  }

  acelerar() {
    print("aceleraste !\n");
    if (_velocidadeAtual < velocidadeMaxima) {
      if (!estaNoLimite()) {
        for (int i = 0; i < 5; i++) {
          if (_velocidadeAtual < velocidadeMaxima) {
            _velocidadeAtual += 1;
          } else {
            print("atingiu velocidade maxima ");
            print("O carro está no limite: ${estaNoLimite()}");
          }
          print("| $_velocidadeAtual | ");
        }
        // print("acelerou!\n$velocidadeAtual");
      }
    }
  }

  int frear() {
    if (_velocidadeAtual >= 0) {
      print("$_velocidadeAtual");
      for (int i = 0; i < 5; i++) {
        if (_velocidadeAtual > 0) {
          _velocidadeAtual -= 1;
        } else if (_velocidadeAtual == 0 || _velocidadeAtual < 0) {
          break;
        }
      }
    }

    return _velocidadeAtual;
  }

  bool estaNoLimite() {
    bool limit = false;
    if (_velocidadeAtual == velocidadeMaxima) {
      limit = true;
    }

    return limit;
  }

  String toString() {
    return "velocidade: " +
        _velocidadeAtual.toString() +
        "\nO carro está no limite: ${estaNoLimite()}";
  }
}
