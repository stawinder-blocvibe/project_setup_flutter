class VehicleData {
  int? id;
  var title;
  var model;
  var year;
  var color;
  var licensePlate;
  var stateId;
  var typeId;
  var createdOn;
  int? createdById;

  VehicleData(
      {this.id,
      this.title,
      this.model,
      this.year,
      this.color,
      this.licensePlate,
      this.stateId,
      this.typeId,
      this.createdOn,
      this.createdById});

  VehicleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    model = json['model'];
    year = json['year'].toString();
    color = json['color'];
    licensePlate = json['license_plate'];
    stateId = json['state_id'];
    typeId = json['type_id'];
    createdOn = json['created_on'];
    createdById = json['created_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['model'] = this.model;
    data['year'] = this.year;
    data['color'] = this.color;
    data['license_plate'] = this.licensePlate;
    data['state_id'] = this.stateId;
    data['type_id'] = this.typeId;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}
