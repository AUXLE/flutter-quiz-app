class Question{
  const Question(this.text, this.options);

  final String text;
  final List<String> options;

  List<String> getShuffleList(){
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}