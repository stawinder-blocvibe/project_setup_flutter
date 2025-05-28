class GoogleTimeResponseModel {
  List<String>? destinationAddresses;
  List<String>? originAddresses;
  List<GoogleResponseRows>? rows;
  String? status;

  GoogleTimeResponseModel(
      {this.destinationAddresses,
      this.originAddresses,
      this.rows,
      this.status});

  GoogleTimeResponseModel.fromJson(Map<String, dynamic> json) {
    destinationAddresses = json['destination_addresses'].cast<String>();
    originAddresses = json['origin_addresses'].cast<String>();
    if (json['rows'] != null) {
      rows = <GoogleResponseRows>[];
      json['rows'].forEach((v) {
        rows!.add(new GoogleResponseRows.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['destination_addresses'] = this.destinationAddresses;
    data['origin_addresses'] = this.originAddresses;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class GoogleResponseRows {
  List<GoogleResponseElements>? elements;

  GoogleResponseRows({this.elements});

  GoogleResponseRows.fromJson(Map<String, dynamic> json) {
    if (json['elements'] != null) {
      elements = <GoogleResponseElements>[];
      json['elements'].forEach((v) {
        elements!.add(new GoogleResponseElements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elements != null) {
      data['elements'] = this.elements!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoogleResponseElements {
  GoogleResponseDistance? distance;
  GoogleResponseDistance? duration;
  String? status;

  GoogleResponseElements({this.distance, this.duration, this.status});

  GoogleResponseElements.fromJson(Map<String, dynamic> json) {
    distance = json['distance'] != null
        ? new GoogleResponseDistance.fromJson(json['distance'])
        : null;
    duration = json['duration'] != null
        ? new GoogleResponseDistance.fromJson(json['duration'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distance != null) {
      data['distance'] = this.distance!.toJson();
    }
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class GoogleResponseDistance {
  String? text;
  int? value;

  GoogleResponseDistance({this.text, this.value});

  GoogleResponseDistance.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}
