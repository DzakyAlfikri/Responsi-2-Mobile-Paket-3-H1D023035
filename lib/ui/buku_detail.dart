import 'package:flutter/material.dart';
import 'package:responsi2mobile_paket3_h1d023035/bloc/buku_bloc.dart';
import 'package:responsi2mobile_paket3_h1d023035/model/buku.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_form.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BukuDetail extends StatefulWidget {
  Buku? buku;
  BukuDetail({Key? key, this.buku}) : super(key: key);

  @override
  _BukuDetailState createState() => _BukuDetailState();
}

class _BukuDetailState extends State<BukuDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Detail Inventaris Dzaky'),
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Hero Image Section
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown[300]!, Colors.brown[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.menu_book_rounded,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            
            // Title Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.title, color: Colors.brown[700], size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Judul Buku',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${widget.buku!.judul}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Details Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.5,
              children: [
                _buildDetailCard(
                  icon: Icons.person,
                  label: 'Penulis',
                  value: widget.buku!.penulis!,
                  color: Colors.blue,
                ),
                _buildDetailCard(
                  icon: Icons.business,
                  label: 'Penerbit',
                  value: widget.buku!.penerbit!,
                  color: Colors.orange,
                ),
                _buildDetailCard(
                  icon: Icons.attach_money,
                  label: 'Harga',
                  value: 'Rp ${widget.buku!.harga}',
                  color: Colors.green,
                ),
                _buildDetailCard(
                  icon: Icons.inventory,
                  label: 'Jumlah',
                  value: '${widget.buku!.jumlah} pcs',
                  color: Colors.purple,
                ),
                _buildDetailCard(
                  icon: Icons.library_books,
                  label: 'Volume',
                  value: 'Vol. ${widget.buku!.volume}',
                  color: Colors.indigo,
                ),
                _buildDetailCard(
                  icon: Icons.calendar_today,
                  label: 'Tanggal Masuk',
                  value: widget.buku!.tanggalMasuk!,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          // Tombol Edit
          Expanded(
            child: Container(
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.edit_rounded, size: 20),
                label: const Text(
                  "EDIT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BukuForm(
                        buku: widget.buku!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 15),
          // Tombol Hapus
          Expanded(
            child: Container(
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: const Icon(Icons.delete_rounded, size: 20),
                label: const Text(
                  "DELETE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => confirmHapus(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confirmHapus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.warning_rounded,
                color: Colors.red,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "Konfirmasi Hapus",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        content: const Text(
          "Yakin ingin menghapus data buku ini? Tindakan ini tidak dapat dibatalkan.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Batal",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Hapus",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              BukuBloc.deleteBuku(id: int.parse(widget.buku!.id!)).then(
                (value) => {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BukuPage(),
                    ),
                    (route) => false,
                  )
                },
                onError: (error) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) => WarningDialog(
                      description: "Hapus gagal, silahkan coba lagi",
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}