import 'package:flutter/material.dart';

class ScreenOfFiltering extends StatefulWidget {
  const ScreenOfFiltering({Key? key}) : super(key: key);

  @override
  _ScreenOfFilteringState createState() => _ScreenOfFilteringState();
}

class _ScreenOfFilteringState extends State<ScreenOfFiltering> {
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _nameOfPetForSearch = TextEditingController();
  TextEditingController _dateOfBirthOfPet = TextEditingController();
  bool circular = false;
  var itemsOfGender = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
    "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
    "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
    "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", // Değiştirilebilir
    "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
    "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
    "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
    "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
    "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce",];
  String dropdownvalue = "Ankara";
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text("Can Dostunu Ara"), // Sonradan kaldırılabilir veya farkli bir title eklenebilir.
      elevation: 10.0,

    ),
        body: Form(
          key: _globalkey,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              children: <Widget>[
              headerImageOfSearchScreen(),
                SizedBox(
                  height: 20,
                ),Text("Senin için bir Can dostu arayalım !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black54
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),typeOfPetTextFieldForSearch(),

                SizedBox(
                  height: 20,
                ),locationSearchForPetDropDownButtonField(),

                SizedBox(
                  height: 20,
                ),ageOfPetForSearchField(),

                InkWell(
                  onTap: () async {
                    setState(() {
                      circular = true;
                    });
                    if (_globalkey.currentState!.validate()) {
                      Map<String, String> data = {
                        "_nameOfPet": _nameOfPetForSearch.text,

                      };
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      print("Can Dostunu araya basıldı"); //Can Dostunu ara OnPressed
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      margin: const EdgeInsets.only(top:20),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: circular
                            ? CircularProgressIndicator()
                            : Text(
                          "Can Dostunu Ara",
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

  Widget typeOfPetTextFieldForSearch() {
    return TextFormField(
      controller: _nameOfPetForSearch ,
      validator: (value) {
        if (value!.isEmpty) return "Tür Boş Bırakılamaz !";

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
        labelText: "Can dostunun Türü",
        hintText: "Muhabbet Kuşu",
      ),
    );
  }

  Widget locationSearchForPetDropDownButtonField() {
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
          Icons.gps_not_fixed,
          color: Colors.blue,
        ),
        labelText: "Lokasyon",
        hintText: "Şehir",
      ),
    );
  }

  Widget ageOfPetForSearchField() {
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
        labelText: "Can dostunun yaşı",
        hintText: "Yaş",
      ),
    );
  }
}

Widget headerImageOfSearchScreen(){
  return Center(
    child: Stack(children: <Widget>[
      Image(image: AssetImage('assets/headerforsearch.jpg'),
        height: 160.0,
        width: double.infinity,
      ),
    ],
    ),
  );
}


