import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/item_model.dart';

import '../../widgets/item_button.dart';

enum TweetMode {
  add,
  edit,
}

class TweetPage extends StatefulWidget {
  final ItemModel? itemModel;
  final TweetMode mode;

  const TweetPage({
    super.key,
    this.itemModel,
    this.mode = TweetMode.add,
  });

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  final tweetsCollection = FirebaseFirestore.instance.collection('tweets');

  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();

  // Called only on first time
  @override
  void initState() {
    if (widget.mode == TweetMode.edit) {
      if (widget.itemModel != null) {
        _title.text = widget.itemModel!.title;
        _description.text = widget.itemModel!.description;
        _date.text = widget.itemModel!.date;
      }
    }
    super.initState();
  }

  // Called on first time,
  // then on setState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.mode == TweetMode.add ? 'New Item' : 'Edit Item',
          ),
        ),
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _title,
                      decoration: const InputDecoration(label: Text('Title')),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      maxLines: 5,
                      controller: _description,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _date,
                      decoration: const InputDecoration(
                        label: Text('Date'),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ItemButton(
                  title: widget.mode == TweetMode.add ? 'Save' : 'Update',
                  onItemPressed: () async {
                    /// This is a basic validation to check whether the
                    /// `TextField` has inputs from the user.
                    if (_title.text.isNotEmpty &&
                        _description.text.isNotEmpty &&
                        _date.text.isNotEmpty) {
                      // Add
                      await tweetsCollection.add({
                        "title": _title.text,
                        "description": _description.text,
                        "date": _date.text,
                      });

                      if (!mounted) return;
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
