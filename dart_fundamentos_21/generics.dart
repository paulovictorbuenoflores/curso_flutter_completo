void main(List<String> args) {
  //O generics <> é do ponto de vista de quem criou a classe, ao fazer uso temos que especificar o tipo, se que remos uma List<Carro>, uma lista do tipo carro ou List<String>, ou lista de strings;
  List<String> frutas = ['banana', 'maça', 'Laranja'];
  //é melhor tipos homogêneos, igual a lista (frutas ), ou seja, só temos fruta do tipo string, se tivesse outros tipo, inteiro ou double ou qualquer tipo diferente de string teríamos um tipo de lista heterogênea que é mais difícil de organizar o código.
}
