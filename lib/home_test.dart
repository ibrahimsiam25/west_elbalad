import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:west_elbalad/features/home/data/model/phones_model.dart';

class PhoneListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone List')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('phones').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final phoneDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: phoneDocs.length,
            itemBuilder: (context, index) {
              final phoneData = phoneDocs[index].data() as Map<String, dynamic>;
              final phoneModel = PhoneModel(
                type: phoneData['type'],
                name: phoneData['name'],
                description: phoneData['description'],
                price: phoneData['price'].toDouble(),
                imageUrl: phoneData['imageUrl'],
              );

              return ListTile(
                title: Text(phoneModel.name),
                subtitle: Text(phoneModel.description),
                leading: Image.network(phoneModel.imageUrl),
                // Add more widgets to display other properties (e.g., price, type)
              );
            },
          );
        },
      ),
    );
  }
}
