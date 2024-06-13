class LocalTuristico {
  final String id;
  final String name;
  final String description;
  final String image;
  final String local;
  // final String produtos;

  LocalTuristico({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.local
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'local': local,
    };
  }

  factory LocalTuristico.fromMap(Map<String, dynamic> map) {
    return LocalTuristico(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      local: map['local'],
    );
  }
}