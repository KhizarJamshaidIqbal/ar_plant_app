import 'package:ar_base_plant_app/utils/app_size.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewPlantsScreen extends StatelessWidget {
  const ViewPlantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Plants'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('plants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final plants = snapshot.data!.docs;
          return ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context, index) {
              final plant = plants[index].data() as Map<String, dynamic>;
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.green.withOpacity(0.1),
                  title: Text(plant['name'] ?? 'No Plant Name'),
                  subtitle: Text(plant['description'] ?? 'No Description'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(plant['image_url']),
                  ),
                  children: [
                    const Text(
                      'Plant Information',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    50.h,
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(plant['image_url']),
                    ),
                    50.h,
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: Text('Description: ${plant['description']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.water_damage),
                      title: Text('Humidity: ${plant['humidity']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: Text('Price: \$${plant['price']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.production_quantity_limits),
                      title: Text('Quantity: ${plant['quantity']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.straighten),
                      title: Text('Size: ${plant['size']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.thermostat),
                      title: Text('Temperature: ${plant['temperature']}'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
