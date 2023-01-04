class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List q = [
  {
    "id": 1,
    "question":
        "after attending this program you will be magically cured from stuttring",
    "options": [
      'that\'s correct ',
      'wrong ,i will have to work\n hard at the exercises to\n improve my speech',
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "How many syllables in word BABY",
    "options": ['One', 'Two', 'Three', 'Four'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "How many syllables in word PARLIAMENT",
    "options": ['One', 'Two', 'Three', 'Four'],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question": "How many syllables in word conduit",
    "options": ['one', 'two', 'three', 'four'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "How many syllables in word denigrate",
    "options": ['d-enigrate', 'den-i-grate', 'd-e-nig-rate', 'denigra-te'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "How many syllables in word annual",
    "options": ['an-nu-al', 'annua-l', 'a-nnu-al', 'ann-ual'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "How many syllables in word corporate",
    "options": ['one', 'two', 'three', 'four'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "How many syllables in word awful",
    "options": ['One', 'Two', 'Three', 'Four'],
    "answer_index": 1,
  },
  {
    "id": 9,
    "question": "How many syllables in word architecture",
    "options": ['One', 'Two', 'Three', 'Four'],
    "answer_index": 3,
  },
];
