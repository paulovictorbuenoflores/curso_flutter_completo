class Carro {
  final int velocidadeMaxima;
  int velocidadeAtual = 0;

  Carro.velocidadeMax({this.velocidadeMaxima = 100}) {
    //velocidadeAtual = 0;
  }

  acelerar() {
    print("aceleraste !\n");
    if (velocidadeAtual < velocidadeMaxima) {
      for (int i = 0; i < 5; i++) {
        if (velocidadeAtual < velocidadeMaxima) {
          velocidadeAtual += 1;
        }
        print("| $velocidadeAtual | ");
      }
      // print("acelerou!\n$velocidadeAtual");
    } else {
      print("atingiu velocidade maxima ");
      print("O carro está no limite: ${estaNoLimite()}");
    }
  }

  int frear() {
    if (velocidadeAtual >= 0) {
      int velocidade;

      velocidade = velocidadeAtual - velocidadeAtual;
      velocidadeAtual = velocidade;
    }
    return velocidadeAtual;
  }

  bool estaNoLimite() {
    bool limit = false;
    if (velocidadeAtual == velocidadeMaxima) {
      limit = true;
    }

    return limit;
  }

  String toString() {
    return "velocidade: " +
        velocidadeAtual.toString() +
        "\nO carro está no limite: ${estaNoLimite()}";
  }
}
