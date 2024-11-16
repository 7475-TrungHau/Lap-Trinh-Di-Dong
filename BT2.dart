import 'dart:io';
import 'dart:math';

void giaiPhuongTrinhBacHai(double a, double b, double c) {
  if (a == 0) {
    if (b == 0) {
      if (c == 0) {
        print("Phương trình vô số nghiệm.");
      } else {
        print("Phương trình vô nghiệm.");
      }
    } else {
      double x = -c / b;
      print("Phương trình có nghiệm duy nhất: x = $x");
    }
  } else {
    double delta = b * b - 4 * a * c;
    if (delta < 0) {
      print("Phương trình vô nghiệm.");
    } else if (delta == 0) {
      double x = -b / (2 * a);
      print("Phương trình có nghiệm kép: x = $x");
    } else {
      double x1 = (-b + sqrt(delta)) / (2 * a);
      double x2 = (-b - sqrt(delta)) / (2 * a);
      print("Phương trình có hai nghiệm phân biệt: x1 = $x1, x2 = $x2");
    }
  }
}

void main (){

  double heSoA =0;
  double heSoB = 0;
  double heSoC = 0;
  double danhDau = 0; // 0: ko loi, 1 loi
  int dem =0; // dem vong lap
  do {
    danhDau = 0;
     dem = 0;
    stdout.write ("Nhap he so a (a != 0): ");
      String inputA = stdin.readLineSync() ?? '';
      
       heSoA = double.tryParse(inputA) ?? 0;

      stdout.write ("Nhap he so b : ");
      String inputB = stdin.readLineSync() ?? '';
       danhDau = double.tryParse(inputB) ?? 1 ;
       heSoB = double.tryParse(inputB) ?? 0;
      

      stdout.write ("Nhap he so c: ");
      String inputC = stdin.readLineSync() ?? '';
      danhDau = double.tryParse(inputC) ?? 1 ;
       heSoC = double.tryParse(inputC) ?? 0 ;
      if(heSoA == 0 || danhDau ==1 ){
        print ("Loi. Nhap lai");
      }
      dem ++;
      if(dem >= 2){
        print ("Sai qua 3 lan => Thoat");
        break;
      }

        
  } while (heSoA == 0 || danhDau == 1);
  if(dem <= 2){
    giaiPhuongTrinhBacHai(heSoA, heSoB, heSoC);
  }else{
    print("-----------------------------------------");
  }

  
  
}