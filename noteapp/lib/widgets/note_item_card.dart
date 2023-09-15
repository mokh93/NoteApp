import 'package:flutter/material.dart';

import 'card_listtile.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color(0xffffcd7a),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CardListTile(),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                '15 ,sept , 2023',
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
