abstract interface class AdvertisementDetailsDatasource {
  Future<bool> bookmark(int advertisementId);
  Future<bool> removeBookmark(int advertisementId);
}
