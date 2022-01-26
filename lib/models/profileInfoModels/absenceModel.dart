class AbsenceCard {
  final String month;
  final String days;
  AbsenceCard({this.days,this.month});
}

class AbsenceModel {
  List<AbsenceCard> absenceCards;
  AbsenceModel({this.absenceCards});
}


final List<AbsenceCard> absenceCardTest = [
  AbsenceCard(
    month: 'This month',
    days:  "03 Days",
  ),
  AbsenceCard(
    month: 'Last month',
    days:  "00 Days",
  ),
];