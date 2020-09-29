import 'package:kip_app/models/kip_model.dart';
import 'package:kip_app/models/kip_type_model.dart';
import 'package:kip_app/models/user_password_type_model.dart';

final categoryList = [
  KipType(id: 1, name: 'Usuario y Contraseña'),
  KipType(id: 2, name: 'Anotaciones'),
  KipType(id: 3, name: 'Links'),
];

final kips = [
  Kip(
    id: 1,
    title: 'Google Analytics',
    avatar: 'https://i.pinimg.com/originals/c0/44/ac/c044ac841f3f936720c8c66c64f1de12.png',
    type: UserPasswordType(
      hint: 'numero telefonico de la abuela',
      password: 'xfa240',
      user: 'juasjuas',
    ),
  ),
  Kip(
    id: 2,
    title: 'GitHub',
    avatar: 'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
    type: UserPasswordType(
      questionNAnswerList: [
        QuestionNAnswer(
          question: '¿Nombre de tu mascota?',
          answer: 'Holly',
        ),
        QuestionNAnswer(
          question: '¿Ultima empresa que trabajaste?',
          answer: 'Rextie',
        ),
      ],
    ),
  ),
  Kip(
    id: 3,
    title: 'Pornhub',
    avatar: 'https://www.elnacional.com/wp-content/uploads/2020/03/Ahora-Pornhub-tambi%C3%A9n-acepta-pagos-en-ZenCash-y-Tron.jpg',
    type: UserPasswordType(
      user: 'elchamakitolokito@gmail.com',
      hint: 'loka',
    ),
  ),
];
