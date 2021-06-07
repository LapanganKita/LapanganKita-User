part of 'components.dart';

class Cardtransaction extends StatefulWidget {
  final Trans transaction;
  Cardtransaction({this.transaction});

  @override
  _CardtransactionState createState() => _CardtransactionState();
}

class _CardtransactionState extends State<Cardtransaction> {
  UploadTask task;
  File file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAlertDialog(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 720,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.grey, offset: Offset(3, 3), blurRadius: 3)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://images.unsplash.com/photo-1464983308776-3c7215084895?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
                height: 150,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            widget.transaction.partnerid,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            widget.transaction.date,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Ubuntu",
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            widget.transaction.time[0] +
                                " - " +
                                widget.transaction
                                    .time[widget.transaction.time.length - 1],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Ubuntu",
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text("Status:"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(widget.transaction.status),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  showAlertDialog(BuildContext context) async {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("AlertDialog"),
          content: Text("Upload"),
          actions: [
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Continue"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UploadImagetoFirebase();
                }));
              },
            )
          ],
        );
      },
    );
  }
}
