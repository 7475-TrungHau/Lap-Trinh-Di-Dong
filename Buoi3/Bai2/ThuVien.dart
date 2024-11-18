import 'DocGia.dart';
import 'Sach.dart';

class Thuvien {
  List<DocGia> _dsDocGia = [];
  List<Sach> _sachs = [];

  Thuvien ();

  List<Sach> get sachs => _sachs;
  List<DocGia> get dsDocGia => _dsDocGia;

  void ThemSach (Sach s){
    _sachs.add(s);
  }

  void ThemDG (DocGia dg){
    _dsDocGia.add(dg);
  }

  void HienthiDanhSach_Sach (){
    print('\n-------------------------------------');
    print('\n Danh Sách sách:  ');
    for(var s in _sachs){
      s.HienThiSach();
      print('---------------------------------------');
    }
  }
}