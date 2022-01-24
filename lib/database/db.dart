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
        'position': geo.point(latitude: 38.736851, longitude: -9.137885).data,
        'description': 'Instituto Superior Técnico is, as of today, the largest school of engineering, architecture, science and technology in Portugal.',
        'coins': '50',
        'rating': '5.0'
      },
      {
        'name': 'Castelo de São Jorge',
        'image': 'http://lisbonne-idee.pt/upload4mail/magnolia-portugal/op_69454_castlesaintgeorgesmall.jpg',
        'position': geo.point(latitude: 38.7139134, longitude: -9.1356649).data,
        'description': 'The Castelo de Sao Jorge stands majestically above Lisbon and is one of the finest tourist attractions in the city.',
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Estádio José Alvalade',
        'image': 'https://www.iol.pt/multimedia/oratvi/multimedia/imagem/id/569035b40cf2468d8fd07fb2/',
        'position': geo.point(latitude: 38.76150075554993, longitude: -9.161745481197073).data,
        'description': "Sporting Lisbon's stadium",
        'coins': '45',
        'rating': '0.5'
      },
      {
        'name': 'Terreiro do Paço',
        'image': 'https://descubralisboa.com/wp-content/uploads/2018/07/Pra%C3%A7a-do-Com%C3%A9rcio-4.jpg',
        'position': geo.point(latitude: 38.707785854706444, longitude: -9.136547375067176).data,
        'description': 'One of Lisbon’s iconic squares that you must see. This famous square is ready to welcome you with various attractions and a nobility that is clear to see.',
        'coins': '25',
        'rating': '4.5'
      },
      {
        'name': 'Mosteiro dos Jerónimos',
        'image': 'https://www.mundoportugues.pt/wp-content/uploads/sites/3/2017/10/article_64292.jpg',
        'position': geo.point(latitude: 38.69806671987906, longitude: -9.206682444168585).data,
        'description': 'On the banks of the Tagus is an apogee of Manueline architecture.',
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Baixa-Chiado',
        'image': 'https://www.bestguide.pt/wp-content/uploads/2019/07/Chiado_06.jpg',
        'position': geo.point(latitude: 38.7105541, longitude: -9.1442586).data,
        'description': 'Chiado is an important cultural and commercial district, known for its luxury shopping, historic landmarks, and its numerous theatres and museums.',
        'coins': '30',
        'rating': '4.5'
      },
      {
        'name': 'Convento do Carmo',
        'image': 'https://lisboasecreta.co/wp-content/uploads/2019/10/1641047433_93e5e0e884_h.jpg',
        'position': geo.point(latitude: 38.7121449, longitude: -9.1424348).data,
        'description': 'At the time of the 1755 earthquake, it was the largest church in Lisbon, but today the roofless nave open to the sky is all that remains of the arches and rubble that caved in on the congregation as they were attending mass.',
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Elevador de Santa Justa',
        'image': 'https://euroveloportugal.com/files/2016/02/lisbon-elevador-justa.jpg',
        'position': geo.point(latitude: 38.7121065, longitude: -9.1416262).data,
        'description': 'The Elevador de Santa Justa is one of the truly unique tourist attractions of Lisbon. This 19th century industrial age marvel transports passengers up 45m from the Baixa district to the Largo do Carmo.',
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Rossio',
        'image': 'https://spguia.melhoresdestinos.com.br/system/fotos_local/fotos/16494/show/praca-do-rossio.jpg',
        'position': geo.point(latitude: 38.7138457, longitude: -9.1406012).data,
        'description': 'Reborn out of the wreckage of the 1755 earthquake, this lovely Lisbon square marks the northern reach of the Pombaline Downtown.',
        'coins': '30',
        'rating': '3.5'
      },
      {
        'name': 'Torre de Belém',
        'image': 'https://dicasdelisboa.com.br/wp-content/uploads/2015/03/torre-de-belem-lisboa-3.jpg',
        'position': geo.point(latitude: 38.6915879, longitude: -9.218166).data,
        'description': 'UNESCO World Heritage, a cornerstone of Portuguese identity and an icon of a country historically moulded by its proximity to the ocean and its maritime discoveries of new worlds.',
        'coins': '25',
        'rating': '4.5'
      },
      {
        'name': 'Padrão dos Descobrimentos',
        'image': 'https://cdn.getyourguide.com/img/location/54d8c4646ea4f.jpeg/88.jpg',
        'position': geo.point(latitude: 38.6936015, longitude: -9.2079002).data,
        'description': 'This stunning monument was designed to commemorate the Age of Discoveries in Portugal. It was inaugurated in 1960, on the fifth centenary of one of the country’s great discoverers, Prince Henry the Navigator, who discovered the Azores, Madeira and Cape Verde.',
        'coins': '25',
        'rating': '4.0'
      },
      {
        'name': 'Sé de Lisboa',
        'image': 'https://i.imgur.com/nXj7wew.jpg',
        'position': geo.point(latitude: 38.7098828, longitude: -9.1347731).data,
        'description': "Dedicated to the Mother of God, Lisbon Cathedral is one of the city's gems and one of the most significant monuments in the country, due to its historical, religious and artistic value.",
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Panteão Nacional',
        'image': 'https://electrictuk.pt/wp-content/uploads/2017/12/pante%C3%A3o-Nacional.jpg',
        'position': geo.point(latitude: 38.7149986, longitude: -9.1268722).data,
        'description': "Originally built in the 17th century as the Church of Santa Engracia, the National Pantheon (Santa Egracia Panteao Nacional Lisbon) is now the burial place of many notable Portuguese personages, such as fado superstar Amália Rodrigues.",
        'coins': '40',
        'rating': '3.5'
      },
      {
        'name': 'Assembleia da República',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100324/Parlamento_Eutanasia.jpg',
        'position': geo.point(latitude: 38.7125283, longitude: -9.1560083).data,
        'description': 'The house of portuguese democracy',
        'coins': '35',
        'rating': '3.0'
      },
      {
        'name': 'Marquês de Pombal',
        'image': 'https://stg.construir.pt/app/uploads/2020/05/marques-1.jpg',
        'position': geo.point(latitude: 38.7252702, longitude: -9.1522492).data,
        'description': "It’s the main intersection for Lisbon's metro system and one of the busiest areas in terms of pedestrians and traffic. At its centre is a 9 metre statue of the Marquês de Pombal holding a lion, on top of a 34 metre plinth, commemorating the rebuilding of Lisbon after the 1755 earthquake.",
        'coins': '35',
        'rating': '3.5'
      },
      {
        'name': 'Teatro Nacional de São Carlos',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100317/sao_carlos.jpg',
        'position': geo.point(latitude: 38.7095319, longitude: -9.1439467).data,
        'description': "Teatro Nacional de São Carlos (São Carlos National Theatre) was inaugurated on 30th June 1793 and is still today the only Portuguese theatre geared towards producing and presenting opera and choral and symphonic music.",
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Palácio das Necessidades',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100318/9856129.jpg',
        'position': geo.point(latitude: 38.7065502, longitude: -9.1731147).data,
        'description': "The Necessidades Palace is a historic building in the Largo do Rilvas, a public square in Lisbon, Portugal. It serves as headquarters of the Portuguese Foreign Ministry. The Palace has been classified as a Property of Public Interest since 1983.",
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Palácio da Pena',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100322/Sintra-Palacio-da-Pena-1.jpg',
        'position': geo.point(latitude: 38.7875893, longitude: -9.3927976).data,
        'description': "The National Palace of Pena stands out as the renowned jewel in the crown of the Sintra Hills. The surrounding park, in close harmony with the magical character of the palace, triggers emotions of mystery and discovery. In its nooks and corners, our gaze gets lost amongst its charms.",
        'coins': '35',
        'rating': '5.0'
      },
      {
        'name': 'Palácio de Queluz',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100321/20213823_128912657716334_162580970468278272_n-1.jpg',
        'position': geo.point(latitude: 38.7507271, longitude: -9.2612711).data,
        'description': "The National Palace of Queluz charms whether for its imposing nature or the sheer exuberance of its architectural details closely bound up with the lives of three generations of the Portuguese Royal Family and the scene of intense emotions. The Palace furthermore reflects the evolution in the tastes and styles over different period, moving from the Baroque to the Rococo and onto Neoclassicism.",
        'coins': '30',
        'rating': '4.0'
      },
      {
        'name': 'Convento de Mafra',
        'image': 'https://offloadmedia.feverup.com/lisboasecreta.co/wp-content/uploads/2020/03/16100320/o-barroco-a-poucos-passos-de-lisboa-3575266f5a1da0917d653ea61c1574e7.jpg',
        'position': geo.point(latitude: 38.9089427, longitude: -9.3181793).data,
        'description': "This Baroque architectural complex encompasses a Royal Palace, a Basilica and a Convent. It boasts important collections of Italian sculpture, Italian and Portuguese paintings, a unique library, two carillons, six historic organs and an 18th-century hospital.",
        'coins': '35',
        'rating': '4.0'
      },
      {
        'name': 'Estádio da Luz',
        'image': 'https://arena.rtp.pt/wp-content/uploads/2021/08/est%C3%A1dio-da-luz-860x507.jpg',
        'position': geo.point(latitude: 38.7527152, longitude: -9.1869627).data,
        'description': "André Almeida plays here",
        'coins': '50',
        'rating': '5.0'
      },
      {
        'name': 'Parque Eduardo VII',
        'image': 'https://photo620x400.mnstatic.com/913bb875d1cbb7c9ccde2bd4a8daffec/parque-eduardo-vii.jpg',
        'position': geo.point(latitude: 38.7283043, longitude: -9.1548715).data,
        'description': "The Eduardo VII Park lies in the Parish of São Sebastião da Pedreira, north from Avenida da Liberdade, and offers panoramic views over the city. Originally known as Parque da Liberdade, the gardens were rechristened with the name of the British King Edward VII on his visit to Lisbon in 1903.",
        'coins': '30',
        'rating': '4.5'
      },
      {
        'name': 'Jardim da Gulbenkian',
        'image': 'https://www.nit.pt/wp-content/uploads/2019/03/1679091c5a880faf6fb5e6087eb1b2dc.jpg',
        'position': geo.point(latitude: 38.7373781, longitude: -9.1551702).data,
        'description': "The Calouste Gulbenkian gardens form the setting for the arts foundation of the same name which itself has auditoriums and exhibition areas, the Modern Art Centre and a Museum with a library and restaurant/bar.",
        'coins': '35',
        'rating': '4.5'
      },
      {
        'name': 'Campo Pequeno',
        'image': 'https://www.duranelectronica.com/english/wp-content/uploads/2018/06/campo-pequeno-bullring-lisbon-portugal.jpg',
        'position': geo.point(latitude: 38.742780, longitude: -9.145497).data,
        'description': "The brick-built Campo Pequeno bullring was opened in 1892. Inspired by the bullring in Madrid and designed in a neo-Arabic revivalist style, the Praça de Touros was totally renovated in 2006. It’s history is integral to the development of bullfighting in Portugal, a history that the museum evokes.",
        'coins': '40',
        'rating': '4.8'
      },
      {
        'name': 'Estádio de S. Luís',
        'image': 'https://www.zerozero.pt/img/estadios/393/735393_med__20201223182044_estadio_de_sao_luis.jpg',
        'position': geo.point(latitude: 37.022413, longitude: -7.928446).data,
        'description': "Home to the biggest club in Portugal",
        'coins': '99',
        'rating': '5.0'
      },
      {
        'name': 'Oceanário de Lisboa',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Lisboa-Oceanario.jpg',
        'position': geo.point(latitude: 38.763351, longitude: -9.093984).data,
        'description': "The Oceanário de Lisboa is a large public aquarium whose prestige is widely recognised, not only in Lisbon and Portugal, but also across the world. Visited by approximately 1 million people every year, the Oceanário is the most popular cultural attraction in Portugal.",
        'coins': '45',
        'rating': '4.2'
      },
      {
        'name': 'Altice Arena',
        'image': 'https://informacoeseservicos.lisboa.pt/fileadmin/espacos/imagens/altice_arena_1.jpg',
        'position': geo.point(latitude: 38.768550, longitude: -9.095448).data,
        'description': "The biggest showroom in Portugal",
        'coins': '40',
        'rating': '3.9'
      },
      {
        'name': 'Pavilhão do Conhecimento',
        'image': 'https://s7a5n8m2.stackpathcdn.com/wp-content/uploads/2015/09/entradapavilhaodoconhecimento.jpg',
        'position': geo.point(latitude: 38.762269, longitude: -9.095981).data,
        'description': "An interactive museum that was created with the goal of fostering knowledge and disseminating technological and scientific culture. To achieve this goal, various exhibitions and activities have been set up so that visitors can actively explore a variety of themes in a relaxing and fun atmosphere.",
        'coins': '35',
        'rating': '3.8'
      },
      {
        'name': 'Torre Vasco da Gama',
        'image': 'https://media.timeout.com/images/103613845/750/422/image.jpg',
        'position': geo.point(latitude: 38.774809, longitude: -9.092136).data,
        'description': "Lisbon’s tallest skyscraper for the view of the river. The Torre Vasco da Gama honours the old mariners and the city’s ties to the river in a wonderful setting.",
        'coins': '40',
        'rating': '4.0'
      },
      {
        'name': 'Arco do Cego',
        'image': 'https://bordalo.observador.pt/v2/q:85/rs:fill:2000:1124/c:2000:1124:nowe:0:104/plain/https://s3.observador.pt/wp-content/uploads/2016/04/23103406/20572240.jpg',
        'position': geo.point(latitude: 38.735781, longitude: -9.142263).data,
        'description': "The most famous garden for students of Instituto Superior Técnico",
        'coins': '20',
        'rating': '5.0'
      },
      {
        'name': 'Fonte Luminosa',
        'image': 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Fonte_Monumental_Alameda_D_Afonso_Henriques_IMG_4511.jpg',
        'position': geo.point(latitude: 38.737175, longitude: -9.130841).data,
        'description': "Dating from 1940, when the world was at war and Lisbon remained at peace, this is a monumental fountain placed in the center of a new neighborhood at the time, the 'Avenidas Novas.'",
        'coins': '40',
        'rating': '4.2'
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
      {
        'name': 'Os Belenenses vs Estrela da Amadora',
        'image': 'https://static.globalnoticias.pt/dn/image.jpg?brand=DN&type=generate&guid=7515c2e2-d4e5-4bf5-9ccd-ff1e0d56db98&w=800&h=420&watermark=true&t=20190106203700',
        'position': geo.point(latitude: 38.702300, longitude: -9.207162).data,
        'description': 'Enjoy an exciting match between the two best teams in Lisbon.',
        'date': '3 feb',
        'time': '5:00 pm',
        'duration': '2:00',
        'by': 'Tasca Os Belenenses'
      },
      {
        'name': 'Cortejo da Latada',
        'image': 'https://imgur.com/a/8WqWsic',
        'position': geo.point(latitude: 38.708984, longitude: -9.137916).data,
        'description': "Take part in one of Lisbon's university life's most traditional moments, as the students parade across the city representing their course",
        'date': '2 feb',
        'time': '4:00 pm',
        'duration': '3:00',
        'by': 'Donaldo'
      },
      {
        'name': 'Tuna IST Concert',
        'image': 'https://tmist.tecnico.ulisboa.pt/images/contactos.jpg',
        'position': geo.point(latitude: 38.735779, longitude: -9.142169).data,
        'description': "Enjoy a chill concert by a traditional music band made up of IST students",
        'date': '3 feb',
        'time': '4:30 pm',
        'duration': '0:45',
        'by': 'Quiosque do Arco do Cego'
      },
      {
        'name': 'Farense v Estrela da Amadora',
        'image': 'https://www.algarveprimeiro.com/files/resizes/noticias/730X407/img_61b6198352913.jpg',
        'position': geo.point(latitude: 37.022683, longitude: -7.928116).data,
        'description': "Is it this time that Farense finally wins a game?",
        'date': '1 feb',
        'time': '6:30 pm',
        'duration': '2:00',
        'by': 'Pastelaria Farodoce'
      },
    ];

    final stores = [
      {
        'name': 'Comércio das Carnes',
        'image': 'https://www.restoclub.ru/uploads/place_thumbnail_big/4/7/f/0/47f0d106b32eaa8ca755952251c5043a.jpg',
        'position': geo.point(latitude: 38.7084509, longitude: -9.1353743).data,
        'rating': '4.5',
        'description': "We offer the best meat in Lisbon, Salt Bae ain't even close",
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
        'description': "Simply the best meat in Lisbon",
        'price': '€€',
        'type': 'carne'
      },
      {
        'name': 'Tasca Os Belenenses',
        'image': 'https://images.trustinnews.pt/uploads/sites/5/2019/10/14161236Restaurante-Meat-Me-0W2J3283.JPG',
        'position': geo.point(latitude: 38.7173, longitude: -9.1424).data,
        'rating': '4.0',
        'description': "Get youself the best meat in Belém, before going to Restelo",
        'price': '€',
        'type': 'carne'
      },
      {
        'name': 'Quiosque do Arco do Cego',
        'image': 'https://b.zmtcdn.com/data/pictures/0/8211420/a66bfdf67161ce8efb3f12bd85a20a53_featured_v2.jpg',
        'position': geo.point(latitude: 38.735383, longitude: -9.142107).data,
        'rating': '4.8',
        'description': "Come here for a nice, chill evening, after a hard day's work at Técnico",
        'price': '€',
        'type': 'ff'
      },
      {
        'name': 'Pastelaria Farodoce',
        'image': 'https://media-cdn.tripadvisor.com/media/photo-s/16/76/12/f2/photo1jpg.jpg',
        'position': geo.point(latitude: 37.023591, longitude: -7.929314).data,
        'rating': '4.0',
        'description': "Friendly neighborhood bakery, right next to the Estádio de S. Luís",
        'price': '€',
        'type': 'ff'
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
