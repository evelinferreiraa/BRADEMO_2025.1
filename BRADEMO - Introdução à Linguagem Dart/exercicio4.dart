// Não possui o exercício 3 na lista.

/*4. Escreva um programa em Dart para criar uma classe Animal com as
propriedades [id, nome, cor]. Crie outra classe chamada Cat e a estenda de
Animal. Adicione uma nova propriedade chamada som (do tipo String). Crie
um objeto de Cat e imprima todos os detalhes.*/

class Animal {
  int id;
  String nome;
  String cor;

  Animal(this.id, this.nome, this.cor);

  @override
  String toString() {
    return 'ID: $id\nNome: $nome\nCor: $cor';
  }
}

class Cat extends Animal {
  String som;

  Cat(int id, String nome, String cor, this.som) : super(id, nome, cor);

  @override
  String toString() {
    return '${super.toString()}\nSom: $som\n';
  }
}

void main() {
  Cat gatoEvelin = Cat(1, 'Sandro', 'Frajola', 'Rhen');
  print(gatoEvelin);
}
