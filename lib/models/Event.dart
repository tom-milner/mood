class Event {
  final String title;
  final String notes;
  final int rating;

  final int millisFromEpoch;


  Event(this.title, this.notes, this.rating, this.millisFromEpoch);

  getDateTime() {
    return
        DateTime.fromMillisecondsSinceEpoch(millisFromEpoch, isUtc: true);
  }
}
