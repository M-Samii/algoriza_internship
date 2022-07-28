import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Component/Constants.dart';
import '../../Component/List _tem.dart';
import '../../Component/my_button.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../AddTaskScreen/AddTaskScreen.dart';

class AllTaskScreen extends StatelessWidget {

  const AllTaskScreen({Key? key}) : super(key: key);
//neeeed to be edit
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(BuildContext context,AppStates state){},
      builder:(BuildContext context,AppStates state) {
        return ListView.separated(
            itemCount: list.length,
            // The list items
            itemBuilder: (context, index) {
              return ListItemToDO(model:
              list[index],


              );
            },
            // The separators
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              );
            });
      },

    );

  }
}
