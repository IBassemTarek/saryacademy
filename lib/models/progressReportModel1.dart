class PRM1model {
  String childName;
  String dateE;
  String dateA;
  bool presence;
  String pdf;
  List naps; /////////////////////////////
  int mood; // 0) :)             1) :(                    2)  :|

  int meals; //0- all 1- some 3- none
  // List fluid; // 0- Liquid 1- fluidBottle
  int diaper; // 0 changed  1 urine  2 stool
  int diaperTimes; // 0 changed  1 urine  2 stool
  bool playoutside;
  List naps2;
  // List restroom; // 0- Potty  1- Toilet
  List clothes;
  List activities;
  List notes;
// pdf url
// activities & notes A & E
  PRM1model(
      {this.naps2,
      this.activities,
      this.dateE,
      this.diaperTimes,
      this.dateA,
      this.childName,
      this.clothes,
      this.diaper,
      // this.fluid,
      this.meals,
      this.mood,
      this.naps,
      this.notes,
      this.presence,
      this.playoutside,
      // this.restroom,
      this.pdf});
}

PRM1model prm1modeltest = PRM1model(
  diaperTimes: 1,
  activities: ["bla bla bla bla bla bla", "bla bla bla bla bla bla"],
  notes: ["bla bla bla bla bla bla", "bla bla bla bla bla bla"],
  clothes: ["10:30 AM", ".....AM"],
  diaper: 0,
  playoutside: false,
  meals: 0,
  // fluid: [true, false],
  // restroom: [true, false],
  naps: ["10:30 AM", ".....AM"],
  mood: 0,
  presence: true,
  dateE: "24 May 2021",
  dateA: "24 مايو 2021",
  childName: "Jana",
);
