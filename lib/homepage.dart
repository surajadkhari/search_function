import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List data = <String>['kathmandu', 'pokhara', 'chitwan'];

  List searchresult = [];

//Is search Empty
  bool isSeachempty = false;

//Searching Method
  List showSeach({required String query}) {
    setState(() {
      searchresult = data
          .where((e) => e.toLowerCase().contains(query.toLowerCase()))
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
                  hintText: 'Type name of city',
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
                                child: Center(
                                  child: Text(
                                    searchresult[index],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
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
                      children: const [
                        SizedBox(
                          height: 200,
                        ),
                        CircularProgressIndicator(),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
