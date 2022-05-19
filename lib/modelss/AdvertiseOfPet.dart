class AdvertiseOfPetModel{  //Listelenen ilanlarda kullanılmak için geçici olarak oluşturuldu sonradan değiştirilebilir.
  final int id;
  final String nameOfPet;
  final String typeOfPet;
  final String ageOfPet;
  final String urlImageOfPet;

  const AdvertiseOfPetModel({
    required this.id,
    required this.nameOfPet,
    required this.typeOfPet,
    required this.ageOfPet,
    required this.urlImageOfPet,
  });
}