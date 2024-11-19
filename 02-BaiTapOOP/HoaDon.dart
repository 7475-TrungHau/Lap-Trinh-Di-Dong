
import 'XuLy.dart';
import 'DienThoai.dart';


class Hoadon {
  late String _maHD;
  DateTime _ngayLap = DateTime.now();
  late Dienthoai _dienthoai;
  late int _sl;
  late double _giaBan;
  late String _tenKH; // Ten khach hang
  late String _SDT; //so dien thoai khach

  Hoadon();
  
  Hoadon.Data (this._maHD, this._ngayLap , this._dienthoai, this._sl, this._giaBan, this._tenKH, this._SDT) ;
  

  String get maHD => _maHD;
  DateTime get ngayLap => _ngayLap;
  Dienthoai get dienThoai => _dienthoai;
  int get sl => _sl;
  double get giaBan => _giaBan;
  String get tenKh => _tenKH;
  String get SDT =>_SDT;

//setter
  
  set maHD (String value) => KiemTraMaHoaDon(value) ? _maHD = value : throw FormatException("Ma Hoa Don ko hop le");
  set ngayLap (DateTime ngayLap) => ngayLap.isAfter(DateTime.now()) ? throw FormatException("Ngay Ban <= hien tai") : _ngayLap = ngayLap;
  set dienThoai (Dienthoai value) => _dienthoai = value;
  set sl (int value) => value >0 && value <= _dienthoai.sl  ? _sl= value : throw FormatException("So luong dien thoai trong kho khong du de lap hoa don");
  set giaBan (double value) => value > 0? _giaBan = value : throw FormatException("Gia ban > 0");
  set tenKH (String value) => value.isNotEmpty ? _tenKH = value : throw FormatException("Ten khach hang ko duoc trong");
  set SDT (String value) => KiemTraSDT(value) ? _SDT = value : throw FormatException("SDT ko hop le (10 so)");

  //Tinh Tong tien
  double TongTien (){
    return _sl * _giaBan;
  }
  //Tinh loi nhuan thuc te
  double TinhLoiNhuan (){
    return TongTien() - (_dienthoai.giaMua * _sl);
  }

  //Hien thi ngay 
  String ThoiGian (DateTime date){
    return "${date.day}/${date.month}/${date.year}";
  }
  // Hien thi thong tin Hoa Don
  void HienThiHD (){
    print("\n");
    print('Hoa Don ${_maHD}');
    print ('Ngay Lap Hoa Don: ${ThoiGian(_ngayLap)}');
    print ('Ten San pham: ${_dienthoai.ten}');
    print ('SL: ${_sl}');
    print('Gia: ${_giaBan.toStringAsFixed(2)}');
    print('Ten Khach Hang: ${_tenKH}');
    print ('SDT: ${_SDT}');
   
  }

}