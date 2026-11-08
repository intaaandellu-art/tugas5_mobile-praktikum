import 'package:flutter/material.dart';
import 'package:tugas5/detailpage.dart';
import 'package:tugas5/makanan.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Makanan> daftarMakanan = [
    Makanan(
      nama: 'Pizza Margherita',
      harga: 55000,
      img: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=800',
      deskripsi:
          'Pizza klasik dengan saus tomat segar, keju mozzarella leleh, dan daun basil harum di atas adonan tipis yang renyah.',
    ),
    Makanan(
      nama: 'Cheeseburger',
      harga: 38000,
      img: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800',
      deskripsi:
          'Burger daging sapi juicy dengan keju cheddar, selada, tomat, dan saus spesial di dalam roti empuk.',
    ),
    Makanan(
      nama: 'Pancake Madu',
      harga: 28000,
      img: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800',
      deskripsi:
          'Tumpukan pancake lembut disiram madu dan buah segar. Cocok untuk sarapan atau teman santai sore hari.',
    ),
    Makanan(
      nama: 'Healthy Bowl',
      harga: 42000,
      img: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
      deskripsi:
          'Mangkuk sehat berisi sayuran segar, alpukat, dan topping bergizi. Ringan, mengenyangkan, dan rendah lemak.',
    ),
    Makanan(
      nama: 'Egg Avocado Toast',
      harga: 32000,
      img: 'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?w=800',
      deskripsi:
          'Roti panggang renyah dengan telur dan alpukat creamy, ditaburi bumbu sederhana yang pas.',
    ),
    Makanan(
      nama: 'Salad Segar',
      harga: 25000,
      img: 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800',
      deskripsi:
          'Aneka sayur dan topping segar dengan dressing ringan. Pilihan pas untuk makan siang yang sehat.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.restaurant_menu, size: 28),
        title: const Text(
          'Menu Makanan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarMakanan.length,
        itemBuilder: (context, index) {
          final makanan = daftarMakanan[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailpage(makanan: makanan),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Hero(
                        tag: makanan.nama,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            makanan.img,
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              width: 110,
                              height: 110,
                              color: Colors.orange.shade100,
                              child: const Icon(Icons.fastfood,
                                  size: 40, color: Colors.deepOrange),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              makanan.nama,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              makanan.deskripsi,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              makanan.hargaRupiah,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}