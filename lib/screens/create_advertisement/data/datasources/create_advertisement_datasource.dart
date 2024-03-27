import 'package:landa/screens/create_advertisement/data/models/create_advertisement_model.dart';

abstract interface class CreateAdvertisementDatasource {
  Future<bool> create(CreateAdvertisementModel createAdvertisementModel);
}
