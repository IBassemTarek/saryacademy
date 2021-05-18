class MedicalHistoryCard {
  final String  symptom;
  final String  note;
  MedicalHistoryCard({this.note,this.symptom});
}

class MedicalModel {
  final List<MedicalHistoryCard> medicalCards;
  MedicalModel({this.medicalCards});
}

final List<MedicalHistoryCard> medicalHistoryCardTest = [
  MedicalHistoryCard(
    note: 'You may notice this with flash.',
    symptom:  'Red reflex',
  ),
];