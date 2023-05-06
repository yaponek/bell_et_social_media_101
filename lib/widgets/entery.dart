import 'package:flutter/material.dart';
import '../constants/coors.dart';
import '../model/entry_data.dart';
import '../classes/encryption.dart';

class Entery extends StatelessWidget {
  final EnteryData enteryData;

  const Entery({Key? key, required this.enteryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          var encrypted =
              Encryption.instance.encrypt('my value to be encrypted');
          print(encrypted);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          enteryData.complited ? Icons.check : Icons.access_time_sharp,
          color: bellDarkGreen,
        ),
        title: Text(
          enteryData.detail.toString(),
          style: TextStyle(
            fontSize: 16,
            color: bellBlack,
            decoration:
                enteryData.complited ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: bellYellow, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.red,
            iconSize: 16,
            icon: const Icon(Icons.delete),
            onPressed: () {
              print('I Read a comand to delete this Entery');
            },
          ),
        ),
      ),
    );
  }
}
