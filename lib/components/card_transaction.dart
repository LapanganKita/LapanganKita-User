part of 'components.dart';

class Cardtransaction extends StatelessWidget {
  final Trans transaction;
  Cardtransaction({this.transaction});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                          transaction.partnerid,
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
                          transaction.date,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Ubuntu",
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          transaction.time[0] +
                              " - " +
                              transaction.time[transaction.time.length - 1],
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
                      child: Text(transaction.status),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
