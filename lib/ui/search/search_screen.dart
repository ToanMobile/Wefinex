import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wefinex/base/super_base_controller.dart';
import 'package:wefinex/repository/model/crypto.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'search_binding.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

enum SortBy { MARKET_CAP, PERFORMERS, VOLUME, ALPHABETICAL }
enum OrderBy { ASC, DESC }

class SearchScreen extends GetView<SearchController> {
  SortBy _sortBy = SortBy.MARKET_CAP;
  OrderBy _orderBy = OrderBy.ASC;
  Color? changeColor;
  TextEditingController _textController = TextEditingController();
  List<CoinEntity> queryList = <CoinEntity>[];
  bool isSearching = false;
  bool isFirst = true;
  bool _containsIgnoreCase(String s1, String s2) {
    return s1.toLowerCase().contains(s2.toLowerCase());
  }

  void _filterSearchResults(String query) {
    List<CoinEntity> tmpList = [];
    if (query.isNotEmpty) {
      isSearching = true;
      controller.cryptos.forEach((element) {
        if (_containsIgnoreCase(element.name ?? "", query) || _containsIgnoreCase(element.diminutive ?? "", query)) {
          tmpList.add(element);
        }
      });
      queryList.clear();
      queryList.addAll(tmpList);
      controller.update();
    } else {
      isSearching = false;
      queryList.clear();
      queryList.addAll(controller.cryptos);
      controller.update();
    }
  }

  void _sort(SortBy sortBy, OrderBy orderBy) {
    print("SORTING: sortBy $sortBy, orderBy $orderBy");
    queryList.sort((a, b) {
      if (orderBy == OrderBy.DESC) {
        CoinEntity tmp = b;
        b = a;
        a = tmp;
      }
      switch (sortBy) {
        case SortBy.ALPHABETICAL:
          if (a.name == null || b.name == null) {
            return -1;
          }
          return (a.name ?? "").compareTo(b.name ?? "");
        case SortBy.MARKET_CAP:
          return double.parse(a.marketCap ?? "").compareTo(double.parse(b.marketCap ?? ""));
        case SortBy.PERFORMERS:
          double? aval = double.tryParse(a.changeValue ?? "");
          double? bval = double.tryParse(b.changeValue ?? "");
          if (aval == null || bval == null) {
            return -1;
          } else {
            return aval.compareTo(bval);
          }
        case SortBy.VOLUME:
          return double.parse(a.totalVolume ?? "").compareTo(double.parse(b.totalVolume ?? ""));
      }
    });
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          'Tìm kiếm coin',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: buildWidgetMarket(),
    );
  }

  buildWidgetMarket() => Column(
        children: [
          /* ============ SEARCH BAR ============ */
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TextField(
                    //TODO: FIND A WAY TO OVERRIDE COLOR PROPERTY OF textSelectionHandle
                    controller: _textController,
                    onChanged: _filterSearchResults,
                    cursorColor: Common().color.blueAccent,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14.0,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Common().color.blueAccent,
                      ),
                      hintText: 'Search for cryptos (Bitcoin, Ethereum, etc.)',
                      hintStyle: TextStyle(
                        color: Common().color.blueAccent,
                        fontStyle: FontStyle.italic,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Common().color.blueAccent,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Common().color.blueAccent,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Common().color.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                /* ============ SORT BUTTON ============ */
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.sort,
                      color: Common().color.blueAccent,
                      size: 25.0,
                    ),
                    onPressed: () {
                      _buildSortModal();
                    },
                  ),
                ),
              ],
            ),
          ),
          /* ============ CRYPTOS LIST ============ */
          Expanded(
            child: controller.obx(
              (state) {
                controller.cryptos = state!;
                if (queryList.length == 0 && !isSearching) {
                  queryList.addAll(controller.cryptos);
                } else {
                  queryList.add(CoinEntity());
                }
                return ListView.separated(
                  itemCount: queryList.length,
                  itemBuilder: (context, index) {
                    if (index == queryList.length - 1) {
                      return SizedBox(
                        height: 60.0,
                      );
                    } else {
                      CoinEntity currentCrypto = queryList.elementAt(index);
                      changeColor = (double.tryParse(currentCrypto.changeValue ?? "") == null
                          ? Colors.grey[400]
                          : (double.parse(currentCrypto.changeValue ?? "") >= 0)
                              ? Colors.greenAccent[700]
                              : Colors.redAccent[700]);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/crypto_details', arguments: currentCrypto);
                          },
                          title: Text(
                            currentCrypto.name ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300],
                            ),
                          ),
                          subtitle: Text(
                            currentCrypto.diminutive ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(currentCrypto.logoUrl ?? ""),
                            backgroundColor: Colors.transparent,
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                double.parse(currentCrypto.price ?? "").toStringAsFixed(2) + '€/\$',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                ),
                              ),
                              Text(
                                currentCrypto.change ??
                                    "" +
                                        ' ' +
                                        (double.tryParse(currentCrypto.changeValue ?? "") == null
                                            ? 'N/A'.toString()
                                            : double.parse(currentCrypto.changeValue ?? "").abs().toStringAsFixed(2)) +
                                        '%',
                                style: TextStyle(
                                  color: changeColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey[200],
                  ),
                );
              },
            ),
          ),
        ],
      );

  void _buildSortModal() {
    showModalBottomSheet(
        context: Get.context!,
        backgroundColor: Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sort by",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.grey[300],
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: ListTile.divideTiles(
                      context: Get.context!,
                      tiles: [
                        _buildRowSort("Market Cap", SortBy.MARKET_CAP),
                        _buildRowSort("Performers", SortBy.PERFORMERS),
                        _buildRowSort("Volume", SortBy.VOLUME),
                        _buildRowSort("Alphabetical", SortBy.ALPHABETICAL),
                      ],
                    ).toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildRowSort(String title, SortBy sortBy) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: (_sortBy == sortBy) ? FontWeight.bold : FontWeight.normal,
          color: Colors.grey[300],
        ),
      ),
      trailing: Container(
        child: ToggleButtons(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
          color: Colors.grey[300],
          selectedColor: Colors.grey[900],
          fillColor: Common().color.blueAccent,
          isSelected: (_sortBy != sortBy)
              ? [false, false]
              : (_orderBy == OrderBy.ASC)
                  ? [true, false]
                  : [false, true],
          children: [
            Column(
              children: [
                Icon(
                  Icons.arrow_drop_up,
                ),
                Text(
                  'ASC',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.arrow_drop_down,
                ),
                Text(
                  'DESC',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
          onPressed: (index) {
            _sortBy = sortBy;
            _orderBy = OrderBy.values[index];
            _sort(_sortBy, _orderBy);
            Get.back();
          },
        ),
      ),
    );
  }
}
