class Carro {
  int _velocidade = 0;
  int acelerar() {
    _velocidade += 5;
    return _velocidade;
  }

  int frear() {
    if (_velocidade > 0) _velocidade -= 5;
    return _velocidade;
  }
}
