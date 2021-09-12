import 'package:flutter/material.dart';
import '../provider/taskedapp_provider.dart';
import '../models/Task.dart';
import 'package:provider/provider.dart';

class ItemView extends StatefulWidget {
  final Task item;

  ItemView({this.item});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null)
      _textEditingController.text = widget.item.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Create New Task'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'New Task',
                  contentPadding: EdgeInsets.all(20),
                ),
                controller: _textEditingController,
                onFieldSubmitted: (value) => submit(),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(height: 100),
              InkWell(
                onTap: submit,
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange.shade900,
                      border: Border.all(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: Text(
                    'Save Task',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
 
  void submit() {
    String description = _textEditingController.text;
    description = description.trimLeft();
    if (description != null && description.isNotEmpty) {
      if (widget.item != null) {
        context.read<StateProvider>().editTask(widget.item, description);
      } else {
        context.read<StateProvider>().addNewTask(description);
      }
      Navigator.pop(context, _textEditingController.text);
    } else {
      showAlertDialog(
          context); // if the string input is empty we will show a alert box with the same
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () => {Navigator.of(context).pop()},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Uh-Oh!"),
      content: Text("Please enter a valid input"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
