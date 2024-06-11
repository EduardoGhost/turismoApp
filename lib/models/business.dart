class Business {
  final String id;
  final String name;
  final String image;
  final String local;
  // final String produtos;

  Business({
    required this.id,
    required this.name,
    required this.image,
    required this.local
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'local': local,
    };
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
        id: map['id'],
        name: map['name'],
        image: map['image'],
        local: map['local'],
    );
  }
}