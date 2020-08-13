import 'home_page.dart';



import 'dart:convert';
import 'dart:io';

class Calculator{
  String topla(List<String> nums, int a){
    return (double.parse(nums[a])+double.parse(nums[a+1])).toString();
  }
  String carp(List<String> nums,int a){
    return (double.parse(nums[a])*double.parse(nums[a+1])).toString();
  }
  String cikar(List<String> nums, int a){
    return (double.parse(nums[a])-double.parse(nums[a+1])).toString();
  }
  String bol(List<String> nums, int a){
    return(double.parse(nums[a])/double.parse(nums[a+1])).toString();
  }
  double hesapla(String str){
    //Sayılar ve operatörler birbirinden ayrılır.
    List<String> nums=str.split(new RegExp('([+,*,/,^])'));
    List<String> oprs=str.split(new RegExp('([0-9,.,-]?)'));

    //Listelerde oluşan boşluklar silinir.
    oprs.removeWhere((value) => value == '');
    nums.removeWhere((value) => value == '');
    while (nums.length>1) {
    //Çarpma ve bölme için işlem önceliği
    int a;
    if (oprs.contains('*')){
      a=oprs.indexOf('*');
      }
    else if(oprs.contains('/'))
      a=oprs.indexOf('/');
    else
      a=0;
    //Secilen operatöre göre sayılar üzerinde işlem yapılır.
    switch(oprs[a]){
      case '*':
        nums[a]=carp(nums, a);//İşlem yapılıp liste üzerinde 1. sayının yerine yazılır
        nums.removeAt(a+1);//2. sayı silinir
        oprs.removeAt(a);//kullanılan operatör silinir
        break;
      case '/':
        nums[a]=bol(nums,a);
        nums.removeAt(a+1);
        oprs.removeAt(a);
        break;
      case '+':
        nums[a]=topla(nums, a);
        nums.removeAt(a+1);
        oprs.removeAt(a);
        break;
      case '-':
        nums[a]=cikar(nums, a);
        nums.removeAt(a+1);
        oprs.removeAt(a);
        break;
    }
  }
  return double.parse(nums[0]);
  }
}
/*
main(List<String> args) {
  Calculator calc=new Calculator();
  print("Yapmak istediğiniz matematiksel işlemi giriniz.\nÖrn: 3+10/2 \n(Çıkmak için 'q' karakteri giriniz.)\nNot: Parantez ve üslü ifade tanınmaz.");
  while(calc.running)
  {
    String str=stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
    if (str.contains('q')) {//girilen string q içeriyorsa pprogramı durdur.
      calc.running=false;
      break;
    }
    try {
    print(calc.hesapla(str));
    } catch (e) {
      print("Geçersiz Karakter!");
      print(e);
    }
    print("Yapmak istediğiniz matematiksel işlemi giriniz.");
  }
}*/