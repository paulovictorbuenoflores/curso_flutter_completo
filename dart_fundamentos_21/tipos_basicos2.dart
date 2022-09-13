/**
 * - List
 * - Set
 * - Map
 */
void main(List<String> args) {
  print("List");
  //List aprovados = ['Ana', 'Maria', 'Carlos', 'Jubileu'];
  var aprovados = ['Ana', 'Maria', 'Carlos', 'Jubileu'];
  print(aprovados is List);
  print(aprovados);
  print(aprovados.elementAt(2));
  print(aprovados[2]);
  print(aprovados.length);

  print("Map");
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

  print("Set");
  //diferenca entre o set e o list? o set (o conjunto ) nao aceita repeticao
  var times = {'vasco', 'flamengo', 'fortaleza', 'sao paulo'};
  print(times as Set);
  times.add(
      'palmeiras'); //vai adicionar apenas uma vez porque o Set não permite repeticao, se ja estivesse palmeiras nao aceitaria nenhuma vez
  times.add('palmeiras');
  times.add('palmeiras');
  times.add('palmeiras');
  print(times.length);
  print(times.contains('palmeiras'));
  print(times.first);
  print(times.last);
  print(times);
}
