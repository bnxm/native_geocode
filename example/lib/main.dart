import 'package:flutter/material.dart';
import 'package:native_geocoder/native_geocoder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: FutureBuilder<bool>(
            initialData: false,
            future: NativeGeocoder().isPresent,
            builder: (context, snapshot) => Text(
              snapshot.data ? 'Geocoder available' : 'Geocoder unavailable',
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: FutureBuilder<List<Address>>(
              future: NativeGeocoder().getAddresses(
                53.5696843,
                9.8355967,
                maxResults: 1,
              ),
              builder: (context, snapshot) {
                final addresses = snapshot.data ?? <Address>[];

                if (addresses.isEmpty) {
                  return Text('No results');
                }

                return Column(
                  children: [
                    for (final addr in addresses)
                      ListTile(
                        title: Text(
                          addr.thoroughfare ??
                              addr.subLocality ??
                              addr.locality ??
                              'none',
                        ),
                        subtitle: Text(
                          '${addr.latitude}, ${addr.longitude}',
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
