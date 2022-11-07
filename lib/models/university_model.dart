import 'package:json_annotation/json_annotation.dart';

part 'university_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UniversityModel {
  @JsonKey(name: 'alpha_two_code')
  String alphaTwoCode;
  @JsonKey(name: 'domains')
  List<String> domains;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'state-province')
  String? stateProvince;
  @JsonKey(name: 'web_pages')
  List<String> webPages;
  @JsonKey(name: 'name')
  String name;

  UniversityModel({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    this.stateProvince,
    required this.webPages,
    required this.name,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      _$UniversityModelFromJson(json);

  Map<String, dynamic> toJson() => _$UniversityModelToJson(this);
}
