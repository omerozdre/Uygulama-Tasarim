import 'package:flutter/material.dart';
import 'package:odev6_getirr/data/entity/kategoriler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Kategoriler>> kategorileriYukle() async{
    var kategorilerListesi = <Kategoriler>[];
    var k1 = Kategoriler(id: 1, ad: "Atıştırmalık", resim: "atistirmalik.png",);
    var k2 = Kategoriler(id: 2, ad: "Süt Ürünleri", resim: "suturun (1).png");
    var k3 = Kategoriler(id: 3, ad: "İçecek", resim: "suicecek (1).png");
    var k4 = Kategoriler(id: 4, ad: "Dondurma", resim: "dondurma.png");
    var k5 = Kategoriler(id: 5, ad: "Evcil Hayvan", resim: "evcilhayvan.png");
    var k6 = Kategoriler(id: 6, ad: "Fırından", resim: "fırından.png");
    var k7 = Kategoriler(id: 7, ad: "Süper İkili", resim: "superikili (1).jpeg");
    var k8 = Kategoriler(id: 8, ad: "Kahvaltılık", resim: "kahvaltilik.png");
    var k9 = Kategoriler(id: 9, ad: "Kazandıranlar", resim: "kazandıranlar.jpeg");
    var k10 = Kategoriler(id: 10, ad: "Kişisel Bakım", resim: "kisiselbakim.png");
    var k11 = Kategoriler(id: 11, ad: "Meyve Sebze", resim: "meyvesebze.png");
    var k12 = Kategoriler(id: 12, ad: "Ev Bakım", resim: "evbakim.png");
    var k13 = Kategoriler(id: 13, ad: "Bebek", resim: "bebek.png");
    var k14 = Kategoriler(id: 14, ad: "Fit Form", resim: "fitform.png");
    var k15 = Kategoriler(id: 15, ad: "Ev Yaşam", resim: "evyasam.png");
    var k16 = Kategoriler(id: 16, ad: "Çiçekci", resim: "cicekci.jpeg");

    kategorilerListesi.add(k1);
    kategorilerListesi.add(k2);
    kategorilerListesi.add(k3);
    kategorilerListesi.add(k4);
    kategorilerListesi.add(k5);
    kategorilerListesi.add(k6);
    kategorilerListesi.add(k7);
    kategorilerListesi.add(k8);
    kategorilerListesi.add(k9);
    kategorilerListesi.add(k10);
    kategorilerListesi.add(k11);
    kategorilerListesi.add(k12);
    kategorilerListesi.add(k13);
    kategorilerListesi.add(k14);
    kategorilerListesi.add(k15);
    kategorilerListesi.add(k16);

    return kategorilerListesi;
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {//güncelleme
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("getir",style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          fontFamily: "uplood"
        ),
        ),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           SizedBox(width: 311,height: 50,
             child: Container(color: Colors.white60,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Denizli Ev,1111 Sk. No:11 Denizli",style: TextStyle(fontSize: 18),),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
             ),
           ),
             SizedBox(width: 100.4,height: 50,
               child: Container(
                 color: Colors.amber,
                 child: const Padding(
                   padding: EdgeInsets.all(4.0),
                   child: Column(
                     children: [
                       Text("TVS"),
                       Text("30+dk")
                     ],
                   ),
                 ),
               ),
             ),
           ],
          ),
          Container(
            width: double.infinity, // Genişliği tam ekran yapar
            height: 210,// yükseklik
            child: PageView(//kaydırmalı bir widget
              children: <Widget>[// içinde göstermek istediğiniz widget'ların bir listesi.
                Image.asset(
                "resimler/getir-banner.jpeg",
                fit: BoxFit.fill, // Resmi container'ı tamamen dolduracak şekilde sığdırır
              ),
                Image.asset(
                  "resimler/banner2.jpeg",
                  fit: BoxFit.fill, // Resmi container'ı tamamen dolduracak şekilde sığdırır
                ),
                Image.asset(
              "resimler/resim.png",
              fit: BoxFit.fill, // Resmi container'ı tamamen dolduracak şekilde sığdırır
            ),
            ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Kategoriler>>(
              future: kategorileriYukle(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var kategorilerListesi = snapshot.data;
                  return GridView.builder(
                    itemCount: kategorilerListesi!.length,//12 defa
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1 / 1),
                    itemBuilder: (context , indeks){
                      var kategori = kategorilerListesi[indeks];
                      return  Column(// bu şekilde yapma sebebimiz isimlerin cardın altında yer alması
                        children: [
                          Card(
                            child: Image.asset("resimler/${kategori.resim}", width: 100, height: 70),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              kategori.ad,
                              style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }else{
                  return const Center();
                }
              },
            ),
          ),
        ],
     ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Arama',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('resimler/group.png',width: 60,height: 30,),
            label: 'Menü',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Kampanyalar',  // Yeni ikon ve etiket
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,//tıklanan öğenin indeksini günceller ve seçili öğenin durumunu değiştirir.
      ),
     );
  }
}
