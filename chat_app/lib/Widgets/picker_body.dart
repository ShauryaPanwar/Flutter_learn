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
    return FutureBuilder<List<Pixelfrom>>(
        future: imgrep.getnetimg(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pixelfrom>> snapshot) {
          if (snapshot.hasData)
            return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        onimgselected(snapshot.data![index].urlSmallSize);
                      },
                      child: Image.network(snapshot.data![index].urlSmallSize));
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent:
                        MediaQuery.of(context).size.width * 0.5));

          //
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
