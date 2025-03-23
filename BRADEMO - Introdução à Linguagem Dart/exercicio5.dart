/*5. Escreva um programa em Dart para criar uma classe Camera com
propriedades privadas [id, marca, cor, preço]. Crie métodos getter e setter
para acessar e modificar os valores. Além disso, crie 3 objetos dela e
imprima todos os detalhes.*/

class Camera {
  int _id;
  String _marca;
  String _cor;
  double _preco;

  Camera(this._id, this._marca, this._cor, this._preco);

  int get id => _id;
  set id(int value) => _id = value;

  String get marca => _marca;
  set marca(String value) => _marca = value;

  String get cor => _cor;
  set cor(String value) => _cor = value;

  double get preco => _preco;
  set preco(double value) => _preco = value;

  @override
  String toString() {
    return 'ID: $_id\nMarca: $_marca\nCor: $_cor\nPreço: R\$ ${_preco}\n';
  }
}

void main() {
  Camera cam1 = Camera(1, 'Marca 1', 'Preta', 2500.45);
  Camera cam2 = Camera(2, 'Marca 2', 'Vermelha', 3200.50);
  Camera cam3 = Camera(3, 'Marca 3', 'Branca', 2800.00);

  print(cam1);
  print(cam2);
  print(cam3);

  cam3.preco = 2900.00;
  print('Preço da câmera 3 atualizado para: R\$ ${cam3.preco}');
}
