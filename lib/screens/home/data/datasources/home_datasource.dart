import 'package:landa/screens/home/data/models/models.dart';
import 'package:landa/screens/home/domain/entities/entities.dart';

abstract interface class HomeDatasource {
  Future<List<AdvertisementModel>> getAllAds({
    required AdvertisementQuery query,
  });
}
