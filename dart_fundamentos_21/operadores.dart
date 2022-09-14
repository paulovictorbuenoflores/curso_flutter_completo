import 'dart:io';

void main(List<String> args) {
  {
    //operadores aritmeticos, binarios porque tem duas variaveis operando, a+b, infix
    int a = 7;
    int b = 3;

    print(a - b);
    print(a + b);
    print(a * b);
    print(a / b);
    print(a % b);
    print(81 % 9);
    print(a + (b * a) - (b / a));
  }
  {
    //operadores logicos, binarios porque tem dois operando, notacao infix ou seja no meio dos operando
    bool c = true;
    bool d = false;

    print(c && d); // AND, E
    print(c || d); // OR, ou
    print(c ^ d); // XOR, ou exclusivo
    print(!c); // NOT, negacao prefixado
  }
  {
    //operadores de atribuicao binario/infix, faz operacao aritmetica imbutida.

    double x = 9;
    x = x + 2;
    x += 2;
    x -= 2;
    x *= 2;
    x /= 2;
    x %= 2;

    print(x);
  }
  {
    //Operadores Relacionais ( binario/infix ) o resultado sempre é BOOL
    print(3 > 2);
    print(3 >= 3);
    print(3 < 4);
    print(3 <= 3);
    print(3 != 3);
    print(3 == 3);
  }

  {
    //operadores Unários/postfix ou prefix
    int a = 1, b = 1;
    a++; //Posfix
    print(a);
    --a; //Prefix
    print(a);
    a = 3;
    b = 4;

    //operador logico, negacao é unario
    print(!true);
    //o resultado da operacao abaixo é true, porque a++ só vai ser incrementado depois da operacao == , já --b tem preferencia deve ser decrementado na hora;
    print(a++ == --b);
  }

  {
    //Operador ternario
    print("Esta chovendo ? (s/N)");
    bool estaChovendo = stdin.readLineSync() == "s";

    print("Está frio ? (s/N)");
    bool estaFrio = stdin.readLineSync() == "s";

    String resultado =
        estaChovendo || estaFrio ? "Ficar em casa" : "Sair !"; //ternario
    print(resultado);
  }
}
