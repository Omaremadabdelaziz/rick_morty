import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/rickymorty_cubit.dart';

class rickmorty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      RickymortyCubit()
        ..getData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'Characters',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<RickymortyCubit, RickymortyState>(
          builder: (context, state) {
            if (state is RickymortyLoading) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (state is RickymortyError) {
              return Text('error ${state.error}');
            }else if(state is RickymortySuccess){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: state.response.data['results'].length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 5);
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                RickymortyCubit.get(context).getData();
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.network(
                                    fit: BoxFit.fill,
                                    height: 250,
                                    width: double.infinity,
                                    '${state.response
                                        .data['results'][index]['image']}',
                                  ),
                                  Opacity(
                                    opacity: 0.7,
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.grey,
                                      child: Center(
                                        child: Text(
                                          '${state.response
                                              .data['results'][index]['name']}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
              );
            }else{
              return const SizedBox();
            }

          },
        ),
      ),
    );
  }
}
