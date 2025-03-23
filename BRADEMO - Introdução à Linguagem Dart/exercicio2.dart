/*2. Escreva um programa em Dart para criar uma classe House com as
propriedades [id, nome, preço]. Crie um construtor para ela e crie 3 objetos.
Adicione-os a uma lista e imprima todos os detalhes.*/

class House {
  int id;
  String nome;
  double preco;

  House(this.id, this.nome, this.preco);

  @override
  String toString() {
    return 'ID: $id\nNome: $nome\nPreço: R\$ ${preco}\n';
  }
}

void main() {
  House house1 = House(1, 'House 1', 100000.00);
  House house2 = House(2, 'House 2', 120000.50);
  House house3 = House(3, 'House 3', 90000.99);

  List<House> listHouses = [house1, house2, house3];

  for (House house in listHouses) {
    print(house);
  }
}
