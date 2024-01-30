import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keystatus/utils/constants/app_theme.dart';

class TableDataWidget extends StatelessWidget {
  final List<Map<String, dynamic>> tableHeader;
  final List<Map<String, dynamic>> tableData;
  final double? tableColumnWidth;
  final double? tableRowHeight;
  final double? borderRadius;
  final Color? borderColor;
  final Color? dividerColor;
  final Color? tabledataColor;
  final Color? headerColor;
  final Color? cardColor;
  late MainAxisAlignment tableMainAxisAlignment;
  final _scrollController = ScrollController();
  double screenWidth = 0.0;
  TableDataWidget(
      {Key? key,
      required this.tableHeader,
      required this.tableData,
      this.tableColumnWidth,
      this.tableRowHeight,
      this.borderRadius,
      this.borderColor,
      this.dividerColor,
      this.tabledataColor,
      this.headerColor,
      this.cardColor})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    tableMainAxisAlignment = screenWidth < 500
        ? MainAxisAlignment.start
        : MainAxisAlignment.spaceBetween;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              constraints: BoxConstraints(
                  minWidth: (screenWidth > 800.0)
                      ? 842.0
                      : (tableColumnWidth ?? 904.0) * tableHeader.length + 92,
                  maxWidth: (constraints.maxWidth < 845)
                      ? 900.0
                      : constraints.maxWidth - 5),
              width: constraints.maxWidth,
              child: Column(
                children: [
                  //TABLE HEADER
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(borderRadius ?? 8.0),
                            topLeft: Radius.circular(borderRadius ?? 8.0)),
                        color: headerColor ?? Theme.of(context).hoverColor,
                        border: Border.all(
                            color:
                                tabledataColor ?? Theme.of(context).hintColor)),
                    height: tableRowHeight ?? 50,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: tableMainAxisAlignment,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: tableHeader.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              margin:
                                  const EdgeInsets.only(top: 15, left: 15.0),
                              width: tableColumnWidth ?? 120,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      maxLines: 2,
                                      tableHeader[index]['title'].toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Proxima Nova',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  //SORT COLUMN
                                  Visibility(
                                    visible: tableHeader[index]['sort'],
                                    child: IconButton(
                                        padding: const EdgeInsets.only(
                                            bottom: 20, right: 20),
                                        onPressed: () async {
                                          sortColumn(
                                              tableHeader[index]['title']);
                                          print(tableData);
                                        },
                                        icon: Icon(Icons.arrow_drop_down)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // TABLE DATA
                  tableDataWidget(context)
                ],
              ),
            ),
          ),
        );
      })
    ]);
  }

  tableDataWidget(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height -
              (screenWidth >= 1024 ? 160 : 250.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius ?? 8.0),
            bottomRight: Radius.circular(borderRadius ?? 8.0)),
        border: Border.all(color: borderColor ?? Theme.of(context).hintColor),
        color: cardColor,
      ),
      //CREATE A LISTVIEW FOR TABLE DATA
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: tableData.length,
        itemBuilder: (context, index) {
          var data = tableData[index];
          return Container(
            height: tableRowHeight ?? 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.0,
                        color: dividerColor ?? AppTheme.onBoardingGrey))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: tableMainAxisAlignment,
              children: makeWidgetChildren(data, context),
            ),
          );
        },
      ),
    );
  }
//CREATE COLUMNS CONTAINER FOR EACH ROW
  List<Widget> makeWidgetChildren(jsonObject, BuildContext context) {
    List<Widget> children = [];
    jsonObject.keys.forEach((key) => {
          children.add(
            Container(
                margin: const EdgeInsets.only(left: 15.0),
                width: tableColumnWidth ?? 120,
                child: Text(
                  '${jsonObject[key]}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: tabledataColor ??
                        Theme.of(context).unselectedWidgetColor,
                    fontFamily: 'Proxima Nova',
                  ),
                )),
          )
        });
    return children;
  }

  //SORT FUNCTION FOR SORTING COLUMNS ALPHABETICAL WISE
  List<Map<String, dynamic>> sortColumn(columnName) {
    print(columnName);
    tableData.sort((a, b) {
      return (a[columnName].toLowerCase().compareTo(b[columnName].toLowerCase()));
    });
    return tableData;
  }
}
