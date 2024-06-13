class LocalTuristico {
  String id;
  String name;
  String description;
  String image;
  String local;
  String hours;

  LocalTuristico({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.local,
    required this.hours,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'local': local,
      'hours': hours,
    };
  }

  factory LocalTuristico.fromMap(Map<String, dynamic> map) {
    return LocalTuristico(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      local: map['local'],
      hours: map['hours'],
    );
  }
}