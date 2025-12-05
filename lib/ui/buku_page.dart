import 'package:flutter/material.dart';
import 'package:responsi2mobile_paket3_h1d023035/bloc/logout_bloc.dart';
import 'package:responsi2mobile_paket3_h1d023035/bloc/buku_bloc.dart';
import 'package:responsi2mobile_paket3_h1d023035/model/buku.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/login_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_detail.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_form.dart';

class BukuPage extends StatefulWidget {
  const BukuPage({Key? key}) : super(key: key);
  @override
  _BukuPageState createState() => _BukuPageState();
}

class _BukuPageState extends State<BukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[700],
        foregroundColor: Colors.white,
        title: const Text(
          'Inventaris Buku Dzaky',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.brown[700],
              elevation: 0,
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BukuForm()),
                );
              },
              child: const Icon(Icons.add, size: 24),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(20),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.brown[700]!, Colors.brown[500]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Menu Dzaky',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Inventaris Management',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.logout_rounded, color: Colors.white),
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onTap: () async {
                    await LogoutBloc.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Search Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  'Koleksi Buku',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.library_books_rounded,
                    color: Colors.brown[700],
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          
          // Books List
          Expanded(
            child: FutureBuilder<List>(
              future: BukuBloc.getBukus(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 64,
                          color: Colors.red[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Terjadi kesalahan',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return snapshot.hasData
                    ? snapshot.data!.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.inbox_rounded,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Belum ada data buku',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Tambahkan buku pertama Anda',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListBuku(list: snapshot.data)
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.brown,
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListBuku extends StatelessWidget {
  final List? list;
  const ListBuku({Key? key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ItemBuku(
              buku: list![i],
            ),
          );
        });
  }
}

class ItemBuku extends StatelessWidget {
  final Buku buku;
  const ItemBuku({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BukuDetail(buku: buku)),
        );
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown[400]!, Colors.brown[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    buku.judul![0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      buku.judul!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.person, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            buku.penulis!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Rp ${buku.harga}",
                            style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Qty: ${buku.jumlah}",
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.brown[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.brown[700],
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}