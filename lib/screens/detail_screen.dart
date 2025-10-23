import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class DetailScreen extends StatelessWidget {

  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Detail Header
          Stack(
            children: [
              // Image utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol back custom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32,
                ),    
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100]?.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                      icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ), 
            ],
          ),
          // Detail Info 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                // Info atas (nama candi dan tombol favorit)
                Row(
                  children: [
                    Text(candi.name),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                  ],
                )
                // Info tengah (lokasi, dibangun, tipe)
                // Info bawah (deskripsi)
              ],
            ),
          )
        ],
      ),
    );
  }
}