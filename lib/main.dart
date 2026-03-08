import 'package:flutter/material.dart';

void main() {
  runApp(const AspenApp());
}

class AspenApp extends StatelessWidget {
  const AspenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aspen Travel',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

// --- ONBOARDING SCREEN ---
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/aspenHome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      'Aspen',
                      style: TextStyle(
                        fontFamily: 'Hiatus',
                        fontSize: 110,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Plan your',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    'Luxurious\nVacation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF176FF2),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Explore',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- HOME SCREEN ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Color(0xFF176FF2)), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined, color: Colors.grey), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: Colors.grey), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.grey), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore", style: TextStyle(fontSize: 14, color: Color(0xFF232323))),
                      Text("Aspen", style: TextStyle(fontFamily: 'Montserrat',fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xFF232323))),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFF176FF2), size: 18),
                      const SizedBox(width: 4),
                      Text("Aspen, USA", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                      const Icon(Icons.keyboard_arrow_down, color: Color(0xFF176FF2)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: "Find things to do",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF3F8FE),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 32),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryTab(title: "Location", isActive: true),
                    CategoryTab(title: "Hotels"),
                    CategoryTab(title: "Food"),
                    CategoryTab(title: "Adventure"),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const SectionHeader(title: "Popular"),
              const SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PopularCard(
                      name: "Alley Palace",
                      rating: "4.1",
                      image: 'assets/images/first.png',
                    ),
                    PopularCard(
                      name: "Coeurdes Alpes",
                      rating: "4.5",
                      image: 'assets/images/second.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const SectionHeader(title: "Recommended"),
              const SizedBox(height: 16),
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RecommendedCard(
                      title: "Explore Aspen",
                      duration: "4N/5D",
                      image: 'assets/images/third.png',
                    ),
                    RecommendedCard(
                      title: "Luxurious Aspen",
                      duration: "2N/3D",
                      image: 'assets/images/fourth.jpg',
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

// --- SUPPORTING WIDGETS ---

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isActive;
  const CategoryTab({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? const Color(0xFF176FF2) : const Color(0xFFB8B8B8),
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color(0xFF232323))),
        const Text("See all", style: TextStyle(color: Color(0xFF176FF2), fontWeight: FontWeight.w600, fontSize: 12)),
      ],
    );
  }
}

class PopularCard extends StatelessWidget {
  final String name, rating, image;
  const PopularCard({super.key, required this.name, required this.rating, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),

        image: DecorationImage(
          image: image.startsWith('http')
              ? NetworkImage(image) as ImageProvider
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: const Color(0xFF4D5652), borderRadius: BorderRadius.circular(12)),
                  child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFF4D5652), borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFF8D675), size: 14),
                      const SizedBox(width: 4),
                      Text(rating, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
              ),
              child: const Icon(Icons.favorite, color: Color(0xFFEC5655), size: 18),
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  final String title, duration, image;
  const RecommendedCard({super.key, required this.title, required this.duration, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF4F4F4)),
        boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            // FIXED LINE BELOW: Added check for local vs network image
            child: image.startsWith('http')
                ? Image.network(image, width: double.infinity, height: 80, fit: BoxFit.cover)
                : Image.asset(image, width: double.infinity, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF232323))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(duration, style: const TextStyle(color: Color(0xFF232323), fontSize: 10, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}