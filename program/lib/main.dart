import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulama());
}

// Ana uygulama widget'ı
class Uygulama extends StatelessWidget {
  const Uygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Hesaplayıcı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMIHesaplayici(),
    );
  }
}

// BMI hesaplayıcı ana ekran widget'ı
class BMIHesaplayici extends StatefulWidget {
  const BMIHesaplayici({super.key});

  @override
  _BMIHesaplayiciDurumu createState() => _BMIHesaplayiciDurumu();
}

// BMI hesaplayıcı başlangıç durumu
class _BMIHesaplayiciDurumu extends State<BMIHesaplayici> {
  // Kullanıcı boy, ağırlık ve yaş verileri
  double boy = 195;
  double agirlik = 83;
  int yas = 22;
  String cinsiyet = "Erkek";

  // BMI hesaplama fonksiyonu
  double hesaplaBMI() {
    return agirlik / ((boy / 100) * (boy / 100));
  }

  // BMI değerine göre kategori belirleme
  String getBMIKategori(double bmi) {
    if (bmi < 18.5) {
      return 'Zayıf';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Fazla Kilolu';
    } else {
      return 'Obez';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI HESAPLAYICI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cinsiyet seçim widget'ı
          Expanded(
            child: Row(
              children: [
                // Erkek seçimi için
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cinsiyet = "Erkek";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: cinsiyet == "Erkek" ? Colors.blueAccent : Color(0xFF121B24),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80.0, color: Colors.white),
                          SizedBox(height: 10.0),
                          Text(
                            'Erkek',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Kadın seçimi için
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        cinsiyet = "Kadın";
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: cinsiyet == "Kadın" ? Colors.pinkAccent : Color(0xFF121B24),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80.0, color: Colors.white),
                          SizedBox(height: 10.0),
                          Text(
                            'Kadın',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Boy seçimi için
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF121B24),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BOY',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        boy.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white, fontSize: 50.0),
                      ),
                      const SizedBox(width: 5.0),
                      const Text(
                        'cm',
                        style: TextStyle(color: Colors.white, fontSize: 14.0), // Küçük punto
                      ),
                    ],
                  ),
                  Slider(
                    value: boy,
                    min: 100.0,
                    max: 220.0,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white24,
                    thumbColor: Colors.redAccent,
                    onChanged: (double newValue) {
                      setState(() {
                        boy = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // Ağırlık ve Yaş seçimi için iki genişletilmiş widget
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF121B24),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'KİLO',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        Text(
                          agirlik.toStringAsFixed(0),
                          style: const TextStyle(color: Colors.white, fontSize: 40.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  if (agirlik > 1) agirlik--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  agirlik++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF121B24),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'YAŞ',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        Text(
                          yas.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 40.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  if (yas > 1) yas--;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  yas++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Hesapla butonu
          Container(
            width: double.infinity,
            height: 60.0,
            margin: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              onPressed: () {
                double bmi = hesaplaBMI();
                String kategori = getBMIKategori(bmi);
                String geriBildirim = getBMIDescript(kategori);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMISonucEkrani(
                      bmi: bmi,
                      kategori: kategori,
                      geriBildirim: geriBildirim,
                    ),
                  ),
                );
              },
              child: const Text(
                'HESAPLA',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BMISonucEkrani extends StatelessWidget {
  final double bmi;
  final String kategori;
  final String geriBildirim;

  // Constructor
  const BMISonucEkrani({
    required this.bmi,
    required this.kategori,
    required this.geriBildirim,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI HESAPLAYICI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BMI sonucu başlığı
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'BMI Değeri',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 62.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 100.0),

          // BMI kategori bilgisi
          Text(
            kategori,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 100.0),

          // Hesaplanan BMI değeri
          Text(
            bmi.toStringAsFixed(1),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 100.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 100.0),

          // Geri bildirim mesajı
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              geriBildirim,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 24.0,
              ),
            ),
          ),
          const Spacer(),

          // Yeniden Hesapla butonu
          Container(
            width: double.infinity,
            height: 60.0,
            margin: const EdgeInsets.only(bottom: 0.0), // Alt boşluk
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'YENİDEN HESAPLA',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// BMI kategorisine göre açıklama döndüren fonksiyon
String getBMIDescript(String kategori) {
  switch (kategori) {
    case 'Zayıf':
      return 'Düşük bir vücut ağırlığınız var. Kilo almalısınız!.';
    case 'Normal':
      return 'Normal bir vücut ağırlığınız var. Aferin!';
    case 'Fazla Kilolu':
      return 'Fazla kilolu bir vücut ağırlığınız var. Dikkat edin!';
    case 'Obez':
      return 'Çok aşırı bir vücut ağırlığınız var. Obezsiniz.';
    default:
      return 'Bilinmeyen bir kategori.';
  }
}
