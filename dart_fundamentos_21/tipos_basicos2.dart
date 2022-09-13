/**
 * - List
 * - Set
 * - Map
 */
void main(List<String> args) {
  //List aprovados = ['Ana', 'Maria', 'Carlos', 'Jubileu'];
  var aprovados = ['Ana', 'Maria', 'Carlos', 'Jubileu'];
  print(aprovados is List);
  print(aprovados);
  print(aprovados.elementAt(2));
  print(aprovados[2]);
  print(aprovados.length);

  //Map telefones = new Map();
  // Map<String,String>outraFormaDedeclarar=new Map();
  var telefones = {
    //estrutura chave:valor
    'Rafa': '+55 (38) 9 9091-0919',
    'Gabriele': '+55 (38) 9 9091-0919',
    'Milena': '+55 (38) 9 9091-0919',
  };
  print(telefones as Map);
  print(telefones);
  print(telefones['Rafa']);
  print(telefones.length);
  print(telefones.values);
  print(telefones.keys);
  print(telefones.entries);
  print(telefones.containsValue('+55 (38) 9 9091-0919'));

  var times = {'vasco', 'flamengo', 'fortaleza', 'sao paulo'};
  print(times as Set);
  times.add('palmeiras');
  print(times.length);
  print(times.contains('palmeiras'));
}
