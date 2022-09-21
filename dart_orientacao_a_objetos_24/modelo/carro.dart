class Carro {
  final int velocidadeMaxima;
  int velocidadeAtual = 0;

  Carro.velocidadeMax({this.velocidadeMaxima = 100}) {
    //velocidadeAtual = 0;
  }

  acelerar() {
    if (velocidadeAtual < velocidadeMaxima) {
      velocidadeAtual += 5;
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
