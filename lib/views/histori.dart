import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monitoring_kehadiran/controllers/kehadiran.dart';

class Histori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Kehadiran>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.history.length,
        itemBuilder: (context, index) {
          final record = provider.history[index];
          return ListTile(
            title: Text('${record['date']}'),
            subtitle: Text('Hadir: ${record['attended']}, Tidak Hadir: ${record['notAttended']}'),
          );
        },
      ),
    );
  }
}
