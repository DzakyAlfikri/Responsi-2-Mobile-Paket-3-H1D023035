# Nama : Dzaky Alfikri
# NIM : H1D023035
# Shift Baru : C
# Shift KRS : B
# Demo Aplikasi
https://raw.githubusercontent.com/DzakyAlfikri/Responsi-2-Mobile-Paket-3-H1D023035/main/Demo.mp4


# API Specification - Inventaris Buku

## Base URL
```
http://localhost:8080
```

---

## A. Registrasi

| EndPoint | /registrasi |
|----------|-------------|
| **Method** | POST |
| **Header** | • Content-Type: application/json |
| **Body** | `{`<br>&nbsp;&nbsp;`"nama"` : `"string"`,<br>&nbsp;&nbsp;`"email"` : `"string"`,<br>&nbsp;&nbsp;`"password"` : `"string"`<br>`}` |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `"string"`<br>`}` |

---

## B. Login

| EndPoint | /login |
|----------|--------|
| **Method** | POST |
| **Header** | • Content-Type: application/json |
| **Body** | `{`<br>&nbsp;&nbsp;`"email"` : `"string"`,<br>&nbsp;&nbsp;`"password"` : `"string"`<br>`}` |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `{`<br>&nbsp;&nbsp;&nbsp;&nbsp;`"token"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"user"` : `{`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"id"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"email"` : `"string"`<br>&nbsp;&nbsp;&nbsp;&nbsp;`}`<br>&nbsp;&nbsp;`}`<br>`}` |

---

## C. List Buku

| EndPoint | /buku/list |
|----------|------------|
| **Method** | GET |
| **Header** | • Content-Type: application/json |
| **Body** | - |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `[`<br>&nbsp;&nbsp;&nbsp;&nbsp;`{`<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"id"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`"penerbit"` : `"string"`<br>&nbsp;&nbsp;&nbsp;&nbsp;`}`<br>&nbsp;&nbsp;`]`<br>`}` |

---

## D. Create Buku

| EndPoint | /buku/create |
|----------|--------------|
| **Method** | POST |
| **Header** | • Content-Type: application/json |
| **Body** | `{`<br>&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;`"penerbit"` : `"string"`<br>`}` |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `{`<br>&nbsp;&nbsp;&nbsp;&nbsp;`"id"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penerbit"` : `"string"`<br>&nbsp;&nbsp;`}`<br>`}` |

---

## E. Show Buku (Detail)

| EndPoint | /buku/detail/{id} |
|----------|-------------------|
| **Method** | GET |
| **Header** | • Content-Type: application/json |
| **Body** | - |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `{`<br>&nbsp;&nbsp;&nbsp;&nbsp;`"id"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penerbit"` : `"string"`<br>&nbsp;&nbsp;`}`<br>`}` |

---

## F. Update Buku

| EndPoint | /buku/ubah/{id} |
|----------|-----------------|
| **Method** | POST / PUT |
| **Header** | • Content-Type: application/json |
| **Body** | `{`<br>&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;`"penerbit"` : `"string"`<br>`}` |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `{`<br>&nbsp;&nbsp;&nbsp;&nbsp;`"id"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"judul"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"harga"` : `"number"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"jumlah"` : `"integer"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"tanggal_masuk"` : `"date"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"volume"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penulis"` : `"string"`,<br>&nbsp;&nbsp;&nbsp;&nbsp;`"penerbit"` : `"string"`<br>&nbsp;&nbsp;`}`<br>`}` |

---

## G. Delete Buku

| EndPoint | /buku/hapus/{id} |
|----------|------------------|
| **Method** | DELETE / POST |
| **Header** | • Content-Type: application/json |
| **Body** | - |
| **Response** | `{`<br>&nbsp;&nbsp;`"code"` : `"integer"`,<br>&nbsp;&nbsp;`"status"` : `"boolean"`,<br>&nbsp;&nbsp;`"data"` : `"boolean"`<br>`}` |

---

# PENJELASAN KODE

## 1. HELPERS LAYER

### A. ApiUrl Class (`lib/helpers/api_url.dart`)
```dart
class ApiUrl {
  static const String baseUrl = 'http://localhost:8080';
  static const String registrasi = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listBuku = baseUrl + '/buku';
  static const String createBuku = baseUrl + '/buku';
  
  static String updateBuku(int id) {
    return baseUrl + '/buku/' + id.toString();
  }
  static String showBuku(int id) {
    return baseUrl + '/buku/' + id.toString();
  }
  static String deleteBuku(int id) {
    return baseUrl + '/buku/' + id.toString();
  }
}
```
**Penjelasan:**
- **baseUrl**: URL dasar server API (localhost:8080)
- **registrasi**: Endpoint untuk registrasi user baru
- **login**: Endpoint untuk login user
- **listBuku**: Endpoint untuk mengambil daftar semua buku
- **createBuku**: Endpoint untuk membuat buku baru
- **updateBuku(id)**: Generate endpoint untuk update buku berdasarkan ID
- **showBuku(id)**: Generate endpoint untuk menampilkan detail buku
- **deleteBuku(id)**: Generate endpoint untuk hapus buku berdasarkan ID

### B. Api Class (`lib/helpers/api.dart`)
```dart
class Api {
  Future<dynamic> post(dynamic url, dynamic data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
```
**Penjelasan:**
- **post()**: Mengirim HTTP POST request dengan token authorization
- **get()**: Mengirim HTTP GET request untuk mengambil data
- **put()**: Mengirim HTTP PUT request untuk update data
- **delete()**: Mengirim HTTP DELETE request untuk hapus data
- **_returnResponse()**: Menghandle response HTTP dan throw exception jika error

### C. UserInfo Class (`lib/helpers/user_info.dart`)
```dart
class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }
  
  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }
}
```
**Penjelasan:**
- **setToken()**: Menyimpan JWT token ke local storage
- **getToken()**: Mengambil JWT token dari local storage
- **setUserID()**: Menyimpan ID user ke local storage
- **getUserID()**: Mengambil ID user dari local storage
- **logout()**: Menghapus semua data user dari local storage

### D. AppException Class (`lib/helpers/app_exception.dart`)
```dart
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
}
```
**Penjelasan:**
- **AppException**: Base class untuk semua custom exception
- **FetchDataException**: Exception untuk error komunikasi dengan server
- **BadRequestException**: Exception untuk request yang tidak valid
- **UnauthorisedException**: Exception untuk error authorization
- **InvalidInputException**: Exception untuk input yang tidak valid

## 2. MODEL LAYER

### A. Buku Model (`lib/model/buku.dart`)
```dart
class Buku {
  String? id;
  String? judul;
  int? harga;
  int? jumlah;
  String? tanggalMasuk;
  int? volume;
  String? penulis;
  String? penerbit;
  
  factory Buku.fromJson(Map<String, dynamic> obj) {
    return Buku(
      id: obj['id'],
      judul: obj['judul'],
      harga: int.parse(obj['harga'].toString()),
      jumlah: int.parse(obj['jumlah'].toString()),
      tanggalMasuk: obj['tanggal_masuk'],
      volume: int.parse(obj['volume'].toString()),
      penulis: obj['penulis'],
      penerbit: obj['penerbit'],
    );
  }
}
```
**Penjelasan:**
- **Properties**: Semua field yang diperlukan untuk data buku
- **fromJson()**: Factory constructor untuk convert JSON response ke object Buku
- **Constructor**: Default constructor dengan semua parameter opsional

### B. Login Model (`lib/model/login.dart`)
```dart
class Login {
  int? code;
  bool? status;
  String? token;
  int? userID;
  String? userEmail;
  
  factory Login.fromJson(Map<String, dynamic> obj) {
    if (obj['code'] == 200) {
      return Login(
        code: obj['code'],
        status: obj['status'],
        token: obj['data']['token'],
        userID: int.parse(obj['data']['user']['id']),
        userEmail: obj['data']['user']['email'],
      );
    } else {
      return Login(code: obj['code'], status: obj['status']);
    }
  }
}
```
**Penjelasan:**
- **Properties**: Menyimpan response dari API login
- **fromJson()**: Parse JSON response login, handle success dan error response

### C. Registrasi Model (`lib/model/registrasi.dart`)
```dart
class Registrasi {
  int? code;
  bool? status;
  String? data;
  
  factory Registrasi.fromJson(Map<String, dynamic> obj) {
    return Registrasi(
      code: obj['code'],
      status: obj['status'],
      data: obj['data'],
    );
  }
}
```
**Penjelasan:**
- **Properties**: Menyimpan response dari API registrasi
- **fromJson()**: Parse JSON response registrasi

## 3. BLOC LAYER (Business Logic)

### A. LoginBloc (`lib/bloc/login_bloc.dart`)
```dart
class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Login.fromJson(jsonObj);
  }
}
```
**Penjelasan:**
- **login()**: Mengirim request login ke API dengan email dan password
- Return object Login yang berisi token dan info user

### B. BukuBloc (`lib/bloc/buku_bloc.dart`)
```dart
class BukuBloc {
  static Future<List<Buku>> getBukus() async {
    String apiUrl = ApiUrl.listBuku;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listBuku = (jsonObj as Map<String, dynamic>)['data'];
    List<Buku> bukus = [];
    for (int i = 0; i < listBuku.length; i++) {
      bukus.add(Buku.fromJson(listBuku[i]));
    }
    return bukus;
  }
  
  static Future addBuku({Buku? buku}) async {
    String apiUrl = ApiUrl.createBuku;
    var body = {
      "judul": buku!.judul,
      "harga": buku.harga.toString(),
      "jumlah": buku.jumlah.toString(),
      "tanggal_masuk": buku.tanggalMasuk,
      "volume": buku.volume.toString(),
      "penulis": buku.penulis,
      "penerbit": buku.penerbit,
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }
}
```
**Penjelasan:**
- **getBukus()**: Mengambil semua data buku dari API dan convert ke List<Buku>
- **addBuku()**: Menambah buku baru ke database via API
- **updateBuku()**: Update data buku existing
- **deleteBuku()**: Menghapus buku berdasarkan ID

### C. LogoutBloc (`lib/bloc/logout_bloc.dart`)
```dart
class LogoutBloc {
  static Future logout() async {
    await UserInfo().logout();
  }
}
```
**Penjelasan:**
- **logout()**: Menghapus semua data user dari local storage

### D. RegistrasiBloc (`lib/bloc/registrasi_bloc.dart`)
```dart
class RegistrasiBloc {
  static Future<Registrasi> registrasi({
    String? nama,
    String? email,
    String? password,
  }) async {
    String apiUrl = ApiUrl.registrasi;
    var body = {"nama": nama, "email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
```
**Penjelasan:**
- **registrasi()**: Mengirim data registrasi user baru ke API

## 4. UI LAYER (User Interface)

### A. Main App (`lib/main.dart`)
```dart
class MyApp extends StatefulWidget {
  Widget page = const CircularProgressIndicator();
  
  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = const BukuPage();
      });
    } else {
      setState(() {
        page = const LoginPage();
      });
    }
  }
}
```
**Penjelasan:**
- **isLogin()**: Cek apakah user sudah login dengan mengecek token
- Jika token ada, langsung ke BukuPage, jika tidak ke LoginPage
- **build()**: Setup theme dengan warna coklat dan Material Design 3

### B. LoginPage (`lib/ui/login_page.dart`)
```dart
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
      email: _emailTextboxController.text,
      password: _passwordTextboxController.text,
    ).then((value) async {
      if (value.code == 200) {
        await UserInfo().setToken(value.token!);
        await UserInfo().setUserID(value.userID!);
        Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context) => const BukuPage()));
      }
    });
  }
}
```
**Penjelasan:**
- **_emailTextField()**: Widget input email dengan validasi
- **_passwordTextField()**: Widget input password dengan validasi
- **_buttonLogin()**: Tombol login dengan loading state
- **_submit()**: Proses login, simpan token jika berhasil, navigate ke BukuPage
- **_menuRegistrasi()**: Link untuk ke halaman registrasi

### C. RegistrasiPage (`lib/ui/registrasi_page.dart`)
```dart
class _RegistrasiPageState extends State<RegistrasiPage> {
  void _submit() {
    RegistrasiBloc.registrasi(
      nama: _namaTextboxController.text,
      email: _emailTextboxController.text,
      password: _passwordTextboxController.text,
    ).then((value) => {
      showDialog(
        context: context,
        builder: (BuildContext context) => SuccessDialog(
          description: "Registrasi berhasil, silahkan login",
          okClick: () {
            Navigator.pop(context);
          },
        )
      )
    });
  }
}
```
**Penjelasan:**
- **_namaTextField()**: Input nama dengan validasi minimal 3 karakter
- **_emailTextField()**: Input email dengan validasi format email
- **_passwordTextField()**: Input password dengan validasi minimal 6 karakter
- **_passwordKonfirmasiTextField()**: Konfirmasi password harus sama
- **_submit()**: Proses registrasi dan tampilkan dialog success

### D. BukuPage (`lib/ui/buku_page.dart`)
```dart
class _BukuPageState extends State<BukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(...),
      drawer: Drawer(...),
      body: FutureBuilder<List>(
        future: BukuBloc.getBukus(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }
          return snapshot.hasData
              ? ListBuku(list: snapshot.data)
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
```
**Penjelasan:**
- **AppBar**: Header dengan title dan tombol tambah buku
- **Drawer**: Side menu dengan opsi logout
- **FutureBuilder**: Async widget untuk load data buku dari API
- **ListBuku**: Widget untuk menampilkan daftar buku dalam bentuk list

### E. ItemBuku Widget
```dart
class ItemBuku extends StatelessWidget {
  final Buku buku;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => BukuDetail(buku: buku)));
      },
      child: Container(
        // Modern card design dengan gradient dan shadow
      ),
    );
  }
}
```
**Penjelasan:**
- **onTap**: Navigate ke halaman detail saat card di-tap
- **Container**: Modern card design dengan gradient background
- Menampilkan judul, penulis, harga, dan jumlah buku

### F. BukuForm (`lib/ui/buku_form.dart`)
```dart
class _BukuFormState extends State<BukuForm> {
  void isUpdate() {
    if (widget.buku != null) {
      // Mode edit - populate form dengan data existing
      _judulTextboxController.text = widget.buku!.judul!;
      _hargaTextboxController.text = widget.buku!.harga.toString();
      // ... field lainnya
    } else {
      // Mode tambah buku baru
    }
  }
  
  void simpan() {
    Buku createBuku = Buku(id: null);
    createBuku.judul = _judulTextboxController.text;
    createBuku.harga = int.parse(_hargaTextboxController.text);
    // ... set field lainnya
    
    BukuBloc.addBuku(buku: createBuku).then((value) => {
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => const BukuPage()),
        (route) => false)
    });
  }
  
  void ubah() {
    Buku updateBuku = Buku(id: widget.buku!.id!);
    updateBuku.judul = _judulTextboxController.text;
    // ... set field lainnya
    
    BukuBloc.updateBuku(buku: updateBuku).then((value) => {
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => const BukuPage()),
        (route) => false)
    });
  }
}
```
**Penjelasan:**
- **isUpdate()**: Deteksi mode form (tambah/edit), populate data jika edit
- **Text Field Widgets**: Input untuk semua field buku dengan validasi
- **simpan()**: Proses tambah buku baru via BukuBloc
- **ubah()**: Proses update buku existing via BukuBloc
- **_buildFormCard()**: Helper untuk membuat card form yang modern

### G. BukuDetail (`lib/ui/buku_detail.dart`)
```dart
class _BukuDetailState extends State<BukuDetail> {
  Widget _buildDetailCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      // Modern card dengan icon dan warna berbeda untuk setiap field
    );
  }
  
  void confirmHapus() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi Hapus"),
        content: Text("Yakin ingin menghapus data buku ini?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              BukuBloc.deleteBuku(id: int.parse(widget.buku!.id!))
                .then((value) => Navigator.pushAndRemoveUntil(...));
            },
          ),
        ],
      ),
    );
  }
}
```
**Penjelasan:**
- **_buildDetailCard()**: Helper untuk membuat card info dengan icon dan warna
- **_tombolHapusEdit()**: Widget tombol Edit dan Delete dengan styling modern
- **confirmHapus()**: Dialog konfirmasi sebelum hapus data
- **GridView**: Layout grid untuk menampilkan detail buku secara rapi

## 5. WIDGET LAYER (Reusable Components)

### A. SuccessDialog (`lib/widget/success_dialog.dart`)
```dart
class SuccessDialog extends StatelessWidget {
  final String? description;
  final VoidCallback? okClick;
  
  Widget dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(...)],
      ),
      child: Column(
        children: [
          Text("SUKSES", style: TextStyle(color: Colors.green)),
          Text(description!),
          OutlinedButton(onPressed: okClick),
        ],
      ),
    );
  }
}
```
**Penjelasan:**
- **description**: Pesan yang akan ditampilkan
- **okClick**: Callback saat tombol OK ditekan
- **dialogContent()**: Styling dialog dengan border radius dan shadow

### B. WarningDialog (`lib/widget/warning_dialog.dart`)
```dart
class WarningDialog extends StatelessWidget {
  Widget dialogContent(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("GAGAL", style: TextStyle(color: Colors.red)),
          Text(description!),
          ElevatedButton(onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
```
**Penjelasan:**
- **Similar dengan SuccessDialog** tapi untuk menampilkan pesan error
- **Styling merah** untuk indikasi error
- **Auto close** dialog saat tombol OK ditekan

## 6. FITUR UTAMA APLIKASI

### A. Authentication System
- **Login**: Validasi email/password, simpan JWT token
- **Register**: Validasi input, create user baru
- **Logout**: Hapus token dan data user
- **Auto-login**: Cek token saat app start

### B. CRUD Operations untuk Buku
- **Create**: Tambah buku baru dengan semua field required
- **Read**: Tampilkan list buku dengan pagination
- **Update**: Edit data buku existing
- **Delete**: Hapus buku dengan konfirmasi

### C. Modern UI/UX Features
- **Material Design 3**: Latest design system
- **Brown Color Scheme**: Sesuai requirement
- **Gradient Backgrounds**: Visual appeal
- **Card-based Layout**: Modern dan clean
- **Loading States**: User feedback
- **Form Validation**: Real-time validation
- **Error Handling**: Graceful error messages

## 7. ARSITEKTUR APLIKASI

### A. Layer Architecture
1. **UI Layer**: Screens dan widgets
2. **Bloc Layer**: Business logic dan state management
3. **Model Layer**: Data structures
4. **Helper Layer**: Utilities dan services

### B. Design Patterns
- **Bloc Pattern**: Separation of concerns
- **Factory Pattern**: Model creation dari JSON
- **Singleton Pattern**: API dan UserInfo services

### C. State Management
- **setState**: Local component state
- **SharedPreferences**: Persistent storage
- **FutureBuilder**: Async data loading

Aplikasi ini mengimplementasikan clean architecture dengan separation of concerns yang baik, modern UI design, dan robust error handling untuk pengalaman pengguna yang optimal.