import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenOfCreateAdvertisement extends StatefulWidget {
  ScreenOfCreateAdvertisement({Key? key}) : super(key: key);

  @override
  _ScreenOfCreateAdvertisementState createState() =>
      _ScreenOfCreateAdvertisementState();
}

class _ScreenOfCreateAdvertisementState
    extends State<ScreenOfCreateAdvertisement> {
  var itemsOfGender = ['Dişi', 'Erkek', 'Bilinmiyor'];
  String dropdownvalue = 'Bilinmiyor';
  bool circular = false;
  late PickedFile _imageFile;
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _nameOfPet = TextEditingController();
  TextEditingController _contactNumberForPetField = TextEditingController();
  TextEditingController _dateOfBirthOfPet = TextEditingController();
  TextEditingController _genderOfPet = TextEditingController();
  TextEditingController _address = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Can Dostum"),
      ),
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            addImageOfPet(),
            SizedBox(
              height: 20,
            ),
            nameofPetTextField(),
            SizedBox(
              height: 20,
            ),
            genderOfPetDropDownButtonField(),
            SizedBox(
              height: 20,
            ),
            dateOfBirthOfPetField(),
            SizedBox(
              height: 20,
            ),
            contactNumberForPetField(),
            SizedBox(
              height: 20,
            ),
            addressTextField(),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  circular = true;
                });
                if (_globalkey.currentState!.validate()) {
                  Map<String, String> data = {
                    "_nameOfPet": _nameOfPet.text,
                    "_contactNumberForPetField": _contactNumberForPetField.text,
                    "_dateOfBirthOfPet": _dateOfBirthOfPet.text,
                    "_genderOfPet": _genderOfPet.text,
                    "_address": _address.text,
                  };
                }
              },
              child: GestureDetector(
                onTap: () {
                  print("İlanı Yayınlaya Basıldı"); //İlanı Yayınla OnPressed
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "İlanı Yayınla",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addImageOfPet() {
    return Center(
      child: Stack(children: <Widget>[
        Image(
          image: AssetImage('assets/dog_silhouette.png'),
          height: 200.0,
          width: double.infinity,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheetForAskWayOfPicture()),
              );
            },
            child: Icon(
              Icons.add_a_photo,
              color: Colors.blue,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheetForAskWayOfPicture() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Can dostunun fotoğrafını ekle",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  Widget nameofPetTextField() {
    return TextFormField(
      controller: _nameOfPet,
      validator: (value) {
        if (value!.isEmpty) return "Ad Boş Bırakılamaz !";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.pets,
          color: Colors.blue,
        ),
        labelText: "Can dostunun adı",
        helperText: "Ad kısmı boş bırakılamaz",
        hintText: "Boncuk",
      ),
    );
  }

  Widget dateOfBirthOfPetField() {
    return TextFormField(
      controller: _dateOfBirthOfPet,
      validator: (value) {
        if (value!.isEmpty) return "Doğum Tarihi Boş Olamaz !";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.blue,
        ),
        labelText: "Yaş",
        helperText: "Yaş bilgisi zorunludur",
        hintText: "Rakam Giriniz",
      ),
    );
  }

  Widget contactNumberForPetField() {
    return TextFormField(
      controller: _dateOfBirthOfPet,
      validator: (value) {
        if (value!.isEmpty) return "İletişim Numarası Boş Bırakılamaz !";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.calendar_today,
          color: Colors.blue,
        ),
        labelText: "İletişim Numarası",
        helperText: "Bu alan doldurulmalıdır",
        hintText: "05384513737",
      ),
    );
  }

  Widget genderOfPetField() {
    return TextFormField(
      controller: _genderOfPet,
      validator: (value) {
        if (value!.isEmpty) return "Cinsiyet Boş bırakılamaz";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.transgender,
          color: Colors.blue,
        ),
        labelText: "Cinsiyet",
        helperText: "Cinsiyet bilgisi verilmelidir",
        hintText: "Bilinmiyor",
      ),
    );
  }

  Widget genderOfPetDropDownButtonField() {
    return DropdownButtonFormField(
      items: itemsOfGender.map((itemsname) {
        return DropdownMenuItem(
          value: itemsname,
          child: Text(itemsname),
        );
      }).toList(),
      onChanged: (String? newValue) {},
      value: dropdownvalue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.transgender,
          color: Colors.blue,
        ),
        labelText: "Cinsiyet",
        helperText: "Cinsiyet bilgisi verilmelidir",
        hintText: "Bilinmiyor",
      ),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      controller: _address,
      validator: (value) {
        if (value!.isEmpty) return "Adres boş bırakılamaz !";

        return null;
      },
      maxLines: 6,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.add_location,
          color: Colors.blue,
        ),
        labelText: "Adres",
        helperText: "Can Dostunu yeni sahibiyle nerede buluşturacaksın ?",
        hintText: "Yücetepe, Akdeniz Cd. No:31, 06570 Çankaya/Ankara",
      ),
    );
  }
}
