class HomeData {
  final String url;
  final String photographer;
  final String? alt;

  const HomeData({required this.url, required this.photographer, this.alt});

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        url: json["src"]["small"],
        photographer: json["photographer"],
        alt: json["alt"],
      );
}
