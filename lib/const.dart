import 'package:flutter/material.dart';

const Color kHeaderColor = Color(0xF7AA30);
const Color kbackgroundColor = Color(0x041056);
const Color kbackgroundColor2 = Color(0x00B2FF);
const Color kGradColor1 = Color(0x671D89);
const Color kGradColor2 = Color(0x101856);
const Color kText1Color = Color(0x1C9CD8);
const Color kText2Color = Color(0x004A99);
const Color kText3Color = Color(0x7C7C7B);
const Color kText4Color = Color(0x0070E9);
const Color kGreyColor = Color(0xC4C4C4);
const Color kIconColor = Color(0xDB9835);
const Color kGoodColor = Color(0x49C929);
const Color kWorkingColor = Color(0x0083CC);
const Color kNotApplicableColor = Color(0xCC0000);

const int mood = 0;
const List<String> reportTypes = [
  'S1 student report',
  'S2 student report',
  'S3 student report',
  'S4 student report',
];

const List<String> educationalSkillsE = [
  "I can understand and comprehend the lesson clearly in the assigned time.",
  "I can answer my teacher’s questions correctly",
  "I do my homework correctly.",
  "I can assume and connect the content presented with things around properly.",
  "I can recall the information that was formerly presented by the teacher.",
  "I can follow my teacher’s guidance properly.",
];

const List<String> educationalSkillsA = [
  "يمكنني فهم الدرس وفهمه بوضوح في الوقت المحدد",
  "يمكنني الإجابة على أسئلة أستاذي بشكل صحيح",
  "أنا أقوم بواجبي المنزلي بشكل صحيح",
  "يمكنني افتراض وربط المحتوى المقدم بالأشياء المحيطة بشكل صحيح",
  "أستطيع أن أتذكر المعلومات التي قدمها المعلم سابقًا",
  "يمكنني اتباع إرشادات أستاذي بشكل صحيح",
];

const List<String> socialEmotionalSkillsE = [
  "I respect and show concern for people and things around me.",
  "I accept and respond to my teacher’s authority.",
  "I play and share with other children.",
  "I have a good self-image.",
  "I am happy and cheerful at school. ",
  "I have appropriate control over my feelings.",
];

const List<String> socialEmotionalSkillsA = [
  "أحترم وأبدى اهتماما بالناس والأشياء من حولي",
  "أقبل سلطة أستاذي وأستجيب لها",
  "ألعب وأشارك مع الأطفال الآخرين",
  "لدي صورة ذاتية جيدة",
  "أنا سعيد ومبهج في المدرسة",
  "لدي سيطرة مناسبة على مشاعري",
];

const List<String> workHabitsE = [
  "I get involved in and attend to activities.",
  "I can follow directions.",
  "I respond well to teacher’s suggestions.",
  "I seek only my fair share of teacher’s attention.",
  "I am a curious child.",
  "I ask questions.",
  "I can make choices.",
];

const List<String> workHabitsA = [
  "أنا أشارك في الأنشطة وأحضرها",
  "يمكنني اتباع التوجيهات",
  "أستجيب جيدًا لاقتراحات المعلم",
  "أسعى فقط للحصول على نصيبي العادل من انتباه المعلم",
  "أنا طفل فضولي",
  "أطرح الأسئلة",
  "يمكنني الاختيار",
];

const List<String> artSkillsE = [
  "Using crayons.",
  "Using scissors.",
  "Painting.",
  "Pasting.",
  "Puzzles.",
  "Building with blocks.",
  "Manipulating zippers.",
  "Manipulating buttons.",
  "I participate in art activities.",
  "I can use my art materials properly.",
  "I help clean up messes after my art projects.",
];

const List<String> artSkillsA = [
  "باستخدام الطباشير الملون",
  "باستخدام المقص",
  "تلوين",
  "لصق",
  "الألغاز",
  "البناء بالكتل",
  "التلاعب بالسحابات",
  "معالجة الأزرار",
  "أشارك في الأنشطة الفنية",
  "يمكنني استخدام المواد الفنية الخاصة بي بشكل صحيح",
  "أساعد في تنظيف الفوضى بعد مشاريعي الفنية",
];

