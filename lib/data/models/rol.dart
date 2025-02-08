class Rol {
  final String id;
  final String nombre;
  Rol({
    required this.id,
    required this.nombre,
  });

  factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      id: json["id"],
      nombre: json["nombre"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
    };
  }

}
