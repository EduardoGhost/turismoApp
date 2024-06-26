class LocalTuristico {
  String id;
  String name;
  String description;
  String image;
  String local;
  //implementar metodo para horario de abertura e fechamento
  String hours;
  String contact;
  String latitude;
  String longitude;

  LocalTuristico({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.local,
    required this.hours,
    required this.contact,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'local': local,
      'hours': hours,
      'contact' : contact,
      'latitude' : latitude,
      'longitude' : longitude,
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
      contact: map['contact'],
      latitude: map['latitude'],
      longitude: map['longitude'],

    );
  }
}