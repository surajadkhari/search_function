class CollegeModel {
  final String name;
  final String location;
  CollegeModel({required this.name, required this.location});

  toLowerCase() {}
}

List<CollegeModel> collegeList = [
  CollegeModel(name: 'EEMC', location: 'Sanepa'),
  CollegeModel(name: 'KCC', location: 'Bhanktapur'),
];
