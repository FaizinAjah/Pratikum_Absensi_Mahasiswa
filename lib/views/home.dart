import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitoring_kehadiran/controllers/kehadiran.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Kehadiran>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.mahasiswa.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(provider.mahasiswa[index].name),
                  value: provider.mahasiswa[index].isPresent,
                  onChanged: (value) {
                    provider.updateKehadiran(index, value!);
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: provider.mahasiswa.isEmpty ? null : provider.saveKehadiran,
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }
}
