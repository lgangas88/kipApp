import 'package:kip_app/models/kip_type_model.dart';

class QuestionNAnswer {
  String question;
  String answer;

  QuestionNAnswer({this.answer, this.question});
}

class UserPasswordType extends KipType {

  final int idType = 1;
  String title;
  List<QuestionNAnswer> questionNAnswerList;
  String hint;
  String user;
  String password;

  UserPasswordType({this.title, this.questionNAnswerList, this.hint, this.password, this.user});
}