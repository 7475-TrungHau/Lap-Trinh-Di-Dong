
import 'NhanVien.dart';
import 'NhanVienBanHang.dart';

void main (){
  var nv = NhanVien('NV001', 'Nguyễn Văn A', 5000000);
    print('Thông tin nhân viên thường:');
    nv.hienThiThongTin();

    // Test nhân viên bán hàng
    var nv_BH = NhanVienBanHang('NV002', 'Phạm Thị B', 5000000, 100000000, 0.02);
    print('\nThông tin nhân viên bán hàng:');
    nv_BH.hienThiThongTin();

    // Test setter
    nv_BH.doanhSo = 150000000;
    print('\nSau khi tăng doanh số:');
    nv_BH.hienThiThongTin();
    
    // Test tính đa hình
    List<NhanVien> danhSachNV = [nv, nv_BH];
    print('\nHiển thị danh sách nhân viên:');
    for (var nhanVien in danhSachNV) {
      nhanVien.hienThiThongTin();
      print('');
    }

    //Kiem tra tinh toan luong Nhan vien ban hang
    List<NhanVienBanHang> nv_BHs = [];
    nv_BHs.add(nv_BH);
    nv_BHs.add(NhanVienBanHang('NV003', 'Trinh Nhat N', 4000000, 130000000, 0.3));
    int dem =0;
    for (var nv in nv_BHs){
      dem++;
      print('/n Nhan vien ma: ${nv.maNV}');
      nv.hienThiThongTin();
    }
}