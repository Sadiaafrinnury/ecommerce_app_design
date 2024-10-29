import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      padding: EdgeInsets.symmetric(
          horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for More Products",
                  border: InputBorder.none,
                ),
                onChanged: (value) {},
              ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic)
          ),
        ],
      ),
    );
  }
}
