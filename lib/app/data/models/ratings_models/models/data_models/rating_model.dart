class RatingDataModel {
  int? id;
  int? restaurantId;
  double? restaurantRating;
  String? restaurantComment;
  int? orderId;
  int? driverId;
  double? driverRating;
  String? driverComment;
  String? createdOn;
  String? userName;
  String? userImageUrl;
  int? createdById;

  RatingDataModel(
      {this.id,
      this.restaurantId,
      this.restaurantRating,
      this.restaurantComment,
      this.orderId,
      this.driverId,
      this.driverRating,
      this.driverComment,
      this.createdOn,
      this.createdById});

  RatingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    restaurantRating = _stringToDouble(json['restaurant_rating']);
    restaurantComment = json['restaurant_comment'];
    orderId = json['order_id'];
    driverId = json['driver_id'];
    driverRating = _stringToDouble(json['driver_rating']);
    driverComment = json['driver_comment'];
    userName = json['created_by_name'];
    userImageUrl = json['created_by_image'];
    createdOn = json['created_on'] != null
        ? DateTime.parse(json['created_on'] + 'Z').toLocal().toString()
        : null;
    createdById = json['created_by_id'];
  }

  double? _stringToDouble(var data) {
    return (data != null && data != '') ? double.parse(data.toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['restaurant_rating'] = this.restaurantRating;
    data['restaurant_comment'] = this.restaurantComment;
    data['order_id'] = this.orderId;
    data['driver_id'] = this.driverId;
    data['driver_rating'] = this.driverRating;
    data['driver_comment'] = this.driverComment;
    data['created_on'] = this.createdOn;
    data['created_by_id'] = this.createdById;
    return data;
  }
}
