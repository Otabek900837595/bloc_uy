
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutterpatternbloc2/bloc/home_cubit.dart';

import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../model/post_model.dart';
// import '../view/home_of_view.dart';
import '../views/home_of_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
    super.initState();
  }
  List<Post> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (context, state) {
          if (state is ListPostLoaded) {
            items = state.posts!;
            return viewOfLoaded(items, false);
          }
          if (state is ListPostError) {
            return viewOfError(state.error!);
          }
          return viewOfLoaded(items, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
