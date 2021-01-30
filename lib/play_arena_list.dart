import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:splash_assign/play_arena_model.dart';
import 'package:http/http.dart' as http;

class PlayArenaList extends StatefulWidget {
  @override
  _PlayArenaListState createState() => _PlayArenaListState();
}

class _PlayArenaListState extends State<PlayArenaList> {
  final List<PlayArena> _arenas = [];

  bool _isLoading = false;

  void _fetchArenas() {
    setState(() {
      _isLoading = true;
    });
    _getArenas(limit: 20).then((arenas) {
      _arenas.clear();
      setState(() {
        _arenas.addAll(arenas);
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchArenas();
  }

// DESIGN FOR THE FETCHED DATA COMING FROM API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        brightness: Brightness.light,
        title: Text(
          "Play Arenas",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: AnimatedCrossFade(
        duration: Duration(milliseconds: 300),
        crossFadeState:
            _isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Center(
          child: CircularProgressIndicator(),
        ),
        secondChild: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
              itemCount: _arenas.length,
              shrinkWrap: true,
              separatorBuilder: (ctx, index) => SizedBox(height: 8),
              itemBuilder: (ctx, index) => Card(
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ArenaDetails(
                                arena: _arenas[index],
                              ),
                          fullscreenDialog: true)),
                      title: Text(_arenas[index].name),
                      subtitle: Text(_arenas[index].sports.name),
                      leading:
                          Image.network(_arenas[index].sports.iconBlackUrl),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "${_arenas[index].openTime} - ${_arenas[index].closeTime}"),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

// FETCHING DATA FROM API //

  Future<Iterable<PlayArena>> _getArenas(
      {int offset = 0, int limit = 10}) async {
    try {
      final response = await http.get(
          'http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=$offset&limit=$limit');

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((e) => PlayArena.fromJson(e));
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}

// DESIGN FOR THE DETAILS SCREEN

class ArenaDetails extends StatelessWidget {
  final PlayArena arena;

  const ArenaDetails({Key key, this.arena}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(arena.name, style: TextStyle(color: Colors.black)),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.amber,
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              arena.sports.iconBlackUrl,
            ),
            Text(
              "${arena.sports.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black),
            ),
            Text(
              "Cost: ${arena.costPerSlot}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              "Close time: ${arena.openTime}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              "Close time: ${arena.closeTime}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              "Create on: ${arena.createOn}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              "Days: ${arena.dayOfWeeksOpen}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              "Id: ${arena.id}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
