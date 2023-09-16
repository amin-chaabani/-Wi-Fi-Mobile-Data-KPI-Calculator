import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double downloadSpeed = 0;
  double uploadSpeed = 0;

  Future<double> performSpeedTest(String url) async {
    final startTime = DateTime.now();
    final response = await http.get(Uri.parse(url));
    final endTime = DateTime.now();
    final duration = endTime.difference(startTime).inMilliseconds.toDouble();
    final fileSize = response.bodyBytes.length /
        1024; // Taille du fichier téléchargé en kilo-octets
    final speed = fileSize /
        (duration /
            1000); // Vitesse de téléchargement en kilo-octets par seconde

    return speed;
  }

  Future<double> performDownloadSpeedTest() async {
    final url =
        'https://example.com/file-to-download'; // Remplacez par l'URL du fichier à télécharger pour le test
    return performSpeedTest(url);
  }

  Future<double> performUploadSpeedTest() async {
    final url =
        'https://example.com/upload-endpoint'; // Remplacez par l'URL de l'endpoint de téléchargement
    final fileBytes = List<int>.filled(1024 * 1024,
        1); // Crée un fichier de 1 Mo rempli de données arbitraires

    final startTime = DateTime.now();
    final response = await http.post(Uri.parse(url), body: fileBytes);
    final endTime = DateTime.now();
    final duration = endTime.difference(startTime).inMilliseconds.toDouble();
    final fileSize =
        fileBytes.length / 1024; // Taille du fichier téléchargé en kilo-octets
    final speed = fileSize /
        (duration /
            1000); // Vitesse de téléchargement en kilo-octets par seconde

    return speed;
  }

  void runDownloadSpeedTest() async {
    final speed = await performDownloadSpeedTest();
    setState(() {
      downloadSpeed = speed;
    });
  }

  void runUploadSpeedTest() async {
    final speed = await performUploadSpeedTest();
    setState(() {
      uploadSpeed = speed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Speed Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: runDownloadSpeedTest,
              child: const Text('Run Download Speed Test'),
            ),
            const SizedBox(height: 20),
            Text(
              'Download Speed: ${downloadSpeed.toStringAsFixed(2)} KB/s',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: runUploadSpeedTest,
              child: const Text('Run Upload Speed Test'),
            ),
            const SizedBox(height: 20),
            Text(
              'Upload Speed: ${uploadSpeed.toStringAsFixed(2)} KB/s',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
