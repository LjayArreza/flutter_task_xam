// ignore_for_file: no_leading_underscores_for_local_identifiers

class UploadPhotoResponse {
  UploadPhotoResponse({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });
  late final String name;
  late final String job;
  late final String id;
  late final String createdAt;

  UploadPhotoResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['job'] = job;
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    return _data;
  }
}
