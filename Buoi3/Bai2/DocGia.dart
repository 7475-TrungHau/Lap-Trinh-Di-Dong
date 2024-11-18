import 'Sach.dart';

class DocGia {
  String _maDocGia;
  String _ten;
  List<Sach> _sachs = [];

  DocGia (this._maDocGia, this._ten);

  String get maDocGia => _maDocGia;
  String get ten => _ten;
  List<Sach> get sachs => _sachs;


  set maDocGia (String maDocGia) {
    if(maDocGia.isNotEmpty){
      _maDocGia = maDocGia;
    }
  }
  set ten (String ten) => ten.isNotEmpty ? _ten = ten : _ten;
  

  void MuonSach (Sach s){
    if(!s.trangThaiMuonSach){
      _sachs.add(s);
      s.trangThaiMuon = true;
    }else {
      print ('--- Không thể mượn sách');
    }
    
  }

  void DS_Sach_Muon (){
    print('Danh sach sach muon Doc gia Ma ${_maDocGia}: \n');
    for (var sach in _sachs){
      sach.HienThiSach();
    }
  }

  void TraSach (Sach s){
    if(_sachs.contains(s)){
      _sachs.remove(s);
      s.trangThaiMuon = false;
    }
  }




}