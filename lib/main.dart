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
                ProfileInfoItem(
                  icon: Icons.lock, 
                  label: 'Pengguna', 
                  value: username, 
                  iconColor: Colors.amber,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.person, 
                  label: 'Nama', 
                  value: fullName,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    // Tindakan saat ikon edit ditekan, misalnya: pengeditan nama
                    debugPrint('Icon edit ditekan ...');
                    }, 
                  iconColor: Colors.blue
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.favorite, 
                  label: 'Favorit', 
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '', 
                  iconColor: Colors.red
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

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;

  const ProfileInfoItem({super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Row(
            children: [
              Icon(icon, color: iconColor), // Gunakan variabel warna ikon 
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(': $value', style: TextStyle(fontSize: 18)),
          ),
        if(showEditIcon) InkWell(onTap: onEditPressed, child: Icon(Icons.edit)),
      ],
    );
  }
}

