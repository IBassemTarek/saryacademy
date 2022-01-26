class VaccinationCard {
  final String  vaccination;
  final String  date;
  VaccinationCard({this.date,this.vaccination});
}

class VaccinationModel {
  final List<VaccinationCard> vaccinationCards;
  VaccinationModel({this.vaccinationCards});
}

final List<VaccinationCard> vaccinationCardTest = [
  VaccinationCard(
    vaccination: 'Yellow fever',
    date:  "27 Jan 2020",
  ),
];