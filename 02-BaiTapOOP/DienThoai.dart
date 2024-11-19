import 'dart:ffi';
import 'XuLy.dart';

class Dienthoai {
  late String _maDT; //Ma dien thoai
  late String _ten;
  late String _NSX; //Nha san xuat hay hang san xuat
  late double _giaMua; 
  late double _giaBan;
  late int _slTonKho; //So luong ton kho
  late bool _trangThai; //Trang thai con kinh doanh hay ko

  //Tao contructor rong de phuc vu nhap lieu tu ban phim
  Dienthoai ();
  // Contructor thuong
  Dienthoai.WithData (this._maDT, this._ten, this._NSX, this._giaMua, this._giaBan, this._slTonKho, this._trangThai);

  
  // Dienthoai({required String maDT, required String ten, required String NSX, double? giaNhap, double? giaBan, int? slTonKho, bool trangThai =false})
  // :_NSX =NSX, _maDT =maDT, _ten =ten, _giaBan =giaBan ?? 0, _giaMua = giaNhap??0, _slTonKho = slTonKho ?? 0, _trangThai = trangThai;

  //getters
  String get maDt => _maDT;
  String get ten => _ten;
  String get NSX => _NSX;
  double get giaMua => _giaMua;
  double get giaBan => _giaBan;
  int get sl => _slTonKho;
  bool get trangThai => _trangThai;

  //Kiem tra trang thai kinh doanh
  String  trangThaiKD () => _trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh";

  //setters
  //Cach 1:
  // set maDt (String value) {
  //   if(value.isNotEmpty){
  //     int maSo = int.tryParse(value.substring(6)) ?? 0;
  //     if(value.contains("DT-") && value.length == 6 && maSo > 0 ){
  //       _maDT = value;
  //     }
  //   }
  // }
  //Cach 2:
  set maDt (String value) => KiemTraMaDienThoai(value) ? _maDT = value : throw FormatException("Mã điện thoại không hợp lệ !");

  set ten (String value) => value.isNotEmpty ? _ten = value : throw FormatException ("Ten ko duoc de trong");
  set NSX (String value) => value.isNotEmpty ? _NSX = value : throw FormatException ("Nhà sản xuất không được trống");
  set giaBan (double value) => value > _giaMua ? _giaBan =value : throw FormatException("Gias ban phai lon hon gia mua"); //Gia mua mac dinh la 0 => gia ban > 0
  set giaMua (double value) => value > 0 ? _giaMua = value : throw FormatException("Gia mua phai lon hon 0");
  set sl (int value) => value >= 0 ? _slTonKho = value : throw FormatException("SL phai >= 0");
  set trangThai (bool value) => _trangThai = value;

  //Tinh loi nhuan du kien
  double LoiNhuanDuKien (){
    return (_giaBan - giaMua) * _slTonKho;
  }

  //Hien thi thong tin
  void HienThi (){
    print("\n");
    print ('Mã: ${_maDT}');
    print ('Tên: ${_ten}');
    print ('Nhà sản xuất: ${_NSX}');
    print ('Giá Mua: ${_giaMua.toStringAsFixed(2)}');
    print ('Giá Bán: ${_giaBan.toStringAsFixed(2)}');
    print ('SL: ${_slTonKho}');
    print ('Sản phẩm ${trangThaiKD()}');
    print('------------------------');

  }

}