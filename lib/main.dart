import 'package:flutter/material.dart';

List data = [];

//sizing for headers, row headers, rows, and columns
final double pageHeaderHeight = 80;
final double headerHeight = 60;
final double rowHeaderHeight = 50;
final double rowHeight = 40;
final double columnSideMargins = 20;
final double columnWidth = 150 + (columnSideMargins*2);

//colors for headers, row headers, and rows
final pageHeaderColor = Color.fromRGBO(51, 102, 153, 1);
final headerColor = Color.fromRGBO(0, 102, 204, 1);
final rowHeaderColor = Color.fromRGBO(51, 153, 255, 1);
final rowColor = Color.fromRGBO(153, 204, 255, 1);

final pageHeaderFontColor = Colors.white;
final headerFontColor = Colors.white;
final rowHeaderFontColor = Colors.white;
final rowFontColor = Colors.white;

loadData() async {
  int rowCount = 100;

  for(int i=1; i <= rowCount; i++){
    data.add({
      'row' : i,
      'col_1':'Column 1',
      'col_2':'Column 2',
      'col_3':'Column 3',
      'col_4':'Column 4',
      'col_5':'Column 5',
      'col_6':'Column 6',
    });
  }
}

void main(){
  loadData(); //load the initial data

  runApp(
    MaterialApp(
      home: DataView(),
      theme: ThemeData(scaffoldBackgroundColor:rowColor),
    ),
  );
}

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

ScrollController _header_controller = ScrollController();
ScrollController _row_controller = ScrollController();

class _DataViewState extends State<DataView>{
  @override
  Widget build(BuildContext context){

    //scroll headers to match scrolling data
    _row_controller.addListener((){
      _header_controller.jumpTo(_row_controller.offset);
    });

    return Scaffold(
        appBar: AppBar(title:Text('Cool Data View')),
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
                scrollDirection:Axis.vertical,
                child: Stack(
                    children:[
                      Positioned(
                        top: headerHeight + pageHeaderHeight, //Should be set to the same height as the header so it's positioned directly under it
                        child: Column(children: data.asMap().map((k, v) => MapEntry(k,
                            Container(
                              height: rowHeaderHeight,
                              margin:EdgeInsets.only(bottom:rowHeight),
                              padding:EdgeInsets.only(left:columnSideMargins),
                              width:MediaQuery.of(context).size.width,
                              color:rowHeaderColor,
                              child:Align(alignment:Alignment.centerLeft, child:Text('Row Header ' + v['row'].toString(), style:TextStyle(color:rowHeaderFontColor, fontWeight:FontWeight.bold, fontSize:16)))
                            )
                        )).values.toList()
                      )
                    ),

                    SingleChildScrollView(scrollDirection:Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        controller: _row_controller,
                        child:Container(
                            padding:EdgeInsets.only(top: (rowHeaderHeight + headerHeight + pageHeaderHeight) - (rowHeaderHeight/2) ),
                            child: Column(children:[
                              Column(children: data.asMap().map((k, v) => MapEntry(k,
                                  Container(
                                    height:k==data.length-1?rowHeight:rowHeight+rowHeaderHeight,
                                    margin:k==data.length-1?EdgeInsets.only(top:rowHeaderHeight/2):EdgeInsets.only(top:0),
                                    child:Row(
                                      children:[
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_1'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_2'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_3'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_4'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_5'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                        Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Row ' + v['row'].toString() + ' ' + v['col_6'].toString(), style:TextStyle(color:rowFontColor)) ) ),
                                      ]
                                    )
                                  )
                              )).values.toList())
                            ])
                        )
                    )
                  ]
                )
            ),

            Container(
              color:headerColor,
              height:headerHeight,
              margin:EdgeInsets.only(top:pageHeaderHeight),
              child: SingleChildScrollView(
                controller: _header_controller,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection:Axis.horizontal,
                child:Row(
                  children:[
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 1', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 2', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 3', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 4', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 5', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                    Container(width:columnWidth, padding:EdgeInsets.only(left:columnSideMargins, right:columnSideMargins), child:Align(alignment:Alignment.centerLeft, child:Text('Column Header 6', style:TextStyle(fontWeight:FontWeight.bold, color:headerFontColor, fontSize:17)) ) ),
                  ]
                )
              )
            ),

            Container(
              width:MediaQuery.of(context).size.width,
              height:pageHeaderHeight,
              child: Center(child:Text('Unique Data View with a\nFixed Header and Fixed Row Headers', textAlign:TextAlign.center, style:TextStyle(color:pageHeaderFontColor, fontSize:20, fontWeight:FontWeight.bold)) ),
              color:pageHeaderColor,
            ),
          ]
        )
      )
    );
  }
}
