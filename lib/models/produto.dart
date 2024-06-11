class Produto {
  final String id;
  final String name;
  final String image;
  final double price;
  final int amount;
  // final String produtos;

  Produto({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.amount,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'amount': amount,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      amount: map['amount'],
    );
  }
}