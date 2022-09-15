main() {
  for (int a = 0; a < 10; a++) {
    if (a == 6) {
      break; //suspende o laço for, vai direto para o print
    }
  }

  print("Fim do FOR");

  for (int a = 0; a < 10; a++) {
    if (a % 2 == 1) {
      continue; //suspende apenas uma repeticao, o laço ainda continua rodando
    }
    print(a);
  }
}
