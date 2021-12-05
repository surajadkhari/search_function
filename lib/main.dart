void main() {
  List data = <String>['kathmandu', 'pokhara', 'chitwan'];
  String query = 'Kath';
  var result =
      data.where((e) => e.toLowerCase().contains(query.toLowerCase())).toList();
  print(result);
}
