import 'package:flutter/material.dart';
import 'package:device_frame/device_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lexend'),
      home: const HomePage(),
      builder: (context, child) {
        return DeviceFrame(
          device: Devices.ios.iPhone13,
          isFrameVisible: true,
          screen: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFF6FFB4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            children: [
              const Text(
                "Notely",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 30), 
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/note.png',
                      height: size.height * 0.42, 
                    ),
                    const SizedBox(height: 10), 
                    const Text(
                      "Your Personal Space\nFor Thoughts And Ideas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 30), 
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF101946),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ABOUT PAGE =================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFF6FFB4),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 8, bottom: 30),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "About Notely",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    aboutCard(
                      title: "Notely",
                      description:
                          "Notely is a simple and secure digital notebook designed to help you capture your thoughts and stay organized, wherever you go.",
                    ),
                    const SizedBox(height: 20),
                    aboutCard(
                      title: "Our Mission",
                      description:
                          "Our mission is to make note taking easy and safe for everyone",
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: SizedBox(
                        width: 160,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF101946),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Learn More",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget aboutCard({required String title, required String description}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFB7C4E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          const Divider(color: Colors.white, thickness: 1.2),
          const SizedBox(height: 10),
          Text(description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// ================= MENU PAGE =================
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFF6FFB4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Menu",
                          style: TextStyle(
                            fontSize: 26, 
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 22), 
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ContactPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  menuItem(context, 'assets/images/note_1.png', "My Notes", () {}),
                  const SizedBox(height: 25),
                  menuItem(context, 'assets/images/note_2.png', "Favorites", () {}),
                  const SizedBox(height: 25),
                  menuItem(context, 'assets/images/note_3.png', "Archive", () {}),
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4A4A2F),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(BuildContext context, String image, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 70, // bigger height
        padding: const EdgeInsets.symmetric(horizontal: 22),
        decoration: BoxDecoration(
          color: const Color(0xFFAFC0E6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(image, height: 36, width: 36), 
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700), 
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20), 
          ],
        ),
      ),
    );
  }
}

// ================= CONTACT PAGE =================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFF6FFB4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Contact Us",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xFF6E8CA6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 80, color: Color(0xFFF6FFB4)),
              ),
              const SizedBox(height: 20),
              const Text("Note Assistant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 35),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(221, 0, 0, 0), width: 2),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const [
                          Icon(Icons.email, size: 20),
                          SizedBox(width: 12),
                          Text("support@note", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const [
                          Icon(Icons.phone, size: 20),
                          SizedBox(width: 12),
                          Text("+63 956 789 1234", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= PROFILE PAGE =================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: const Color(0xFFF6FFB4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Notely",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home, size: 22),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 20),
              const Text("Arian Mance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 35),
              profileMenuItem(context, Icons.person_outline, "Buy Premium", () {}),
              const SizedBox(height: 22),
              profileMenuItem(context, Icons.edit_outlined, "Edit Profile", () {}),
              const SizedBox(height: 22),
              profileMenuItem(context, Icons.notifications_none, "Notifications", () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileMenuItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFAFC0E6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18),
          ],
        ),
      ),
    );
  }
}