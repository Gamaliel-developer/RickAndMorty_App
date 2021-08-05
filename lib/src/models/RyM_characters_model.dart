class RyMModel {
  int? id;
  String? name;
  String? status;
  String? type;
  String? species;
  String? gender;
  String? image;

  RyMModel({
    this.id,
    this.name,
    this.status,
    this.type,
    this.species,
    this.gender,
    this.image
  });

  factory RyMModel.fromMapJson(Map<String, dynamic> data) => RyMModel(
        id: data['id'],
        name: data['name'],
        status: data['status'],
        type: data['type'],
        species: data['species'],
        gender: data['gender'],
        image: data['image']
      );


}