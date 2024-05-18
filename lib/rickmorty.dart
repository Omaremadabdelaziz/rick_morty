import 'package:flutter/material.dart';

class rickmorty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print('Name=Morty Smith''Age: 14');
                  },
                  child: Stack(
                      children: [
                        Image.network(
                          'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                          height: 20, width: 20,),
                        const Text(
                          'Morty', style: TextStyle(color: Colors.black),),
                      ])
              ),
            ]),),);
  }}
