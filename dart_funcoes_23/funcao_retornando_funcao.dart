void main(List<String> args) {
  print(somaParcial(2)(10));

  int Function(int) somaCom10 = somaParcial(2);
  print(somaCom10(10));
}

int Function(int) somaParcial(int a) {
  int c = 0;

  return (int b) {
    return a + b + c;
  };
}
