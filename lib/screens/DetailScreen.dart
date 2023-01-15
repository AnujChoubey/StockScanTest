import 'package:flutter/material.dart';
import 'package:stockscan/data/fetchData.dart';
import 'package:stockscan/model/dataModel.dart';
import 'package:stockscan/screens/VariableDetailScreen.dart';

import '../globals/constants.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, this.data}) : super(key: key);

  var data;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32,
          ),
          Text(widget.data['name'],
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white)),
          const SizedBox(height: 8.0),
          Text(widget.data['tag'],
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: turnGreen(widget.data['color']))),
          SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 16,
          ),
          Text('Criteria:',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontSize: 22)),
          SizedBox(
            height: 16,
          ),
          ...widget.data['criteria'].map((criterion) => Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (criterion['variable'] != null)
                      ..._buildCriteria(criterion),
                    if (criterion['variable'] == null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          criterion['text'],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> _buildCriteria(dynamic criteria) {
    var setVal;
    List<Widget> widgets = <Widget>[];
    var variable = criteria['variable'];
    String text = criteria['text'];
    var getData;

    if (variable != null) {
      variable.forEach((key, value) {
        getData = value['values'] ?? true;
        if (value['type'] == 'value') {
          // Replace the variable with the value
          text = text.replaceAll(key, value['values'][0].toString());
        } else if (value['type'] == 'indicator') {
          var parameter = value['parameter_name'];
          var parameterValue = value['default_value'];
          setVal = parameterValue.toString();
          text = text.replaceAll(key, parameterValue.toString());
        }
      });
    }

    widgets.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VariableDetailScreen(
                    data: getData,
                    isIndicator: widget.data['name'],
                    controllerVal: setVal,
                  )),
            );
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
    return widgets;
  }
}
