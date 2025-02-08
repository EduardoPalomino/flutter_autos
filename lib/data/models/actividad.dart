class ActividadModel {
  final String id;
  final String nombre;
  final String descripcion;
  final dynamic icon;
  ActividadModel({
    required this.id,
    required this.nombre,
    required this.descripcion,
    this.icon,

  });

  factory ActividadModel.fromJson(Map<String, dynamic> json) {
    print('json: ${json}');
    return ActividadModel(
      id: json['_id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      icon: json['icon'],
    );
  }

  //como un tipado de interfaces
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'icon': icon,
    };
  }
}