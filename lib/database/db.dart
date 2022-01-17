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
        'name': 'Instituto Superior Técnico',
        'image': 'https://tecnico.ulisboa.pt/files/2020/07/cinco-cursos-do-tecnico-com-desemprego-zero-1140x641.jpg',
        'position': geo.point(latitude: 38.7364941, longitude: -9.1336263).data,
        'description': 'desISTo',
        'coins': '300',
        'rating': '5.0'
      },
      {
        'name': 'Castelo de São Jorge',
        'image': 'http://lisbonne-idee.pt/upload4mail/magnolia-portugal/op_69454_castlesaintgeorgesmall.jpg',
        'position': geo.point(latitude: 38.7139134, longitude: -9.1356649).data,
        'description': 'Castelooo',
        'coins': '250',
        'rating': '4.0'
      },
      {
        'name': 'Estádio José Alvalade',
        'image': 'https://www.iol.pt/multimedia/oratvi/multimedia/imagem/id/569035b40cf2468d8fd07fb2/',
        'position': geo.point(latitude: 38.76150075554993, longitude: -9.161745481197073).data,
        'description': 'Sporting é merda',
        'coins': '200',
        'rating': '0.5'
      },
      {
        'name': 'Terreiro do Paço',
        'image': 'https://descubralisboa.com/wp-content/uploads/2018/07/Pra%C3%A7a-do-Com%C3%A9rcio-4.jpg',
        'position': geo.point(latitude: 38.707785854706444, longitude: -9.136547375067176).data,
        'description': 'Terreiro lá ao pé do rio',
        'coins': '100',
        'rating': '4.5'
      },
      {
        'name': 'Mosteiro dos Jerónimos',
        'image': 'https://www.mundoportugues.pt/wp-content/uploads/sites/3/2017/10/article_64292.jpg',
        'position': geo.point(latitude: 38.69806671987906, longitude: -9.206682444168585).data,
        'description': 'Jerónimo Martins',
        'coins': '275',
        'rating': '4.0'
      },
      {
        'name': 'Baixa-Chiado',
        'image': 'https://www.bestguide.pt/wp-content/uploads/2019/07/Chiado_06.jpg',
        'position': geo.point(latitude: 38.7105541, longitude: -9.1442586).data,
        'description': 'Mpt Fernando Pessoa a tomar café',
        'coins': '100',
        'rating': '4.5'
      },
      {
        'name': 'Convento do Carmo',
        'image': 'https://lisboasecreta.co/wp-content/uploads/2019/10/1641047433_93e5e0e884_h.jpg',
        'position': geo.point(latitude: 38.7121449, longitude: -9.1424348).data,
        'description': 'Convento com carmos',
        'coins': '400',
        'rating': '4.0'
      },
      {
        'name': 'Elevador de Santa Justa',
        'image': 'https://euroveloportugal.com/files/2016/02/lisbon-elevador-justa.jpg',
        'position': geo.point(latitude: 38.7121065, longitude: -9.1416262).data,
        'description': 'Um elevador ya bue fixe',
        'coins': '300',
        'rating': '4.0'
      },
      {
        'name': 'Rossio',
        'image': 'https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/16494/show/praca-do-rossio.jpg',
        'position': geo.point(latitude: 38.7138457, longitude: -9.1406012).data,
        'description': 'Rossio numa praça',
        'coins': '100',
        'rating': '3.5'
      },
      {
        'name': 'Torre de Belém',
        'image': 'https://dicasdelisboa.com.br/wp-content/uploads/2015/03/torre-de-belem-lisboa-3.jpg',
        'position': geo.point(latitude: 38.6915879, longitude: -9.218166).data,
        'description': 'Uma torre ali meio que no Tejo',
        'coins': '200',
        'rating': '4.5'
      },
      {
        'name': 'Padrão dos Descobrimentos',
        'image': 'https://cdn.getyourguide.com/img/location/54d8c4646ea4f.jpeg/88.jpg',
        'position': geo.point(latitude: 38.6936015, longitude: -9.2079002).data,
        'description': 'Uma especie de uma barcaça com uns gajos na proa',
        'coins': '250',
        'rating': '4.0'
      },
      {
        'name': 'Sé de Lisboa',
        'image': 'https://i.imgur.com/nXj7wew.jpg',
        'position': geo.point(latitude: 38.7098828, longitude: -9.1347731).data,
        'description': 'Sé de Lisboa',
        'coins': '300',
        'rating': '4.0'
      },
      {
        'name': 'Panteão Nacional',
        'image': 'https://electrictuk.pt/wp-content/uploads/2017/12/pante%C3%A3o-Nacional.jpg',
        'position': geo.point(latitude: 38.7149986, longitude: -9.1268722).data,
        'description': 'Mpt Eusébio e Vasco da Pastilha',
        'coins': '250',
        'rating': '3.5'
      },
      {
        'name': 'Assembleia da República',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100324/Parlamento_Eutanasia.jpg',
        'position': geo.point(latitude: 38.7125283, longitude: -9.1560083).data,
        'description': 'Corrupçaõ toda junta',
        'coins': '275',
        'rating': '3.0'
      },
      {
        'name': 'Marquês de Pombal',
        'image': 'https://stg.construir.pt/app/uploads/2020/05/marques-1.jpg',
        'position': geo.point(latitude: 38.7252702, longitude: -9.1522492).data,
        'description': 'Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco Fica bue bem de vermelho e branco',
        'coins': '225',
        'rating': '3.5'
      },
      {
        'name': 'Teatro Nacional de São Carlos',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100317/sao_carlos.jpg',
        'position': geo.point(latitude: 38.7095319, longitude: -9.1439467).data,
        'description': 'Um teatro e tal',
        'coins': '300',
        'rating': '4.0'
      },
      {
        'name': 'Palácio das Necessidades',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100318/9856129.jpg',
        'position': geo.point(latitude: 38.7065502, longitude: -9.1731147).data,
        'description': 'Um palácio de necessidades',
        'coins': '250',
        'rating': '4.0'
      },
      {
        'name': 'Palácio da Pena',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100322/Sintra-Palacio-da-Pena-1.jpg',
        'position': geo.point(latitude: 38.7875893, longitude: -9.3927976).data,
        'description': 'Um palácio de feito de penas e há lá uma aventura',
        'coins': '225',
        'rating': '5.0'
      },
      {
        'name': 'Palácio de Queluz',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100321/20213823_128912657716334_162580970468278272_n-1.jpg',
        'position': geo.point(latitude: 38.7507271, longitude: -9.2612711).data,
        'description': 'Palácio de Queluz',
        'coins': '225',
        'rating': '4.0'
      },
      {
        'name': 'Convento de Mafra',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100320/o-barroco-a-poucos-passos-de-lisboa-3575266f5a1da0917d653ea61c1574e7.jpg',
        'position': geo.point(latitude: 38.9089427, longitude: -9.3181793).data,
        'description': 'Convento de Mafra',
        'coins': '225',
        'rating': '4.0'
      },
      {
        'name': 'Estádio da Luz',
        'image': 'https://arena.rtp.pt/wp-content/uploads/2021/08/est%C3%A1dio-da-luz-860x507.jpg',
        'position': geo.point(latitude: 38.7527152, longitude: -9.1869627).data,
        'description': 'Estádio do melhor clube do mundo',
        'coins': '420',
        'rating': '5.0'
      },
      {
        'name': 'Parque Eduardo VII',
        'image': 'https://photo620x400.mnstatic.com/913bb875d1cbb7c9ccde2bd4a8daffec/parque-eduardo-vii.jpg',
        'position': geo.point(latitude: 38.7283043, longitude: -9.1548715).data,
        'description': 'Ganda parque oh mano',
        'coins': '300',
        'rating': '4.5'
      },
      {
        'name': 'Jardim Gulbenkian',
        'image': 'https://www.nit.pt/wp-content/uploads/2019/03/1679091c5a880faf6fb5e6087eb1b2dc.jpg',
        'position': geo.point(latitude: 38.7373781, longitude: -9.1551702).data,
        'description': 'Ir ver uns patos e tal',
        'coins': '275',
        'rating': '4.5'
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
        'name': 'Comércio das Carnes',
        'image': 'https://www.restoclub.ru/uploads/place_thumbnail_big/4/7/f/0/47f0d106b32eaa8ca755952251c5043a.jpg',
        'position': geo.point(latitude: 38.7084509, longitude: -9.1353743).data,
        'rating': '4.5',
        'description': 'Melhores carnes do Terreiro do Paço',
        'price': '€€',
        'type': 'carne'
      },
      {
        'name': 'Marisqueira do Chiado',
        'image': 'https://shopinporto.porto.pt/wp-content/uploads/2019/09/DMA_7325.jpg',
        'position': geo.point(latitude: 38.7109561, longitude: -9.1415663).data,
        'rating': '5.0',
        'description': 'Melhor marisqueira de Belém',
        'price': '€€€',
        'type': 'marisco'
      },
      {
        'name': 'Fast&Food',
        'image': 'https://i.pinimg.com/originals/eb/03/41/eb03415109d08ada60abb2735c8edb35.jpg',
        'position': geo.point(latitude: 38.709946, longitude: -9.1379197).data,
        'rating': '4.0',
        'description': 'Comida rapida cralhes',
        'price': '€',
        'type': 'ff'
      },
      {
        'name': 'Peixaria do Zé',
        'image': 'https://images.adsttc.com/adbr001cdn.archdaily.net/wp-content/uploads/2012/08/1345752341_5_terreo.jpg',
        'position': geo.point(latitude: 38.7094392, longitude: -9.1398844).data,
        'rating': '4.5',
        'description': 'Peixinho Fresco',
        'price': '€€',
        'type': 'peixe'
      },
    ];

    spots.forEach((spot) {
      firestore.collection('spots_skr').add(spot);
    });

    events.forEach((event) {
      firestore.collection('events_test2').add(event);
    });

    stores.forEach((store) {
      firestore.collection('stores_skr').add(store);
    });

  }
}
