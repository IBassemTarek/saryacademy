// 0- غير مقاس 
// 1- تقدم جيد
// 2- جاري العمل عليها
// 3- غير مطابق
class PRM2Mounth1 {
   List socialSkills; // 0)unmeasured             1)Good Progress                2)Working on Skill           3)Not Applicable
   List personalDevelopment;  
   List physicalDevelopment;

  PRM2Mounth1({this.socialSkills,this.personalDevelopment,this.physicalDevelopment});
}


class PRM2Mounth2 {
   List socialSkills; // 0)unmeasured             1)Good Progress                2)Working on Skill           3)Not Applicable
   List personalDevelopment;  
   List physicalDevelopment;

  PRM2Mounth2({this.socialSkills,this.personalDevelopment,this.physicalDevelopment});
}

class PRM2Mounth3 {
   List socialSkills; // 0)unmeasured             1)Good Progress                2)Working on Skill           3)Not Applicable
   List personalDevelopment;  
   List physicalDevelopment;

  PRM2Mounth3({this.socialSkills,this.personalDevelopment,this.physicalDevelopment});
}

class PRM2Listmodel {
      String studentNameA;
      String studentNameE;
      String month1E;
      String month2E;
      String month3E;
      String month1A;
      String month2A;
      String month3A;
      String pdf;
  PRM2Listmodel({this.month1E,this.month2E,this.month3E,this.studentNameA,this.studentNameE,this.month1A,this.month2A,this.month3A,this.pdf});
}


PRM2Listmodel prM2modeltest = PRM2Listmodel(
studentNameA:'جني',
studentNameE:'jana',
month1A: 'مايو',
month1E: 'May',
month2A: 'يونيو',
month2E: 'June',
month3A: 'يوليو',
month3E: 'July',
);

PRM2Mounth1 prMounth1 = PRM2Mounth1(
  personalDevelopment: [0,0,0],
  physicalDevelopment:  [0,0,0,0,0,0,0,0,0,0],
  socialSkills: [0,0,0,0,0,0,0,]
);
PRM2Mounth2 prMounth2 =PRM2Mounth2(
  personalDevelopment: [1,2,2],
  physicalDevelopment:  [1,2,2,3,2,3,2,2,1,2],
  socialSkills: [1,2,2,3,2,3,2,]
);
PRM2Mounth3 prMounth3 =PRM2Mounth3(
  personalDevelopment: [1,1,1],
  physicalDevelopment:  [1,1,1,1,1,2,1,1,1,1],
  socialSkills: [1,1,1,1,1,2,1,]
);