class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuonSach = false;


  Sach (this._maSach, this._tenSach, this._tacGia, this._trangThaiMuonSach );

  //getters
  String get maSach  => _maSach;
  String get tenSach  => _tenSach;
  String get tacGia  => _tacGia;
  bool get trangThaiMuonSach => _trangThaiMuonSach;
  String get trangThaiMuonSachs => _trangThaiMuonSach ? "Có" : "không";

  //setters
  set maSach (String maSach) => maSach.isNotEmpty ? _maSach = maSach : _maSach;

  set tenSach (String tenSach) => tenSach.isNotEmpty ? _tenSach= tenSach : _tenSach;
  set tacGia (String tacGia) => tacGia.isNotEmpty ? _tacGia= tacGia : _tacGia;
  set trangThaiMuon (bool trangThaiMuon) => trangThaiMuon ? true : false;

  void HienThiSach (){
    print('Thông tin sách: ');
    print('Mã: ${_maSach}');
    print('Tên: ${_tenSach}');
    print('Tác giả: ${_tacGia}');
    print ('Trạng thái mươn: ${trangThaiMuonSachs}');

  }
}

