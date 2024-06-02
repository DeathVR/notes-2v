import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  final Function action;
  final String title;
  final String info;
  final String data;
  final bool? isDelete;
  const NotesCard({
    super.key,
    required this.title,
    required this.info,
    required this.data,
    required this.action,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Karla',
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              isDelete == false
                  ? IconButton(
                      onPressed: () => action(),
                      icon: const Icon(
                        Icons.delete,
                        color: Color(0xffD93F3F),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            data,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Karla',
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            info,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Karla',
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
