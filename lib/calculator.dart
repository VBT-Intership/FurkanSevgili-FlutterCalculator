
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
    List<String> nums=str.split(new RegExp('([+,*,/,-])'));
    List<String> oprs=str.split(new RegExp('([0-9,.]?)'));

    //Listelerde oluşan boşluklar silinir.
    oprs.removeWhere((value) => value == '');
    nums.removeWhere((value) => value == '-');
    while (nums.length>1) {
    //Çarpma ve bölme için işlem önceliği
    int a;
    switch(oprs.contains("*")||oprs.contains("/")){
      case true:
        a=oprs.indexWhere((element) => element=="*"||element=="/");
        break;
      default:
        a=0;
        break;
    }

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
