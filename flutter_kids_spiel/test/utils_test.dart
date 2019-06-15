import 'package:flutter_kids_spiel/config.dart';
import 'package:flutter_kids_spiel/utils.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test_api/test_api.dart';

void main() {
  group("utils test-suit", () {
    test("should latlngToTile and tileToLatLng be reversing", () {
      final tupleTiles = latlngToTile(ZOOM, 53.6102, 9.96796);
      final tupleTilesString =
          sprintf("%d/%d/%d", [tupleTiles[0], tupleTiles[1], tupleTiles[2]]);
      print("\n#####################\n");
      print(tupleTilesString);
      print("#####################\n");

      final tupleLatLng =
          tileToLatLng(tupleTiles[0], tupleTiles[1], tupleTiles[2]);
      final tupleLatLngString =
          sprintf("%d/%f/%f", [tupleLatLng[0], tupleLatLng[1], tupleLatLng[2]]);
      print("\n#####################\n");
      print(tupleLatLngString);
      print("#####################\n");
    });
  });

  test("should toRadians and toDegrees be reversing", () {
    final double radians = toRadians(30);
    final double degrees = toDegrees(radians);
    expect(degrees.round(), 30);
  });
}
