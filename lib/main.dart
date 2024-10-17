import 'package:flutter/material.dart';
import 'page2.dart'; // Pastikan AfterLogin sudah ada di sini

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.black, // Mengubah warna tema menjadi hitam
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>(); // Kunci untuk validasi form
  final TextEditingController _nameController = TextEditingController(); // Controller untuk Nama
  final TextEditingController _roleController = TextEditingController(); // Controller untuk Role
  final TextEditingController _schoolController = TextEditingController(); // Controller untuk Sekolah
  final TextEditingController _descriptionController = TextEditingController(); // Controller untuk Deskripsi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pendaftaran", style: TextStyle(color: Colors.black)), // Mengubah warna judul AppBar
        centerTitle: true, // Menempatkan judul di tengah
        backgroundColor: Colors.white, // Mengubah warna latar belakang AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Menambahkan padding di sekitar form
          child: Form(
            key: _formKey, // Menggunakan kunci form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Judul form
                Text(
                  "Selamat Datang!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Mengubah warna teks menjadi hitam
                  ),
                ),
                SizedBox(height: 30),

                // Input Nama
                TextFormField(
                  controller: _nameController, // Controller untuk Nama
                  decoration: InputDecoration(
                    labelText: "Nama",
                    hintText: "Masukkan nama lengkap",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.black), // Ikon untuk Nama
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama lengkap Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // Spasi antara form

                // Input Role
                TextFormField(
                  controller: _roleController, // Controller untuk Role
                  decoration: InputDecoration(
                    labelText: "Role",
                    hintText: "Masukkan peran/jabatan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.work, color: Colors.black), // Ikon untuk Role
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan role/jabatan Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // Spasi antara form

                // Input Sekolah
                TextFormField(
                  controller: _schoolController, // Controller untuk Sekolah
                  decoration: InputDecoration(
                    labelText: "Sekolah",
                    hintText: "Masukkan nama sekolah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.school, color: Colors.black), // Ikon untuk Sekolah
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama sekolah Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20), // Spasi antara form

                // Input Deskripsi
                TextFormField(
                  controller: _descriptionController, // Controller untuk Deskripsi
                  maxLines: 3, // Deskripsi bisa lebih dari satu baris
                  decoration: InputDecoration(
                    labelText: "Deskripsi",
                    hintText: "Masukkan deskripsi singkat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.description, color: Colors.black), // Ikon untuk Deskripsi
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan deskripsi singkat Anda';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30), // Spasi antara form dan button

                // Button Submit
                SizedBox(
                  width: double.infinity, // Mengisi lebar layar
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Ambil data dari controller
                        String name = _nameController.text;
                        String role = _roleController.text;
                        String school = _schoolController.text;
                        String description = _descriptionController.text;

                        // Kirim data ke Page2
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page2(
                              name: name,
                              role: role,
                              school: school,
                              description: description,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Mengubah warna tombol menjadi hitam
                      padding: EdgeInsets.symmetric(vertical: 15), // Ukuran tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded button
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18, color: Colors.white), // Mengubah warna teks tombol menjadi putih
                    ),
                  ),
                ),

                // Tambahkan spasi untuk memberikan kesan longgar
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
