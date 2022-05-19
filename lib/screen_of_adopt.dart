import 'package:flutter/material.dart';
import 'package:untitled/screen_of_filtering.dart';
import './modelss/AdvertiseOfPet.dart';
class AdoptScreen extends StatefulWidget {
  const AdoptScreen({Key? key}) : super(key: key);

  @override
  _AdoptScreenState createState() => _AdoptScreenState();
}

class _AdoptScreenState extends State<AdoptScreen> {
  List<AdvertiseOfPetModel> adverTiseOfPetList = [];

  @override
  void initState() {

    super.initState();
    //DatabaseReference referenceData vsvsvs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sahipsiz Can Dostları"), // Sonradan kaldırılabilir veya farkli bir title eklenebilir.
        elevation: 5.0,
        actions: [
          IconButton(icon: Icon(Icons.search_sharp), onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ScreenOfFiltering())); },),
        ],
      ),
      body: Column(
        children: <Widget>[
         /* Expanded(child: ListView.builder(                      // yorum satırı açılış
              //itemCount: advertiseOfPet.lenght,
              itemBuilder: (context,index){
                final advertiseOfPet = adverTiseOfPetList[index];   // gösterilecek ilan henüz yok dolayısyıla hata verebilir. deneme şansım olmadı
                return buildAdvertiseOfPet(advertiseOfPet);         // gösterilecek elemanlar eklendğinde yorum satırları kaldırılıp denenmeli
              },
          ),
         ),*/                                              //yorum satırı kapanış
        ],
      ),
    );
  }

  
  Widget buildAdvertiseOfPet( String urlImageOfPet,String nameOfPet,String typeOfPet,String ageOfPet)=>ListTile(                            //Listedeki İlanın gösterim şablonu
    leading: Image.network(urlImageOfPet,fit: BoxFit.cover,width: 50,height: 50,),
      title: Text(nameOfPet),
      subtitle: Text(typeOfPet + " - Age:" + ageOfPet ),
  );
}
