
import 'CuaHang.dart';
import 'DienThoai.dart';
import 'HoaDon.dart';

void main(){
  //Them dien thoai
  Dienthoai dt =Dienthoai.WithData("DT-001", "SamSung Galaxy A10s", "SamSung", 2700000, 3200000, 23, true);
  
  //Cap nhat thong tin va bat loi
  try{
    dt.maDt = "DT-000";
    dt.sl = 10;
  }on FormatException catch (e){
    print('Lỗi: $e');
  } 
  dt.HienThi();

  //2.
  //Tao Hoa don
  Hoadon hd = Hoadon.Data("HD-001",DateTime(2024, 11, 18), dt, 2, 3200000, "Nguyen Van A", "0845759821" );
  //in ra man hinh
  hd.HienThiHD();
  

  //Tao danh sach dien thoai
  print('\n-------Them Dien Thoai -----------');
  CuaHang cuaHang = CuaHang.Data("Dien Thoai Di Dong", "Thu Duc, Thanh Pho Ho Chi Minh");
  cuaHang.ThemDT(dt);
  cuaHang.ThemDT(Dienthoai.WithData("DT-002", "SamSung Galaxy A50", "SamSung", 5700000, 7000000, 14, true));
  //Them that bai vi trung ma DT-002
  cuaHang.ThemDT(Dienthoai.WithData("DT-002", "SamSung Galaxy A50", "SamSung", 5700000, 7000000, 14, true));

  cuaHang.ThemDT(Dienthoai.WithData("DT-003", "Iphone X", "Apple", 10700000, 13700000, 20, true));
  cuaHang.ThemDT(Dienthoai.WithData("DT-004", "Oppo Reno 5", "Oppo", 8200000, 9000000, 17, true));

  //Danh sach DT
  cuaHang.HienThi_DS_DT();

  //Cap nhat thong tin san pham :
  Dienthoai dtMoi = dt;
  try{
    dtMoi.sl = 100;
    dtMoi.giaBan = 3000000;
  }on FormatException catch (e){
    print('Lỗi: $e');
  } 
  cuaHang.CapNhatDT(dtMoi);
  print('\nDanh sach sau khi cap nhat dien thoai');
  cuaHang.HienThi_DS_DT();

  // Tao DS Hoa Don
  cuaHang.Them_HD(hd);
  cuaHang.Them_HD(Hoadon.Data("HD-002",DateTime(2024, 11, 19), cuaHang.dsDienThoai[1], 1, cuaHang.dsDienThoai[1].giaBan , "Nguyen Van B", "0845759824" ));
  cuaHang.Them_HD(Hoadon.Data("HD-003",DateTime(2024, 10, 19), cuaHang.dsDienThoai[0], 3, cuaHang.dsDienThoai[0].giaBan , "Nguyen Van C", "0845759824" ));
  cuaHang.Them_HD(Hoadon.Data("HD-002",DateTime(2024, 10, 19), cuaHang.dsDienThoai[1], 1, cuaHang.dsDienThoai[1].giaBan , "Nguyen Van B", "0845759824" ));
  cuaHang.Them_HD(Hoadon.Data("HD-004",DateTime(2024, 9, 19), cuaHang.dsDienThoai[2], 4, cuaHang.dsDienThoai[2].giaBan , "Nguyen Van B", "0845759824" ));
 //Thong tin san pham sau khi ban
  cuaHang.HienThi_DS_HD();
  cuaHang.HienThi_DS_DT();

  //Tinh toan Tong tien va loi nhuan:
  print("\nTong Tien: ${cuaHang.TongDoanhThu_ThoiGian(DateTime(2000, 1,1), DateTime(2099, 1,1))}");
  print("\nLoi Nhuan: ${cuaHang.TongLoiNhuan_ThoiGian(DateTime(2000, 1,1), DateTime(2099, 1,1))}");

  //Top ban chay (top 2 san pham ban chay nhat)
  cuaHang.Top_DT_BanChay(2);

  //Loi nhuan theo thoi gian
  print('\nTong doanh thu thang 11:  ${cuaHang.TongDoanhThu_ThoiGian(DateTime(2024, 11, 1), DateTime(2024, 11, 30))}');
  print('\nTong Loi nhuan thang 11:  ${cuaHang.TongLoiNhuan_ThoiGian(DateTime(2024, 11, 1), DateTime(2024, 11, 30))}');

  //Bao cao ton kho ??? 
  cuaHang.HienThi_DS_DT();

  //Kiem tra dien thoai trong kho ko du de lap hoa don
  Hoadon hd3 = Hoadon.Data("HD-012",DateTime(2024, 9, 19), cuaHang.dsDienThoai[2], 3, cuaHang.dsDienThoai[2].giaBan , "Nguyen Van B", "0845759824" );
  try{
    hd3.sl = 30;
    hd3.maHD = 'HD-019';
    cuaHang.Them_HD(hd3);
  } on FormatException catch (e){
    print('Loi: $e');
  }

cuaHang.HienThi_DS_HD();
  

 
  
}