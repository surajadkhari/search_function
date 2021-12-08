import 'package:flutter/material.dart';
import 'package:search/model/college_model.dart';
import 'package:lottie/lottie.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //Is search Empty
  bool isSeachempty = false;

//search result

  List<CollegeModel> searchresult = [];

  // List data = <String>['kathmandu', 'pokhara', 'chitwan'];

//Searching Method
  List showSeach({required String query}) {
    setState(() {
      searchresult = collegeList
          .where((e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              e.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
    return searchresult;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          centerTitle: true,
          title: const Text('Searching'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  hintText: 'Type name of college',
                ),
                onChanged: (value) {
                  setState(() {
                    isSeachempty = !isSeachempty;
                  });
                  showSeach(query: value);
                },
              ),
              isSeachempty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchresult.length,
                      itemBuilder: (ctx, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(8),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      collegeList[index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      collegeList[index].location,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        );
                      })
                  :
                  //  ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: data.length,
                  //     itemBuilder: (ctx, index) {
                  //       return Text(data[index]);
                  //     })
                  Column(
                      children: [
                        // CircularProgressIndicator(),
                        Lottie.network(
                            'https://assets4.lottiefiles.com/packages/lf20_szlepvdh.json')
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
