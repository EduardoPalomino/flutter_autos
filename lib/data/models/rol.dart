
class Rol{
  final String id;
  final String nombre;

  const Rol({required this.id, required this.nombre});

  factory Rol.fromJson(Map<String, dynamic> json) {
    return Rol(
      id: json["_id"]?.toString() ?? "",
      nombre: json["nombre"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "nombre": nombre,
    };
  }

}
