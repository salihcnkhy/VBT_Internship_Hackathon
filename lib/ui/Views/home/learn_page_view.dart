import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './learn_page_view_model.dart';

class LearnPageView extends LearnPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFFFBD04F),
              Color(0xFFFF7F41),
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          // Buraya logo yerleşecek..
          child: Text(
            'LOGO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: _body(context),
    );
  }
}

Widget _body(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      children: <Widget>[
        kelimelerContainer(context),
        ogrenmeyeBaslaButton(context),
      ],
    ),
  );
}

Padding ogrenmeyeBaslaButton(context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 30,
      right: 30,
      top: 40,
    ),
    child: InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            Color(0xFFFBD04F),
            Color(0xFFFF7F41),
          ]),
        ),
        child: Text(
          'Öğrenmeye Başlayalım',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}

Padding kelimelerContainer(context) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
    ),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFFBD04F),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          textYenileAndYenileButton(),
          // Kelimerin gösterileceği yer
        ],
      ),
    ),
  );
}

Padding textYenileAndYenileButton() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 11,
      bottom: 7,
    ),
    child: Row(
      children: <Widget>[
        Expanded(child: Container()),
        Column(
          children: <Widget>[
            Text(
              'Yenile',
              style: TextStyle(
                color: Color(0xFFFF7F41),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Quicksand',
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                CupertinoIcons.refresh,
                color: Color(0xFFFF7F41),
                size: 30,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
