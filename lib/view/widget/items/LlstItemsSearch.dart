import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../data/model/bookModel.dart';
import '../../../linkapi.dart';

class ListItemsSearch extends StatelessWidget {
  final List<BookModel> listdatamodel;
  final Function()? onTap;
  const ListItemsSearch({Key? key, required this.listdatamodel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Card(
                  child: Container(
                padding:const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child:    CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestProduct}/${listdatamodel[index].bookImage!}",
                          width: double.infinity,
                         height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Expanded(
                       // flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].bookName!),
                          subtitle: Text(listdatamodel[index].categoriersName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
