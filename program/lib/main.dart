import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Uygulamanın temel widget'ı olan MyApp sınıfı
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Hesaplayıcı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculator(),
    );
  }
}

// BMI hesaplayıcı ekranını oluşturan kısım
class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

// BMI hesaplayıcı ekranının başlangıç hali
class _BMICalculatorState extends State<BMICalculator> {
  double height = 195; // Kullanıcının boyu
  double weight = 83;  // Kullanıcının ağırlığı
  int age = 22;        // Kullanıcının yaşı
  String gender = "Erkek"; // Kullanıcının cinsiyeti

  // BMI hesaplama fonksiyonu
  double calculateBMI() {
    return weight / ((height / 100) * (height / 100));
  }

  // BMI kategorisini belirleme
  String getBMICategory(double bmi) {
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

  // BMI açıklamasını döndüren kısım
  String getBMIDescription(String category) {
    switch (category) {
      case 'Zayıf':
        return 'Düşük bir vücut ağırlığınız var. Kilo almalısınız!.';
      case 'Normal':
        return 'Normal bir vücut ağırlığınız var. Aferin!';
      case 'Fazla Kilolu':
        return 'Fazla kilolu bir vücut ağırlığınız var. Dikkat edin!';
      case 'Obez':
        return 'Çok aşırı bir vücut ağırlığınız var. Obezsiniz.';
      default:
        return '';
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
        backgroundColor: const Color(0xFF0A0E21), // Koyu mavi arka plan
      ),
      backgroundColor: const Color(0xFF0A0E21), // Koyu mavi arka plan
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cinsiyet seçimi
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "Erkek"; // Erkek seçildiğinde cinsiyet değişimi
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: gender == "Erkek" ? Colors.blueGrey[800] : Colors.grey[800], // Seçili cinsiyete göre arka plan rengi
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text(
                            'Erkek',
                            style: TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "Kadın"; // Kadın seçildiğinde cinsiyet değişimi
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: gender == "Kadın" ? Colors.blueGrey[800] : Colors.grey[800], // Seçili cinsiyete göre arka plan rengi
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text(
                            'Kadın',
                            style: TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Boy ölçme kısmı
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Koyu gri arka plan
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Boy',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white, fontSize: 50.0),
                      ),
                      const Text(
                        ' cm',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100.0,
                    max: 250.0,
                    activeColor: Colors.white, // Slider çubuğunun aktif rengi
                    thumbColor: Colors.redAccent, // Slider topunun rengi
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue; // Boy değeri değişimi
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Ağırlık ölçme kısmı
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Koyu gri arka plan
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ağırlık',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        weight.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white, fontSize: 50.0),
                      ),
                      const Text(
                        ' kg',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                  Slider(
                    value: weight,
                    min: 30.0,
                    max: 150.0,
                    activeColor: Colors.white, // Slider çubuğunun rengi
                    thumbColor: Colors.redAccent, // Slider topunun rengi
                    onChanged: (double newValue) {
                      setState(() {
                        weight = newValue; // Ağırlık değeri değişimi
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Hesapla butonu
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF2A6D), // Butonun rengi
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(vertical: 24.0),
          ),
          onPressed: () {
            double bmi = calculateBMI(); // BMI hesaplama
            String category = getBMICategory(bmi); // BMI kategorisi alma

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BMIResultScreen(
                  bmi: bmi,
                  category: category,
                  description: getBMIDescription(category), // BMI açıklaması alma
                ),
              ),
            );
          },
          child: const Text(
            'Hesapla',
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}

// BMI sonuç ekranı
class BMIResultScreen extends StatelessWidget {
  final double bmi; // BMI değeri
  final String category; // BMI kategorisi
  final String description; // BMI açıklaması

  const BMIResultScreen({
    super.key,
    required this.bmi,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Hesaplayıcı'),
        backgroundColor: const Color(0xFF0A0E21), // Koyu mavi arka plan
      ),
      backgroundColor: const Color(0xFF0A0E21), // Koyu mavi arka plan
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BMI Değeri',
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[800], // Koyu gri arka plan
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                    category,
                    style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.white, fontSize: 48.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),

      //Yeniden Hesapla butonu
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF2A6D),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(vertical: 24.0),
          ),
          onPressed: () {
            Navigator.pop(context); // Önceki ekrana dönme
          },
          child: const Text(
            'Yeniden Hesapla',
            style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
      ),
    );
  }
}
