// import 'package:appbloc/blocs/internet_bloc.dart';
// import 'package:appbloc/blocs/internet_state.dart';
import 'package:appbloc/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internet connection"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //using both builder and listener through BlocConsumer

              BlocConsumer<InternetCubit, InternetState>(
                listener: (context, state) {
                  if (state == InternetState.Gain) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Connected'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (state == InternetState.Lost) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Not Connected'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state == InternetState.Gain) {
                    return Text("Connected");
                  } else if (state == InternetState.Lost) {
                    return Text("Not Connected");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),

              //using blocbuilder only
              // BlocBuilder<InternetBloc, InternetState>(
              //   builder: (context, state) {
              //     if (state is InternetGainState) {
              //       return Text("Connected");
              //     } else if (state is InternetLostState) {
              //       return Text("Not Connected");
              //     } else {
              //       return CircularProgressIndicator();
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
