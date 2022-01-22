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
        'coins': '50',
        'rating': '5.0'
      },
      {
        'name': 'Castelo de São Jorge',
        'image': 'http://lisbonne-idee.pt/upload4mail/magnolia-portugal/op_69454_castlesaintgeorgesmall.jpg',
        'position': geo.point(latitude: 38.7139134, longitude: -9.1356649).data,
        'description': 'Castelooo',
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Estádio José Alvalade',
        'image': 'https://www.iol.pt/multimedia/oratvi/multimedia/imagem/id/569035b40cf2468d8fd07fb2/',
        'position': geo.point(latitude: 38.76150075554993, longitude: -9.161745481197073).data,
        'description': 'Shit',
        'coins': '45',
        'rating': '0.5'
      },
      {
        'name': 'Terreiro do Paço',
        'image': 'https://descubralisboa.com/wp-content/uploads/2018/07/Pra%C3%A7a-do-Com%C3%A9rcio-4.jpg',
        'position': geo.point(latitude: 38.707785854706444, longitude: -9.136547375067176).data,
        'description': 'Terreiro lá ao pé do rio',
        'coins': '25',
        'rating': '4.5'
      },
      {
        'name': 'Mosteiro dos Jerónimos',
        'image': 'https://www.mundoportugues.pt/wp-content/uploads/sites/3/2017/10/article_64292.jpg',
        'position': geo.point(latitude: 38.69806671987906, longitude: -9.206682444168585).data,
        'description': 'Jerónimo Martins',
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Baixa-Chiado',
        'image': 'https://www.bestguide.pt/wp-content/uploads/2019/07/Chiado_06.jpg',
        'position': geo.point(latitude: 38.7105541, longitude: -9.1442586).data,
        'description': 'Mpt Fernando Pessoa a tomar café',
        'coins': '30',
        'rating': '4.5'
      },
      {
        'name': 'Convento do Carmo',
        'image': 'https://lisboasecreta.co/wp-content/uploads/2019/10/1641047433_93e5e0e884_h.jpg',
        'position': geo.point(latitude: 38.7121449, longitude: -9.1424348).data,
        'description': 'Convento com carmos',
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Elevador de Santa Justa',
        'image': 'https://euroveloportugal.com/files/2016/02/lisbon-elevador-justa.jpg',
        'position': geo.point(latitude: 38.7121065, longitude: -9.1416262).data,
        'description': 'Um elevador ya bue fixe',
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Rossio',
        'image': 'https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/16494/show/praca-do-rossio.jpg',
        'position': geo.point(latitude: 38.7138457, longitude: -9.1406012).data,
        'description': 'Rossio numa praça',
        'coins': '30',
        'rating': '3.5'
      },
      {
        'name': 'Torre de Belém',
        'image': 'https://dicasdelisboa.com.br/wp-content/uploads/2015/03/torre-de-belem-lisboa-3.jpg',
        'position': geo.point(latitude: 38.6915879, longitude: -9.218166).data,
        'description': 'Uma torre ali meio que no Tejo',
        'coins': '25',
        'rating': '4.5'
      },
      {
        'name': 'Padrão dos Descobrimentos',
        'image': 'https://cdn.getyourguide.com/img/location/54d8c4646ea4f.jpeg/88.jpg',
        'position': geo.point(latitude: 38.6936015, longitude: -9.2079002).data,
        'description': 'The B.O.A.T.',
        'coins': '25',
        'rating': '4.0'
      },
      {
        'name': 'Sé de Lisboa',
        'image': 'https://i.imgur.com/nXj7wew.jpg',
        'position': geo.point(latitude: 38.7098828, longitude: -9.1347731).data,
        'description': 'Sé de Lisboa',
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Panteão Nacional',
        'image': 'https://electrictuk.pt/wp-content/uploads/2017/12/pante%C3%A3o-Nacional.jpg',
        'position': geo.point(latitude: 38.7149986, longitude: -9.1268722).data,
        'description': 'Famous dead people.',
        'coins': '40',
        'rating': '3.5'
      },
      {
        'name': 'Assembleia da República',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100324/Parlamento_Eutanasia.jpg',
        'position': geo.point(latitude: 38.7125283, longitude: -9.1560083).data,
        'description': 'Where the politicians join to talk nonsense.',
        'coins': '35',
        'rating': '3.0'
      },
      {
        'name': 'Marquês de Pombal',
        'image': 'https://stg.construir.pt/app/uploads/2020/05/marques-1.jpg',
        'position': geo.point(latitude: 38.7252702, longitude: -9.1522492).data,
        'description': "Beautiful when it's dressed in red and white.",
        'coins': '35',
        'rating': '3.5'
      },
      {
        'name': 'Teatro Nacional de São Carlos',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100317/sao_carlos.jpg',
        'position': geo.point(latitude: 38.7095319, longitude: -9.1439467).data,
        'description': 'Um teatro e tal',
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Palácio das Necessidades',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100318/9856129.jpg',
        'position': geo.point(latitude: 38.7065502, longitude: -9.1731147).data,
        'description': 'Um palácio de necessidades',
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Palácio da Pena',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100322/Sintra-Palacio-da-Pena-1.jpg',
        'position': geo.point(latitude: 38.7875893, longitude: -9.3927976).data,
        'description': 'Um palácio de feito de penas e há lá uma aventura',
        'coins': '35',
        'rating': '5.0'
      },
      {
        'name': 'Palácio de Queluz',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100321/20213823_128912657716334_162580970468278272_n-1.jpg',
        'position': geo.point(latitude: 38.7507271, longitude: -9.2612711).data,
        'description': 'Palácio de Queluz',
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Convento de Mafra',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100320/o-barroco-a-poucos-passos-de-lisboa-3575266f5a1da0917d653ea61c1574e7.jpg',
        'position': geo.point(latitude: 38.9089427, longitude: -9.3181793).data,
        'description': 'Convento de Mafra',
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Estádio da Luz',
        'image': 'https://arena.rtp.pt/wp-content/uploads/2021/08/est%C3%A1dio-da-luz-860x507.jpg',
        'position': geo.point(latitude: 38.7527152, longitude: -9.1869627).data,
        'description': 'Best club in the world, no doubt.',
        'coins': '50',
        'rating': '5.0'
      },
      {
        'name': 'Parque Eduardo VII',
        'image': 'https://photo620x400.mnstatic.com/913bb875d1cbb7c9ccde2bd4a8daffec/parque-eduardo-vii.jpg',
        'position': geo.point(latitude: 38.7283043, longitude: -9.1548715).data,
        'description': 'Huge park in the center of the city. Amazing to catch pokemons.',
        'coins': '30',
        'rating': '4.5'
      },
      {
        'name': 'Gulbenkian',
        'image': 'https://www.nit.pt/wp-content/uploads/2019/03/1679091c5a880faf6fb5e6087eb1b2dc.jpg',
        'position': geo.point(latitude: 38.7373781, longitude: -9.1551702).data,
        'description': 'Amazing place to spend the afternoon enjoying the beautiful park and some wild ducks.',
        'coins': '35',
        'rating': '4.5'
      },
    ];

    final events = [
      {
        'name': 'Fado Concert',
        'image': 'https://anibalcavacosilva.arquivo.presidencia.pt/archive/img/090513-PR-1250.jpg',
        'position': geo.point(latitude: 38.7091, longitude: -9.1355).data,
        'description': 'Enjoy this amazing musical experience while tasting great wine and enjoying our delightful dishes alone or accompanied by your friends or family.',
        'date': '14 feb',
        'time': '8:00 pm',
        'duration': '1:30',
        'by': 'Comércio das Carnes'
      },
      {
        'name': 'Fado Concert',
        'image': 'https://anibalcavacosilva.arquivo.presidencia.pt/archive/img/090513-PR-1250.jpg',
        'position': geo.point(latitude: 38.7088, longitude: -9.1382).data,
        'description': 'Enjoy this amazing musical experience while tasting great wine and enjoying our delightful dishes alone or accompanied by your friends or family.',
        'date': '10 feb',
        'time': '8:30 pm',
        'duration': '1:30',
        'by': 'Peixaria do Zé'
      },
      {
        'name': 'Wine Tasting',
        'image': 'http://res.cloudinary.com/simpleview/image/upload/v1495143022/clients/napavalley/7e15c256_1662_4f52_9a2f_824359a74091_a25d5f41-d958-40a5-8b40-11e88f0e8578.jpg',
        'position': geo.point(latitude: 38.7100, longitude: -9.1405).data,
        'description': 'Enjoy the amazing taste of various portuguese wines while eating a selection of our best dishes.',
        'date': '9 feb',
        'time': '1:30 pm',
        'duration': '1:30',
        'by': 'Peixaria do Zé'
      },
      {
        'name': 'Wine Tasting',
        'image': 'http://res.cloudinary.com/simpleview/image/upload/v1495143022/clients/napavalley/7e15c256_1662_4f52_9a2f_824359a74091_a25d5f41-d958-40a5-8b40-11e88f0e8578.jpg',
        'position': geo.point(latitude: 38.7113, longitude: -9.1372).data,
        'description': 'Enjoy the amazing taste of various portuguese wines while eating a selection of our best dishes.',
        'date': '5 feb',
        'time': '1:00 pm',
        'duration': '2:00',
        'by': 'Comércio das Carnes'
      },
      {
        'name': 'Wine Tasting',
        'image': 'http://res.cloudinary.com/simpleview/image/upload/v1495143022/clients/napavalley/7e15c256_1662_4f52_9a2f_824359a74091_a25d5f41-d958-40a5-8b40-11e88f0e8578.jpg',
        'position': geo.point(latitude: 38.7146, longitude: -9.1436).data,
        'description': 'Enjoy the amazing taste of various portuguese wines while eating a selection of our best dishes.',
        'date': '2 feb',
        'time': '8:00 pm',
        'duration': '1:30',
        'by': 'Marisqueira do Chiado'
      },
    ];

    final stores = [
      {
        'name': 'Comércio das Carnes',
        'image': 'https://www.restoclub.ru/uploads/place_thumbnail_big/4/7/f/0/47f0d106b32eaa8ca755952251c5043a.jpg',
        'position': geo.point(latitude: 38.7084509, longitude: -9.1353743).data,
        'rating': '4.5',
        'description': "We offer the best meat in Lisbon, your girl won't regret it",
        'price': '€€',
        'type': 'carne'
      },
      {
        'name': 'Marisqueira do Chiado',
        'image': 'https://shopinporto.porto.pt/wp-content/uploads/2019/09/DMA_7325.jpg',
        'position': geo.point(latitude: 38.7109561, longitude: -9.1415663).data,
        'rating': '5.0',
        'description': 'The best quality sea food and customer service in one place.',
        'price': '€€€',
        'type': 'marisco'
      },
      {
        'name': 'Fast&Food',
        'image': 'https://i.pinimg.com/originals/eb/03/41/eb03415109d08ada60abb2735c8edb35.jpg',
        'position': geo.point(latitude: 38.709946, longitude: -9.1379197).data,
        'rating': '4.0',
        'description': 'Fast and reliable food at the best prices you can find, come join us!',
        'price': '€',
        'type': 'ff'
      },
      {
        'name': 'Peixaria do Zé',
        'image': 'https://images.adsttc.com/adbr001cdn.archdaily.net/wp-content/uploads/2012/08/1345752341_5_terreo.jpg',
        'position': geo.point(latitude: 38.7094392, longitude: -9.1398844).data,
        'rating': '4.5',
        'description': 'Experience some of the best flavours the portuguese seas have to offer, while having the best customer service.',
        'price': '€€',
        'type': 'peixe'
      },
      {
        'name': 'Donaldo',
        'image': 'https://media-cdn.tripadvisor.com/media/photo-s/19/55/33/ef/mixte-fast-food.jpg',
        'position': geo.point(latitude: 38.7180, longitude: -9.1414).data,
        'rating': '4.0',
        'description': 'Fast and reliable food at the best prices you can find, come join us!',
        'price': '€',
        'type': 'ff'
      },
      {
        'name': 'Fisheria',
        'image': 'https://images.adsttc.com/media/images/5ab4/7a83/f197/cc29/0200/00ad/large_jpg/KO5A2144.jpg?1521777273',
        'position': geo.point(latitude: 38.7162, longitude: -9.1356).data,
        'rating': '4.5',
        'description': 'Experience some of the best flavours the portuguese seas have to offer, while having the best customer service.',
        'price': '€€',
        'type': 'peixe'
      },
      {
        'name': 'La Meat',
        'image': 'https://images.trustinnews.pt/uploads/sites/5/2019/10/14161236Restaurante-Meat-Me-0W2J3283.JPG',
        'position': geo.point(latitude: 38.7173, longitude: -9.1424).data,
        'rating': '5.0',
        'description': "We offer the best meat in Lisbon, your girl won't regret it",
        'price': '€€',
        'type': 'carne'
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
