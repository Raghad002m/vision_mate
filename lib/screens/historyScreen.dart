import 'package:flutter/material.dart';
import '../Data/sqflite.dart';

class historyScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<historyScreen> {
  List<Map<String, dynamic>> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final data = await DBSqflite.instance.getHistory();
    setState(() {
      _history = data;
    });
  }

  Future<void> _clearHistory() async {
    await DBSqflite.instance.clearHistory();
    _loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _clearHistory,
          ),
        ],
      ),
      body: _history.isEmpty
          ? Center(child: Text('No history available.'))
          : ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          final item = _history[index];
          return ListTile(
            title: Text(item['action']),
            subtitle: Text(item['timestamp']),
          );
        },
      ),
    );
  }
}