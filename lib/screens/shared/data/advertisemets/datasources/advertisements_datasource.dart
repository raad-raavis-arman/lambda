import 'package:landa/screens/shared/data/advertisemets/models/models.dart';
import 'package:landa/screens/shared/domain/advertisements/entities/entities.dart';

abstract interface class AdvertisementsDatasource {
  Future<List<AdvertisementModel>> getAllAds({
    required AdvertisementQuery query,
  });
}
