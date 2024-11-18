import 'DocGia.dart';
import 'Sach.dart';
import 'ThuVien.dart';

void main (){
  Sach s = Sach ('S01', 'Sách 1', 'Tác Giả 1',false);
  s.HienThiSach();
  //Kiem tra getter/ setter
  print('Kiem tra getter Ten sach: ${s.tenSach}');
  s.tacGia = "Hậu";
  print ('Kiem tra (setter) tác giả: ${s.tacGia}');

  List<Sach> sachs = [];
  sachs.add( Sach('S01', 'Sách 1', 'Tác Giả 1',false));

  // Tạo Danh sách sách
  Thuvien thuvien =Thuvien();
  thuvien.ThemSach(s);
  thuvien.ThemSach(Sach('S02', 'Sách 2', 'Tác Giả 1',false));
  thuvien.ThemSach(Sach('S03', 'Sách 3', 'Tác Giả 2',false));
  thuvien.ThemSach(Sach('S04', 'Sách 4', 'Tác Giả 2',false));
  thuvien.ThemSach(Sach('S05', 'Sách 5', 'Tác Giả 1',false));
  // Danh sách đọc giả
  thuvien.ThemDG(DocGia('DG01', 'Nguyễn Văn A'));
  thuvien.ThemDG(DocGia('DG02', 'Nguyễn Văn B'));
  thuvien.ThemDG(DocGia('DG03', 'Nguyễn Văn C'));

  //Kiem tra muon sach
  DocGia dg1 =DocGia('DG01', 'Nguyễn Văn A');
  dg1.MuonSach(s);
  DocGia dg2 = DocGia('DG00', 'Nguyễn Văn B');
  dg2.MuonSach(s); 

  dg1.DS_Sach_Muon();
  dg2.DS_Sach_Muon();




}