import 'dart:math';

import 'package:flutter/material.dart';

class FoodModel {
  final String categoryName;
  final String name;
  final Image image;
  final String explanation;
  final double price;
  final bool discount;
  bool isFavorite;

  // ignore: non_constant_identifier_names
  FoodModel.FoodItem({
    required this.categoryName,
    required this.name,
    required this.image,
    required this.explanation,
    required this.price,
    required this.discount,
    this.isFavorite = false,
  });
}

Random random = Random();

List<FoodModel> foodData = [
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Brokoli Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/brokoli.png'),
    explanation:
        "Sağlıklı ve lezzetli brokoli çorbası, 300gr ve yanında ekmek ile.",
    price: 49.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Domates Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/domates.png'),
    explanation:
        "Taze domateslerle hazırlanmış çorba, 300gr ve yanında ekmek ile.",
    price: 39.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Ezogelin Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/ezogelin.png'),
    explanation:
        "Klasik ve doyurucu ezogelin çorbası, 300gr ve yanında ekmek ile.",
    price: 44.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Mercimek Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/mercimek.png'),
    explanation:
        "Besleyici ve lezzetli mercimek çorbası, 300gr ve yanında ekmek ile.",
    price: 34.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Yayla Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/yayla.png'),
    explanation:
        "Ferahlatıcı ve hafif yayla çorbası, 300gr ve yanında ekmek ile.",
    price: 39.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Çorba",
    name: "Tavuk Çorbası",
    image: Image.asset('assets/img/menu/baslangiclar/tavuk.png'),
    explanation: "Protein dolu tavuk çorbası, 300gr ve yanında ekmek ile.",
    price: 59.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Salata",
    name: "Akdeniz Salata",
    image: Image.asset('assets/img/menu/salatalar/akdeniz_salata.png'),
    explanation: "Mevsim yeşillikleri, beyaz peynir, zeytin.",
    price: 89.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Salata",
    name: "Caşnigir Salata",
    image: Image.asset('assets/img/menu/salatalar/caşnigir_salata.png'),
    explanation:
        "Marul, havuç, kırmızılahana, turşu, domates, roka, maydanoz, salatalık, nar ekşisi.",
    price: 84.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Salata",
    name: "Falafel Salata",
    image: Image.asset('assets/img/menu/salatalar/falafel_salata.png'),
    explanation: "Mevsim yeşillikleri, falafel toplar.",
    price: 94.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Salata",
    name: "Mevsim Salata",
    image: Image.asset('assets/img/menu/salatalar/mevsim_salata.png'),
    explanation: "Mevsim yeşillikleri, özel soslar.",
    price: 59.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Salata",
    name: "Ton Balıklı Salata",
    image: Image.asset('assets/img/menu/salatalar/ton_balıklı_salata.png'),
    explanation: "Mevsim yeşillikleri, ton balığı.",
    price: 109.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Margarita",
    image: Image.asset('assets/img/menu/pizzalar/margarita.jpg'),
    explanation: "Özel Sezar Sos, Mozzarella Peyniri",
    price: 285.99,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Sucukbol",
    image: Image.asset('assets/img/menu/pizzalar/sucukbol.jpg'),
    explanation: "Özel Sezar Sos, Mozzarella Peyniri, Dilim Sucuk",
    price: 305.49,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Etibol",
    image: Image.asset('assets/img/menu/pizzalar/etibol.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Jambon, Sosis, Küp Sucuk, Pastırma, Pepperoni, Soğan",
    price: 335.99,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Karışık",
    image: Image.asset('assets/img/menu/pizzalar/karışık.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Küp Sucuk, Sosis, Mantar, Mısır, Siyah Zeytin",
    price: 315.49,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Parti",
    image: Image.asset('assets/img/menu/pizzalar/parti.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Sosis, Mısır, Siyah Zeytin",
    price: 305.99,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Akdeniz",
    image: Image.asset('assets/img/menu/pizzalar/akdeniz.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Beyaz Peynir, Mantar, Siyah Zeytin, Yeşil Biber, Domates, Kekik",
    price: 315.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Kavurmalı",
    image: Image.asset('assets/img/menu/pizzalar/kavurmali.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Kavurma, Yeşil Biber, Közlenmiş Kırmızı Biber, Soğan",
    price: 335.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Ton Balıklı",
    image: Image.asset('assets/img/menu/pizzalar/ton_balikli.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Ton Balığı, Siyah Zeytin, Domates, Mısır, Soğan",
    price: 335.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Piknik",
    image: Image.asset('assets/img/menu/pizzalar/piknik.jpg'),
    explanation: "Özel Sezar Sos, Mozzarella Peyniri, Jambon, Mantar",
    price: 285.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Pepperonni",
    image: Image.asset('assets/img/menu/pizzalar/pepperoni.jpg'),
    explanation: "Özel Sezar Sos, Mozzarella Peyniri, Pepperoni",
    price: 305.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Sarımsaklı Sucukbol",
    image: Image.asset('assets/img/menu/pizzalar/sarimsak_soslu_sucukbol.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Sarımsak Sos, Dilim Sucuk",
    price: 305.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "İtalyan",
    image: Image.asset('assets/img/menu/pizzalar/italyan.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Küp Sucuk, Beyaz Peynir, Közlenmiş Kırmızı Biber, Siyah Zeytin, Mantar",
    price: 315.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Acı Tavukbol",
    image: Image.asset('assets/img/menu/pizzalar/aci_tavukbol.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Özel Baharatlı Fırınlanmış Tavuk, Ekstra Tavuk, Közlenmiş Kırmızı Biber, Jalapeno Acı Biber",
    price: 325.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Süper Sezar",
    image: Image.asset('assets/img/menu/pizzalar/super_sezar.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Küp Sucuk, Pepperoni, Sosis, Mantar, Siyah Zeytin, Soğan, Yeşil Biber",
    price: 325.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Karışıkbol",
    image: Image.asset('assets/img/menu/pizzalar/karisikbol.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Sucuk Küp, Sosis, Jambon, Mantar, Mısır, Yeşil Biber, Siyah Zeytin, Parmesan, Baharat Karışımı",
    price: 325.99,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Pizza",
    name: "Parti",
    image: Image.asset('assets/img/menu/pizzalar/parti.jpg'),
    explanation:
        "Özel Sezar Sos, Mozzarella Peyniri, Sosis, Mısır, Siyah Zeytin",
    price: 305.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Burger",
    name: "Bufolo Burger",
    image: Image.asset('assets/img/menu/burgerler/bufolo_burger.png'),
    explanation:
        "150 gr. hamburger köftesi, cheddar peyniri, acılı Smash sos, dilimlenmiş kornişon turşu.",
    price: 89.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Burger",
    name: "Cheese Burger",
    image: Image.asset('assets/img/menu/burgerler/cheese_burger.png'),
    explanation:
        "150 gr. hamburger köftesi, Amerikan cheddar peyniri, dilimlenmiş kornişon turşu.",
    price: 99.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Burger",
    name: "Classic Burger",
    image: Image.asset('assets/img/menu/burgerler/classic_burger.png'),
    explanation:
        "150 gr. hamburger köftesi, smash sos, dilimlenmiş kornişon turşu.",
    price: 79.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Burger",
    name: "Mexico Burger",
    image: Image.asset('assets/img/menu/burgerler/mexico_burger.png'),
    explanation:
        "150 gr. hamburger köftesi, acı jalapeno biberleri, salsa sos, cheddar peyniri.",
    price: 119.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "İçecek",
    name: "Kola",
    image: Image.asset('assets/img/menu/içecekler/cola.png'),
    explanation: "Soğuk ve ferahlatıcı kola.",
    price: 14.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "İçecek",
    name: "Ayran",
    image: Image.asset('assets/img/menu/içecekler/ayran.png'),
    explanation: "Doğal ve serinletici ayran.",
    price: 9.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "İçecek",
    name: "Fanta",
    image: Image.asset('assets/img/menu/içecekler/fanta.png'),
    explanation: "Soğuk ve ferahlatıcı fanta.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "İçecek",
    name: "Sprite",
    image: Image.asset('assets/img/menu/içecekler/sprite.png'),
    explanation: "Soğuk ve ferahlatıcı fanta.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Tatlı",
    name: "Trileçe",
    image: Image.asset(
      'assets/img/menu/tatlılar/trileçe.png',
    ),
    explanation:
        "Yumuşacık keki ve hafif sütlü şerbetiyle Balkan mutfağının en lezzetli tatlılarından biri.",
    price: 59.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Tatlı",
    name: "Profiterol",
    image: Image.asset(
      'assets/img/menu/tatlılar/profiterol.png',
    ),
    explanation:
        "İçi krema dolu hamur topları ve üzeri çikolata sosuyla kaplı nefis bir tatlı.",
    price: 49.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Tatlı",
    name: "Mag",
    image: Image.asset(
      'assets/img/menu/tatlılar/mag.png',
    ),
    explanation:
        "Kakaolu kek parçaları, krema ve meyve sosuyla hazırlanan hafif bir tatlı.",
    price: 74.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Tatlı",
    name: "Kıbrıs Tatlısı",
    image: Image.asset(
      'assets/img/menu/tatlılar/kıbrıs.png',
    ),
    explanation:
        "İrmik ve cevizle hazırlanan keki, üzerindeki kreması ve Hindistan cevizi ile mükemmel bir uyum.",
    price: 84.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Sos",
    name: "Ketçap",
    image: Image.asset('assets/img/menu/soslar/ketçap.jpg'),
    explanation: "",
    price: 5.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Sos",
    name: "Mayonez",
    image: Image.asset('assets/img/menu/soslar/mayonez.jpg'),
    explanation: "",
    price: 5.99,
    discount: false,
  ),
  FoodModel.FoodItem(
    categoryName: "Sos",
    name: "Acı Sos",
    image: Image.asset('assets/img/menu/soslar/aci_sos.jpg'),
    explanation: "",
    price: 20.49,
    discount: true,
  ),
  FoodModel.FoodItem(
    categoryName: "Ana Yemek",
    name: "Bezelye",
    image: Image.asset(
      'assets/img/menu/ana_yemekler/bezelye.png',
    ),
    explanation:
        "Taze bezelye ve havuç ile zenginleştirilmiş nefis bir zeytinyağlı.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ana Yemek",
    name: "Karnıyarık",
    image: Image.asset(
      'assets/img/menu/ana_yemekler/karnıyarık.png',
    ),
    explanation:
        "Kıymalı harç ile doldurulmuş, fırında pişmiş patlıcan yemeği.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ana Yemek",
    name: "Izgara Köfte & Pirinç Pilavı",
    image: Image.asset(
      'assets/img/menu/ana_yemekler/kofte.png',
    ),
    explanation:
        "Izgara köfte, yanında tereyağlı pirinç pilavı ile servis edilir.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ana Yemek",
    name: "Kuru Fasulye",
    image: Image.asset(
      'assets/img/menu/ana_yemekler/kuru.png',
    ),
    explanation: "Geleneksel usulde pişirilmiş nefis kuru fasulye yemeği.",
    price: 19.99,
    discount: random.nextBool(),
  ),
  FoodModel.FoodItem(
    categoryName: "Ana Yemek",
    name: "Makarna",
    image: Image.asset(
      'assets/img/menu/ana_yemekler/makarna.png',
    ),
    explanation: "Taze sos ile lezzetlendirilmiş klasik makarna.",
    price: 19.99,
    discount: random.nextBool(),
  ),
];
