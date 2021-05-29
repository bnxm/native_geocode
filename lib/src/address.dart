import 'package:flutter/foundation.dart';

class Address {
  final double latitude;
  final double longitude;
  final List<String> adressLines;
  final String? thoroughfare;
  final String? subThoroughfare;
  final String? locality;
  final String? subLocality;
  final String? adminArea;
  final String? subAdminArea;
  final String? country;
  final String? countryCode;
  final String? postalCode;
  const Address({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.adressLines = const [],
    this.thoroughfare,
    this.subThoroughfare,
    this.locality,
    this.subLocality,
    this.adminArea,
    this.subAdminArea,
    this.country,
    this.countryCode,
    this.postalCode,
  });

  factory Address.fromMap(dynamic map) {
    return Address(
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
      adressLines: List<String>.from(map['adressLines'] ?? const []),
      thoroughfare: map['thoroughfare'],
      subThoroughfare: map['subThoroughfare'],
      locality: map['locality'],
      subLocality: map['subLocality'],
      adminArea: map['adminArea'],
      subAdminArea: map['subAdminArea'],
      country: map['country'],
      countryCode: map['countryCode'],
      postalCode: map['postalCode'],
    );
  }

  @override
  String toString() {
    return 'Address(latitude: $latitude, longitude: $longitude, adressLines: $adressLines, thoroughfare: $thoroughfare, subThoroughfare: $subThoroughfare, locality: $locality, subLocality: $subLocality, adminArea: $adminArea, subAdminArea: $subAdminArea, country: $country, countryCode: $countryCode, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Address &&
        o.latitude == latitude &&
        o.longitude == longitude &&
        listEquals(o.adressLines, adressLines) &&
        o.thoroughfare == thoroughfare &&
        o.subThoroughfare == subThoroughfare &&
        o.locality == locality &&
        o.subLocality == subLocality &&
        o.adminArea == adminArea &&
        o.subAdminArea == subAdminArea &&
        o.country == country &&
        o.countryCode == countryCode &&
        o.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
        longitude.hashCode ^
        adressLines.hashCode ^
        thoroughfare.hashCode ^
        subThoroughfare.hashCode ^
        locality.hashCode ^
        subLocality.hashCode ^
        adminArea.hashCode ^
        subAdminArea.hashCode ^
        country.hashCode ^
        countryCode.hashCode ^
        postalCode.hashCode;
  }
}
