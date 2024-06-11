class localTuristico {
  final String id;
  final String name;
  final String image;
  final String local;
  // final String produtos;

  localTuristico({
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

  factory localTuristico.fromMap(Map<String, dynamic> map) {
    return localTuristico(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      local: map['local'],
    );
  }
}