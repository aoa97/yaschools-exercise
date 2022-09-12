class SchoolModel {
  final int id;
  final String slug;
  final String name;
  final String nameAr;
  final String nameEn;
  final String logo;
  final double totalRating;
  final String rateCount;
  final String cityName;
  final String districtName;
  final String genderTitle;
  final String categoryTitle;
  final int featured;
  final int accredited;
  final int discount;
  final String minFee;
  final bool hasBooking;
  final bool publishBooking;

  SchoolModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.nameAr,
    required this.nameEn,
    required this.logo,
    required this.totalRating,
    required this.rateCount,
    required this.cityName,
    required this.districtName,
    required this.genderTitle,
    required this.categoryTitle,
    required this.featured,
    required this.accredited,
    required this.discount,
    required this.minFee,
    required this.hasBooking,
    required this.publishBooking,
  });

  factory SchoolModel.fromMap(Map<String, dynamic> data) {
    return SchoolModel(
      id: data['id'] ?? 0,
      slug: data['slug'] ?? '',
      name: data['name'] ?? '',
      nameAr: data['name_ar'] ?? '',
      nameEn: data['name_en'] ?? '',
      logo: data['logo'] ?? '',
      totalRating: data['total_rating'].toDouble() ?? 0,
      rateCount: data['rate_count'] ?? '',
      cityName: data['city_name'] ?? '',
      districtName: data['district_name'] ?? '',
      genderTitle: data['gender_title'] ?? '',
      categoryTitle: data['category_title'] ?? '',
      featured: data['featured'] ?? 'featured',
      accredited: data['accredited'] ?? 0,
      discount: data['discount'] ?? 0,
      minFee: data['min_fee'] ?? '',
      hasBooking: data['has_booking'] ?? false,
      publishBooking: data['publish_booking'] ?? false,
    );
  }
}