const List<String> speakingSkillsE = [
  "I speak clearly.",
  "I communicate in sentences.",
  "I can answer some questions.",
  "I wait for my turn when speaking in a group.",
  "I can use language to communicate",
  "my wants and ideas.",
];

const List<String> speakingSkillsA = [
  "أنا أتحدث بوضوح",
  "أتواصل في جمل",
  "أستطيع أن أجيب على بعض الأسئلة",
  "أنتظر دوري عندما أتحدث في مجموعة",
  "يمكنني استخدام اللغة للتواصل",
  "رغباتي وأفكاري",
];

const List<String> musicSkillsE = [
  "I participate in group singing.",
  "I enjoy doing musical activities.",
  "I am learning to repeat rhythmic patterns. ",
];

const List<String> musicSkillsA = [
  "أشارك في الغناء الجماعي",
  "أنا أستمتع بالأنشطة الموسيقية",
  "أنا أتعلم تكرار الأنماط الإيقاعية",
];

const List<String> mealsList = ["all", "some", "none"];
const List<String> diaperList = ["As is", "changed"];
const List<String> playingList = ["didn't play", "Played"];
const List<String> playingListA = [
  "لم يلعب",
  "لعب",
];
const List<String> dateA = [
  "يناير",
  "فبراير",
  "مارس",
  "ابريل",
  "مايو",
  "يونيو",
  "يوليو",
  "أغسطس",
  "سبتمبر",
  "أكتوبر",
  "نوفمبر",
  "ديسمبر",
];

const List<String> userAlertsA = [
  'اريد التحدث معك',
  "يمكنك أن ترسل لي بعض الصور؟",
  "هل طفلي بخير؟"
];
const List<String> userAlertsE = [
  'I want to talk with you',
  "Can you send me some photos?",
  "Is my child doing well?"
];
const List<String> adminAlertsEQ1 = [
  'Free call now.',
  "Please WhatsApp only now.",
  "Busy now."
];
const List<String> adminAlertsEQ2 = [
  'Free, I will send you now.',
  "Busy, at the end of the day."
];
const List<String> adminAlertsEQ3 = [
  'Yes, he/she is.',
  "No, I will give you a call."
];

const List<String> adminAlertsAQ1 = [
  'قم بالإتصال الآن',
  "رجاء تواصل معي عن طريق الواتس آب فقط",
  "آسف إني مشغول الآن"
];
const List<String> adminAlertsAQ2 = [
  'حسنا ، سأرسل لك الآن',
  "مشغول ، في نهاية اليوم"
];
const List<String> adminAlertsAQ3 = ['نعم', "لا ، سأتصل بك"];
const List<String> dateE = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const List<String> mealsListA = ["الكل", "البعض", "لا شئ"];
const List<String> diaperListA = ['لم يتغير', "تم التغيير"];
const List<String> fluidList = ["Liquid", "Bottle"];

const List<String> fluidListA = ["سائل", "ببرونة"];

const List<IconData> moods = [
  Icons.sentiment_satisfied_alt,
  Icons.sentiment_dissatisfied,
  Icons.sentiment_very_dissatisfied_sharp,
];

const List<String> restroom = ["Potty", "Toilet"];

const List<String> restroomA = ["القصرية", "المرحاض"];

const List<String> prS2ESocialSkills = [
  "Plays/ works well with others",
  "Shares and take turns",
  "Respects property of others",
  "Displays self confidence",
  "Displays self-control",
  "Has adequate attention span",
  "Is Curious",
  "Is observant",
  "Works/ plays well independently",
  "Seeks help when needed",
  "Uses material appropriately",
  "Values own work",
  "Cleans up after work/play period"
];

const List<String> prS2EPersonalDevelopment = [
  "Knows full name",
  "Knows age",
  "Knows address",
  "Knows birthday",
  "Knows phone number",
];

