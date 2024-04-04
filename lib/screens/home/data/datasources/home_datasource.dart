import 'package:landa/screens/home/data/models/models.dart';

abstract interface class HomeDatasource {
  Future<List<AdvertisementModel>> getAllAds({
    required int offset,
    required int limit,
  });
}
