import 'package:flutter/material.dart';
import 'package:phone_store_api/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              return ListView.builder(
                itemCount: apiService.devices.length,
                itemBuilder: (BuildContext context, int index) {
                  var device = apiService.devices[index];
                  var dataModel = device.dataModel;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            Text(
                              device.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            // Data
                            if (dataModel != null) ...[
                              Text(
                                'Capacity: ${dataModel.capacity ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Color: ${dataModel.color ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Generation: ${dataModel.generation ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                'Price: \$${dataModel.price ?? 'N/A'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ] else ...[
                              const Text(
                                'No additional data available',
                                style: TextStyle(fontSize: 14),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
