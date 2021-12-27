import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return DB._instance._firestore;
  }

  static setupDemoData() async {
    FirebaseFirestore firestore = DB.get();
    final geo = Geoflutterfire();

    final spots = [
      {
        'name': 'Instituto Superior Técnicooooo',
        'image':
            'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.73682813, longitude: -9.13870437).data,
      },
      {
        'name': 'Castelo de São Jorge',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.7139134, longitude: -9.1356649).data,
      },
      {
        'name': 'Estádio José Alvalade',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.76150075554993, longitude: -9.161745481197073).data,
      },
      {
        'name': 'Terreiro do Paço',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.707785854706444, longitude: -9.136547375067176).data,
      },
      {
        'name': 'Mosteiro dos Jerónimos',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.69806671987906, longitude: -9.206682444168585).data,
      },
    ];

    final events = [
      {
        'name': 'Fonte Luminosa da Alameda',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.73742139064681, longitude: -9.13042993154695).data,
      },
      {
        'name': 'Jardim Zoológico',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.74293335875334, longitude: -9.169032596959209).data,
      },
      {
        'name': 'Mouraria',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.717590314373986, longitude: -9.135601545352163).data,
      },
    ];

    final stores = [
      {
        'name': 'Torre de Belém',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.691726039079896, longitude: -9.21598803084505).data,
      },
      {
        'name': 'Estádio da Luz',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.75288668501237, longitude: -9.184795459678941).data,
      },
      {
        'name': 'Praça do Rossio',
        'image':
        'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.714012816631126, longitude:-9.139381430844518).data,
      },
    ];

    spots.forEach((spot) {
      firestore.collection('spots_test2').add(spot);
    });

    events.forEach((event) {
      firestore.collection('events_test2').add(event);
    });

    stores.forEach((store) {
      firestore.collection('stores_test2').add(store);
    });

  }
}
