


final regex = RegExp(r'^DT-[A-Za-z0-9]{3}$'); 
final regex_DT_number = RegExp(r'DT-[0-9]{3}$');
final regex_HD_number = RegExp(r'HD-[0-9]{3}$');
final regex_SDT = RegExp(r'[0-9]{10}$');
bool KiemTraMaHoaDon (String maHD){
  return regex_HD_number.hasMatch(maHD);
}
bool KiemTraSDT (String SDT){
  return regex_SDT.hasMatch(SDT);
}
bool KiemTraMaDienThoai (String maDT){
  return regex_DT_number.hasMatch(maDT);
}


String date_String (DateTime date){
  return '${date.day}/${date.month}/${date.year} ';
}


