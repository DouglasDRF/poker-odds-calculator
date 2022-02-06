import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poker_odds_calculator/src/blocs/deck_bloc.dart';
import 'package:poker_odds_calculator/src/blocs/hand_bloc.dart';
import 'package:poker_odds_calculator/src/components/card_deck.dart';
import 'package:poker_odds_calculator/src/components/game_hand.dart';
import 'package:poker_odds_calculator/src/components/opponents_setup.dart';
import 'package:poker_odds_calculator/src/components/rank_probabilities.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  HandBloc _handBloc;
  DeckBloc _cardDeckBloc;
  Random r = new Random();

  _MainViewState() {
   _handBloc = new HandBloc();
    _cardDeckBloc = new DeckBloc();
  }

  @override
  void setState(VoidCallback fn) {
    _handBloc = new HandBloc();
    _cardDeckBloc = new DeckBloc();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF005913)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RankProbabilitiesComponent(_handBloc),
            GameHandComponent(_handBloc),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFA65F08)),
                    shape: MaterialStateProperty.all(CircleBorder()),
                  ),
                  child: Icon(Icons.restart_alt),
                  onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                ),
              ),
              OpponentSetupComponent(_handBloc),
            ]),
            CardDeckComponent(_handBloc, _cardDeckBloc),
          ],
        ),
      ),
    );
  }
}
