import 'DienThoai.dart';
import 'HoaDon.dart';
import 'XuLy.dart';

class CuaHang {
  late String _ten;
  late String _diaChi;
  late List<Dienthoai> _dsDienThoai = [];
  late List<Hoadon> _dsHoaDon = [];

  //Contructor
  CuaHang ();

  CuaHang.Data (this._ten, this._diaChi);

  //getters
  String get ten => _ten;
  String get diaChi => _diaChi;
  List<Dienthoai> get dsDienThoai => _dsDienThoai;
  List<Hoadon> get dsHoaDon => _dsHoaDon;

  //setters
  set ten (String value) => value.isNotEmpty ? _ten = value : throw FormatException("Ten ko duoc trong");
  set diaChi (String value) => _diaChi = value;

  //Them dien thoai moi
  void ThemDT (Dienthoai dt){
    if(_dsDienThoai.where((d) => d.maDt == dt.maDt).isEmpty){
        _dsDienThoai.add(dt);
        print("Them thanh cong");
    }else print('Them that bai vi Ma dien thoai da ton tai');
  }

  //Cap nhat thong tin dien thoai
  void CapNhatDT (Dienthoai dt){
    bool tonTai = false; //dung de xac nhan dien thoai can cap nhat co ton tai trong danh sach
    for(var d in _dsDienThoai){
      if(d.maDt == dt.maDt){
        d.NSX = dt.NSX;
        d.giaBan = dt.giaBan;
        d.giaMua = dt.giaMua;
        d.sl = dt.sl;
        d.ten = dt.ten;
        d.trangThai = dt.trangThai;

        tonTai = true;//ton tai;
        print('Cap nhat thanh cong cho dien thoai Ma ${d.maDt}');
      }
    }
    if(!tonTai){
      print ('San pham ma ${dt} ko ton tai');
    }
  }

  //Ngung kinh doanh/ kinh doanh lai
  void CapNhatTrangThai (String maDT){
    for(var dt in _dsDienThoai){
      if (dt.maDt == maDT) {
        dt.trangThai = dt.trangThai ? false : true;
        print('Dien thoai ma ${maDT} ${dt.trangThaiKD()}');
      }
    }
  }

  //Tim kiem theo Ma DT
  void Tim_DT_Ma (String maDT){
    print('\nTim kiem theo ma: ${maDT}');
    for(var dt in _dsDienThoai ){
      if(dt.maDt.contains(maDT)){
        dt.HienThi();
      }
    }
  }
  // Hien thi danh sach dien thoai
  void HienThi_DS_DT (){
    print ('\nDanh sach dien thoai: ');
    for(var dt in _dsDienThoai){
      dt.HienThi();
    }
  }

//Them hoa don
  void Them_HD (Hoadon hd){
    
    if( _dsHoaDon.where((h) => h.maHD == hd.maHD).isEmpty){
      print('========================================');
      _dsHoaDon.add(hd);
      _dsDienThoai.firstWhere((dt) => dt.maDt == hd.dienThoai.maDt).sl -= hd.sl; //Cap nhat ton kho cho dien thoai
      print('Them Hoa Don ${hd.maHD} thanh cong');
    }else{
      print("Them hoa don that bai vi ma hoa don da ton tai");
    }
  }

  //Tim kiem hoa don theo ngay
  void Tim_HD_Ngay (DateTime date){
    List<Hoadon> dsHoaDon_Moi = _dsHoaDon.where((hd) => hd.ngayLap == date).toList();

    print('Danh sach hoa don duoc lap vao ngay ${date_String(date)}');
    for(var hd in dsHoaDon_Moi){
      hd.HienThiHD();
      print('---------------------------------------------------');
    }
  }

  //Tim hoa don theo ma 
  void Tim_HD_Ma (String maHD){
    print ('\nDanh sach hoa don tim theo ma ${maHD}: ');
    for(var hd in _dsHoaDon){
      if(hd.maHD == maHD){
        hd.HienThiHD();
        print('------------------------');
      }
    }
  }

  //Danh sach Hoa Don
  void HienThi_DS_HD (){
     print ('\nDanh sach Hoa Don: ');
    for(var hd in _dsHoaDon){
      hd.HienThiHD();
      print('----------------------');
    }
  }

  //Danh sach hoa don trong khoang thoi gian
  List<Hoadon> dsHoaDon_ThoiGian (DateTime tgDau, DateTime tgCuoi){
    return _dsHoaDon.where((hd) =>
           hd.ngayLap.isAfter(tgDau.add(Duration(days: -1))) &&
           hd.ngayLap.isBefore(tgCuoi.add(Duration (days: 1)))).toList();
  }

  //Tong doanh thu theo khoang thoi gian
  double TongDoanhThu_ThoiGian (DateTime tgDau, DateTime tgCuoi){
    double Tong =0;
    for(var hd in dsHoaDon_ThoiGian(tgDau, tgCuoi)){
      Tong += hd.TongTien();
    }
    return Tong;
  }

  //Tong loi nhuan theo khoang thoi gian
  double TongLoiNhuan_ThoiGian (DateTime tgDau, DateTime tgCuoi){
    double Tong =0;
    for(var hd in dsHoaDon_ThoiGian(tgDau, tgCuoi)){
      Tong += hd.TinhLoiNhuan ();
    }
    return Tong;
  }

  //Tong so dien thoai ban ra cua 1 loai dt
  int Tong_DT_Ban (String maDT){
    
    int Tong = 0;
    for(var hd in _dsHoaDon){
      if(maDT == hd.dienThoai.maDt){
        Tong += hd.sl;
      }
    }
    return Tong;
  }

  //Thong ke top n dien thoai ban nhieu nhat 
  void Top_DT_BanChay (int n){
    List<Dienthoai> listTmp = _dsDienThoai.toList();
   
    listTmp.sort((a,b) => Tong_DT_Ban(b.maDt).compareTo(Tong_DT_Ban(a.maDt)));
    print('\nDanh sach top ${n} san pham ban chay nhat:');
    for (int i= 0; i<n; i++){
      listTmp[i].HienThi();
    }
  }


  

}