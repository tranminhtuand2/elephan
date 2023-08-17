class DanhMuc {
  int? idDanhmuc;
  String? tenDanhmuc;
  String? urlImage;
  bool? status;

  DanhMuc({this.idDanhmuc, this.tenDanhmuc, this.urlImage, this.status});

  DanhMuc.fromJson(Map<String, dynamic> json) {
    idDanhmuc = json['id_danhmuc'];
    tenDanhmuc = json['ten_danhmuc'];
    urlImage = json['url_image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_danhmuc'] = idDanhmuc;
    data['ten_danhmuc'] = tenDanhmuc;
    data['url_image'] = urlImage;
    data['status'] = status;
    return data;
  }
}
