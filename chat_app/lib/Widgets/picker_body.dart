import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

import '../models/image_from.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String) onimgselected;
  final Imagerepo imgrep;

  const NetworkImagePicker(
      {Key? key, required this.imgrep, required this.onimgselected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Colors.white,

      ),
      child: FutureBuilder<List<Pixelfrom>>(
          future: imgrep.getnetimg(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pixelfrom>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          onimgselected(snapshot.data![index].urlSmallSize);
                        },
                        child:
                            Image.network(snapshot.data![index].urlSmallSize));
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width * 0.5));
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text('This is the error: ${snapshot.error}'),
              );
            }

            //
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
