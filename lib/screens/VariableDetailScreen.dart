import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VariableDetailScreen extends StatefulWidget {
  VariableDetailScreen(
      {Key? key, this.data, this.isIndicator, this.controllerVal})
      : super(key: key);

  var data;
  var isIndicator;
  String? controllerVal = '';

  @override
  State<VariableDetailScreen> createState() => _VariableDetailScreenState();
}

class _VariableDetailScreenState extends State<VariableDetailScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) =>
    //                   DetailScreen(data: signal,)),
    //         );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  _body() {
    controller = TextEditingController(text: widget.controllerVal);
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          widget.data == true
              ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        widget.isIndicator.toString().contains('CCI')
                            ? 'CCI'
                            : 'RSI',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Set Parameters',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 16),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Period',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 27,
                              width: 130,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: TextField(
                                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]')),],
                                  keyboardType: TextInputType.number,
                                  controller: controller,
                                  onChanged: (val){
                                  },
                                  style: Theme.of(context).textTheme.headline6,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 4),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.data.length,
                  itemBuilder: (ctx, int) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        widget.data[int].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, int) {
                    return Divider(
                      color: Colors.white,
                    );
                  },
                )
        ],
      ),
    );
  }
}
