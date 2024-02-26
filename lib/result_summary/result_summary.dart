import 'package:flutter/material.dart';
import 'package:quiz_app/result_summary/summary_item.dart';

class ResultSummary extends StatelessWidget{
  const ResultSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return SummaryItem(data);
          },
        ).toList()
        ),
      ),
    );
  }
}