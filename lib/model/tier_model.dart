class TierModel{
  dynamic name;
  dynamic id;


  TierModel({
    this.name,
    this.id,
  });
  factory TierModel.fromJson(Map<dynamic, dynamic>json){

    return TierModel(
      name: json["name"],
      id: json["id"],
    );
  }


}
