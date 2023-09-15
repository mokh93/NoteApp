import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  const CardListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Great Programmer',
        style: TextStyle(
          color: Colors.black,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          'one day mohammed Khalid is the best',
          style: TextStyle(
            color: Colors.black.withOpacity(.4),
            fontSize: 18,
          ),
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
