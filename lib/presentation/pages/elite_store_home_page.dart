import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EliteStoreHomePage extends StatelessWidget {
  const EliteStoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            _buildCategories(),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text('ELITE', style: TextStyle(color: Colors.black, letterSpacing: 8, fontSize: 18, fontWeight: FontWeight.bold)),
      leading: IconButton(icon: const Icon(LucideIcons.menu, color: Colors.black), onPressed: () {}),
      actions: [
        IconButton(icon: const Icon(LucideIcons.shoppingBag, color: Colors.black), onPressed: () {}),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1441984904996-e0b6ba687e04'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('SUMMER REVEAL', style: TextStyle(color: Colors.white, letterSpacing: 4, fontSize: 12)),
            const SizedBox(height: 8),
            const Text('Limited Collection 2026', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
              child: const Text('SHOP NOW', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = ['All', 'Luxury', 'Minimalist', 'Techwear', 'Classic'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected = index == 0;
            return Container(
              margin: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  Text(categories[index], style: TextStyle(color: isSelected ? Colors.black : Colors.black26, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                  if (isSelected) Container(margin: const EdgeInsets.only(top: 4), width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 32,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
        children: [
          _buildProductCard('Linen Blazer', 'Ethereal Collection', '\$420', 'https://images.unsplash.com/photo-1594938298603-c8148c4dae35'),
          _buildProductCard('Silk Trousers', 'Silk Road', '\$280', 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1'),
          _buildProductCard('Tech Shell', 'Cyber Series', '\$560', 'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3'),
          _buildProductCard('Classic Watch', 'Timeless', '\$1,200', 'https://images.unsplash.com/photo-1524592094714-0f0654e20314'),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String brand, String price, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(brand, style: const TextStyle(color: Colors.black26, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(price, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Color(0xFFEEEEEE)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(LucideIcons.home, color: Colors.black),
          Icon(LucideIcons.search, color: Colors.black26),
          Icon(LucideIcons.heart, color: Colors.black26),
          Icon(LucideIcons.user, color: Colors.black26),
        ],
      ),
    );
  }
}
