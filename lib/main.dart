import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1 Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String username = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi Sign In
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  // TODO: 6. IMplementasi fungsi Sign Out
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // TODO: 2 Buat bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment:AlignmentGeometry.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200-50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(
                            onPressed: (){}, 
                            icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50],),),
                      ],
                    ),
                  ),
                ),
                // TODO: 3 Buat bagian ProfileInfo yang berisi info profil
                SizedBox(height: 20),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Pengguna', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $username', style: TextStyle(
                        fontSize: 18
                        ),
                      ),
                    ),
                    if(isSignedIn) Icon(Icons.edit),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Nama', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $fullName', style: TextStyle(
                        fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorit', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(': $favoriteCandiCount ', style: TextStyle(
                        fontSize: 18
                        ),
                      ),
                    ),
                  ],
                ),
                // TODO: 4 Buat ProfileActions yang berisi TextButton sign in/sign out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignedIn ? TextButton(
                  onPressed: signOut,
                  child: Text('Sign Out'))
                  : TextButton(
                    onPressed: (){}, 
                    child: Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: ProfileScreen(),
    );
  }
}

