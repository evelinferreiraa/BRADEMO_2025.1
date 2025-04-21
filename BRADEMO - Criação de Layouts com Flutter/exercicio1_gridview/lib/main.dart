import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView with Star Wars',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'GridView with Star Wars',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: EdgeInsets.all(12),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _buildImageCard(
                'assets/images/ep1.jpg',
                'Episódio I: A Ameaça Fantasma',
                '1999',
              ),
              _buildImageCard(
                'assets/images/ep2.jpg',
                'Episódio II: Ataque dos Clones',
                '2002',
              ),
              _buildImageCard(
                'assets/images/ep3.jpg',
                'Episódio III: A Vingança dos Sith',
                '2005',
              ),
              _buildImageCard(
                'assets/images/ep4.jpg',
                'Episódio IV: Uma Nova Esperança ',
                '1977',
              ),
              _buildImageCard(
                'assets/images/ep5.jpg',
                'Episódio V: O Império Contra-Ataca ',
                '1980',
              ),
              _buildImageCard(
                'assets/images/ep6.jpg',
                'Episódio VI: O Retorno de Jedi',
                '1983',
              ),
              _buildImageCard(
                'assets/images/ep7.jpg',
                'Episódio VII: O Despertar da Força',
                '2015',
              ),
              _buildImageCard(
                'assets/images/ep8.jpg',
                'Episódio VIII: Os Últimos Jedi',
                '2017',
              ),
              _buildImageCard(
                'assets/images/ep9.jpg',
                'Episódio IX: A Ascensão Skywalker',
                '2019',
              ),
              _buildImageCard(
                'assets/images/hansolo.jpg',
                'Han Solo: Uma História Star Wars',
                '2018',
              ),
              _buildImageCard(
                'assets/images/rogueone.jpg',
                'Rogue One: Uma História Star Wars',
                '2016',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(String imagePath, String title, String subtitle) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(imagePath, fit: BoxFit.cover)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
