import 'dart:io';

/**Constantes em dart
 * Em ralação as outras linguagens o dart tem duas formas(palavras restritas) de declarar constantes
 * 1-final
 * 2-const
 */
void main(List<String> args) {
  //Qual a diferença de const e final?
  //const  é uma variavel que pode ser definida no momento da compilação, não pode ser definida em rum time, tempo de execucao, apenas uma vez declarada, não pode ser alterada
  //final é um variavel que pode ser definida em tempo de execucao, apena uma vez, não pode ser alterada
//só posso criar uma constante const apartir de uma const
  const Pi = 3.1415;

  print("Informe um valor");
  final entradaDoUsuario = stdin.readLineSync()!;
  final raio = double.parse(entradaDoUsuario);
  final area = Pi * raio * raio;
  print("O valor do é:" + area.toString());
}
