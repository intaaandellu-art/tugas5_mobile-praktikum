class Makanan {
  final String nama;
  final int harga;
  final String img;
  final String deskripsi;

  const Makanan({
    required this.nama,
    required this.harga,
    required this.img,
    required this.deskripsi,
  });

  // 25000 -> "Rp 25.000"
  String get hargaRupiah {
    final teks = harga.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (m) => '.',
        );
    return 'Rp $teks';
  }
}