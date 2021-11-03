class PhotoModel {
  int id = 0;
  String photoName = '';

  PhotoModel(this.id, this.photoName);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photo_name': photoName,
    };
    return map;
  }

  PhotoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    photoName = map['photo_name'];
  }
}
