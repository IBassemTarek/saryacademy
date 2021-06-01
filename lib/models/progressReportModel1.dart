class PRM1model {
     String  childName;
     String  dateE;
     String dateA;
     bool  presence;
     int  mood;  // 0) :)             1) :(                    2)  :|
     List naps;
     List meals; //0- Breakfast 1-lunch   
     List fluid; // 0- Liquid 1- fluidBottle 
     List diaper;
     List restroom; // 0- Potty  1- Toilet
     List clothes;
     List activities;
     List notes;

  PRM1model({this.activities,this.dateE,this.dateA,this.childName,this.clothes,this.diaper,this.fluid,this.meals,this.mood,this.naps,this.notes,this.presence,this.restroom});
}

PRM1model prm1modeltest = PRM1model(
activities: ["bla bla bla bla bla bla","bla bla bla bla bla bla"],
notes: ["bla bla bla bla bla bla","bla bla bla bla bla bla"],
clothes: ["10:30 AM", ".....AM"],
diaper: ["10:30 AM", ".....AM"],
meals: [true,false],
fluid: [true,false],
restroom: [true,false],
naps: ["10:30 AM", ".....AM"],
mood: 0,
presence: true,
dateE: "24 May 2021",
dateA: "24 مايو 2021",
childName: "Jana",

);