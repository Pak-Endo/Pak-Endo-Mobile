import 'package:flutter/material.dart';

import '../widgets/faviorate_list.dart';


class FavioratePage extends StatefulWidget {



  @override
  State<FavioratePage> createState() => _FavioratePageState();
}

class _FavioratePageState extends State<FavioratePage> {


  final TextEditingController _searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.018,),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child:ListFaviorates(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}