const List<String> prS2EPhysicalDevelopment = [
  "Controls pencils/ scissors well",
  "Glue neatly",
  "Runs",
  "Jumps",
  "Climbs",
  "Catches a ball",
  "Throws a ball",
  "Kicks a ball",
  "Shows balance",
  "Shows partially to left, right"
];

const List<String> prS1ESocialSkills = [
  "Follows rules",
  "Respects property",
  "Plays well with others",
  "Shares and take turns",
  "Has adequate attention span",
  "Cleans up after work or play period",
  "Gets involved in and attend to activities.",
];

const List<String> prS1EPersonalDevelopment = [
  "Knows full name",
  "Knows age",
  "Knows phone number",
];

const List<String> prS1EPhysicalDevelopment = [
  "Uses scissors",
  "Uses crayons",
  "Paints",
  "Puzzles",
  "Pastes",
  "Runs",
  "Jumps in place",
  "Alternates feet on stairs",
  "Catches a ball",
  "Throws a ball",
];

const List<String> prS1ASocialSkills = [
  "یلعب بشكل جید مع الآخرین",
  "الانخراط في الأنشطة وحضورھا",
  "یحترم ممتلكات الآخرین",
  "یشارك ویتناوب",
  "فترة تركيز ملائمة لسنه",
  "یتبع التعلیمات",
  "یرتب المكان بعد العمل أو اللعب",
];

const List<String> prS1APersonalDevelopment = [
  "یعرف اسمھ بالكامل",
  "یعرف عمره",
  "يعرف رقم الهاتف",
];

const List<String> prS1APhysicalDevelopment = [
  "يستخدم المقص",
  "یستخدم الألوان",
  "یلون",
  "تكوین قطع بازل",
  "يستخدم اللزق",
  "یجري",
  "یقفز في مكانھ",
  "تبدیل القدمین على الدرج",
  "یمسك كرة",
  "یرمي الكرة",
];

const List<String> prS2ASocialSkills = [
  "یلعب بشكل جید مع الآخرین",
  "یشاﺮك ﻭیتناﻮب",
  "یحترم ممتلكات الآخرین",
  "یظﮭر ﺍلثقة بالنفس",
  "یظﮭر ضبط ﺍلنفس",
  "لديه فترﺓ تركیز كافیة",
  "لیديه ﺍلفضوﻝ",
  "ملاحظ",
  "یستطیع أن یعمل ﺃﻭ ، ﻭ یلعب بشكل مستقل",
  "یطلب ﺍلمساعدﺓ عند ﺍلحاجة",
  "یستخدﻡ الأدوات ﻭﺍللعب بشكل مناسب",
  "یقدﺭ ﺍعماله",
  "یرتب ﺍلمكاﻥ بعد ﺍلعمل ﺃﻭ ﺍللعب",
];

const List<String> prS2APersonalDevelopment = [
  "یعرف اسمھ الكامل",
  "یعرف عمره",
  "یعرف عنوانھ",
  "یعرف تاریخ میلاده",
  "يعرف رقم الهاتف"
];

const List<String> prS2APhysicalDevelopment = [
  "یجید التحكم بأقلام الرصاص / المقص",
  "یجید استخدام اللزق",
  "یجري",
  "یقفز",
  "یتسلق",
  "يمسك الكرة",
  "يرمي الكرة",
  "يركل الكرة",
  "يظهر التوازن",
  "يظهر جزئيا إلى اليسار ، اليمني",
];

BoxDecoration roundedContainer({double radius, Color color}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    color: color,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

ThemeData textData() {
  return ThemeData(
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: "arialRounded",
          fontSize: 24,
          color: kText1Color,
        ),
        subtitle1: TextStyle(
          fontFamily: "arialBold",
          fontSize: 17,
          color: kText1Color,
        ),
        bodyText1: TextStyle(
          fontFamily: "arial",
          fontSize: 18,
          color: kText1Color,
        ),
        subtitle2: TextStyle(
          fontFamily: "almarai",
          fontSize: 18,
          color: kText1Color,
        ),
      ),
      backgroundColor: Colors.white);
}
