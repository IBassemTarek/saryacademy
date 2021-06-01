class GalleryModel {
  final List imagesURL;
  final String eventName;
  GalleryModel({this.eventName,this.imagesURL});
}

final List<GalleryModel> galleryCardTest = [
GalleryModel(
  eventName: 'Drawing workshop',
  imagesURL: ['assets/images/gallery/gallery11.png']
),
GalleryModel(
  eventName: 'Fun day',
  imagesURL: ['assets/images/gallery/gallery21.png','assets/images/gallery/gallery22.png','assets/images/gallery/gallery23.png']
),
GalleryModel(
  eventName: 'Learn and drafting',
  imagesURL: ['assets/images/gallery/gallery31.png','assets/images/gallery/gallery32.png']
)
];
