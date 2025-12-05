import 'package:flutter/material.dart';
import 'package:responsi2mobile_paket3_h1d023035/bloc/buku_bloc.dart';
import 'package:responsi2mobile_paket3_h1d023035/model/buku.dart';
import 'package:responsi2mobile_paket3_h1d023035/ui/buku_page.dart';
import 'package:responsi2mobile_paket3_h1d023035/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BukuForm extends StatefulWidget {
  Buku? buku;
  BukuForm({Key? key, this.buku}) : super(key: key);
  @override
  _BukuFormState createState() => _BukuFormState();
}

class _BukuFormState extends State<BukuForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Inventaris Dzaky";
  String tombolSubmit = "SIMPAN";
  
  final _judulTextboxController = TextEditingController();
  final _hargaTextboxController = TextEditingController();
  final _jumlahTextboxController = TextEditingController();
  final _tanggalMasukTextboxController = TextEditingController();
  final _volumeTextboxController = TextEditingController();
  final _penulisTextboxController = TextEditingController();
  final _penerbitTextboxController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.buku != null) {
      setState(() {
        judul = "Ubah Inventaris Dzaky";
        tombolSubmit = "UBAH";
        _judulTextboxController.text = widget.buku!.judul!;
        _hargaTextboxController.text = widget.buku!.harga.toString();
        _jumlahTextboxController.text = widget.buku!.jumlah.toString();
        _tanggalMasukTextboxController.text = widget.buku!.tanggalMasuk!;
        _volumeTextboxController.text = widget.buku!.volume.toString();
        _penulisTextboxController.text = widget.buku!.penulis!;
        _penerbitTextboxController.text = widget.buku!.penerbit!;
      });
    } else {
      judul = "Tambah Inventaris Dzaky";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(judul),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Header Icon
              Container(
                height: 100,
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
                    widget.buku != null ? Icons.edit_note_rounded : Icons.add_box_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              
              _buildFormCard([
                _judulTextField(),
                _penulisTextField(),
                _penerbitTextField(),
              ]),
              const SizedBox(height: 15),
              
              _buildFormCard([
                _hargaTextField(),
                _jumlahTextField(),
                _volumeTextField(),
              ]),
              const SizedBox(height: 15),
              
              _buildFormCard([
                _tanggalMasukTextField(),
              ]),
              const SizedBox(height: 30),
              
              _buttonSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(List<Widget> children) {
    return Container(
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
        children: children.map((child) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: child,
          )
        ).toList(),
      ),
    );
  }

  //Membuat Textbox Judul
  Widget _judulTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Judul Buku",
        prefixIcon: const Icon(Icons.book, color: Colors.brown),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.brown, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.text,
      controller: _judulTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Judul harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Harga
  Widget _hargaTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Harga",
        prefixIcon: const Icon(Icons.attach_money, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.number,
      controller: _hargaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Harga harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Jumlah
  Widget _jumlahTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Jumlah",
        prefixIcon: const Icon(Icons.inventory, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.purple, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.number,
      controller: _jumlahTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Jumlah harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Tanggal Masuk
  Widget _tanggalMasukTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Tanggal Masuk (YYYY-MM-DD)",
        hintText: "2024-01-01",
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.red),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.datetime,
      controller: _tanggalMasukTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Tanggal masuk harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Volume
  Widget _volumeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Volume",
        prefixIcon: const Icon(Icons.library_books, color: Colors.indigo),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.indigo, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.number,
      controller: _volumeTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Volume harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Penulis
  Widget _penulisTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Penulis",
        prefixIcon: const Icon(Icons.person, color: Colors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.text,
      controller: _penulisTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Penulis harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Penerbit
  Widget _penerbitTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Penerbit",
        prefixIcon: const Icon(Icons.business, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.orange, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.text,
      controller: _penerbitTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Penerbit harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown[700],
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.buku != null ? Icons.update_rounded : Icons.save_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    tombolSubmit,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            if (!_isLoading) {
              if (widget.buku != null) {
                //kondisi update buku
                ubah();
              } else {
                //kondisi tambah buku
                simpan();
              }
            }
          }
        },
      ),
    );
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Buku createBuku = Buku(id: null);
    createBuku.judul = _judulTextboxController.text;
    createBuku.harga = int.parse(_hargaTextboxController.text);
    createBuku.jumlah = int.parse(_jumlahTextboxController.text);
    createBuku.tanggalMasuk = _tanggalMasukTextboxController.text;
    createBuku.volume = int.parse(_volumeTextboxController.text);
    createBuku.penulis = _penulisTextboxController.text;
    createBuku.penerbit = _penerbitTextboxController.text;
    
    BukuBloc.addBuku(buku: createBuku).then(
      (value) => {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const BukuPage()),
          (route) => false,
        )
      },
      onError: (error) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
            description: "Simpan gagal, silahkan coba lagi",
          ),
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Buku updateBuku = Buku(id: widget.buku!.id!);
    updateBuku.judul = _judulTextboxController.text;
    updateBuku.harga = int.parse(_hargaTextboxController.text);
    updateBuku.jumlah = int.parse(_jumlahTextboxController.text);
    updateBuku.tanggalMasuk = _tanggalMasukTextboxController.text;
    updateBuku.volume = int.parse(_volumeTextboxController.text);
    updateBuku.penulis = _penulisTextboxController.text;
    updateBuku.penerbit = _penerbitTextboxController.text;
    
    BukuBloc.updateBuku(buku: updateBuku).then(
      (value) => {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => const BukuPage()),
          (route) => false,
        )
      },
      onError: (error) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
            description: "Permintaan ubah data gagal, silahkan coba lagi",
          ),
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
  }
}