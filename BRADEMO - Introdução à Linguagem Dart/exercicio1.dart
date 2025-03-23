/*1. Escreva um programa em Dart para criar uma classe Laptop com as
propriedades [id, nome, ram] e crie 3 objetos dela, imprimindo todos os
detalhes.*/

class Laptop {
  int id;
  String nome;
  int ram;

  Laptop(this.id, this.nome, this.ram);

  @override
  String toString() {
    return 'ID: $id\nNome: $nome\nRAM: ${ram}GB\n';
  }
}

void main() {
  Laptop laptop1 = Laptop(1, 'Laptop 1', 8);
  Laptop laptop2 = Laptop(2, 'Laptop 2', 16);
  Laptop laptop3 = Laptop(3, 'Laptop 3', 32);

  print(laptop1);
  print(laptop2);
  print(laptop3);
}
