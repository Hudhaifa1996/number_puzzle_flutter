import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.brown[100],
          body: SafeArea(
              child: Container(
                  decoration:  BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/assets/slide${context.read<HomeCubit>().slideNumber}.jpg'), fit: BoxFit.fill),
                  ))),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state is HomeMiddle ?
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Padding(
                padding:  const EdgeInsets.fromLTRB(20,0,0,0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.height*0.08,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: FloatingActionButton(
                        backgroundColor: Colors.brown[100],
                        onPressed: () {
                          context.read<HomeCubit>().incSlideNumber();
                        },
                        child: const Text('لا',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.height*0.08,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.brown[100],
                        onPressed: () {
                          context.read<HomeCubit>().result += context.read<HomeCubit>().slideWeight[context.read<HomeCubit>().slideNumber - 2];
                          context.read<HomeCubit>().incSlideNumber();
                        },
                        child: const Text('نعم',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                ),
              ),
            ])

          : state is HomeInitial ? SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
            width: MediaQuery.of(context).size.height*0.08,
            child: FittedBox(
              child: FloatingActionButton(
                  backgroundColor: Colors.brown[100],
                  onPressed: () {
                    context.read<HomeCubit>().incSlideNumber();
                  },
                  child: const Text(
                    'ابدأ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ),
          )
            : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.2),
                  child: Text('الرقم هو ${context.read<HomeCubit>().result} ',
                    textAlign:TextAlign.center ,
                    style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ) ,),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.08,
                  width: MediaQuery.of(context).size.height*0.08,
                  child: FittedBox(
                    child: FloatingActionButton(
                        backgroundColor: Colors.brown[100],
                        onPressed: () {
                          context.read<HomeCubit>().repeat();
                        },
                        child: const Icon(Icons.restart_alt,
                            size: 50
                        )),
                  ),
                )
              ]),
        );
      },
    );
  }
}
