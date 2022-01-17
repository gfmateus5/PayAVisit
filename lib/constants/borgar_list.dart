const CARNES = [
  {
    "name":"Febras",
    "price":"7.50€",
    "image":"https://cdn.e-konomista.pt/uploads/2019/07/122243-bbq-spicy-pork-steak-with-chili-and-fries-close-up-horizontal-top-view_1555289383-425x318.jpg"
  },{
    "name":"Almôndegas",
    "price":"8.00€",
    "image":"https://www.receitasdeliciosasnamesa.com/wp-content/uploads/2020/10/Receita-de-almondegas-no-forno.jpg"
  },
  {
    "name":"Bolonhesa",
    "price":"9.00€",
    "image":"https://img.cybercook.com.br/receitas/610/espaguete-com-molho-a-bolonhesa-ou-ragu-bolognese-1.jpeg"
  },
  {
    "name":"Bitoque",
    "price":"8.50€",
    "image":"https://cdn.tasteatlas.com/images/dishes/9c4888bb938346c3ada2cddd5d1a0ebc.jpg?w=600&h=450"
  },
  {
    "name":"Picanha",
    "price":"10.00€",
    "image":"https://img.itdg.com.br/tdg/images/recipes/000/000/249/353704/353704_original.jpg?mode=crop&width=710&height=400"
  },
  {
    "name":"Bife de Vaca",
    "price":"13.00€",
    "image":"http://ticasgest.pt/lxk/wp-content/uploads/2017/08/home_slide.jpg"
  },
  {
    "name":"Francesinha",
    "price":"75.00€",
    "image":"https://i0.wp.com/www.vortexmag.net/wp-content/uploads/2021/12/naom_5a99853652c49.jpg"
  },
];

const PEIXE = [
  {
    "name":"Carapaus",
    "price":"7.50€",
    "image":"https://www.teleculinaria.pt/wp-content/uploads/2017/09/carapaus-grelhados-com-molho-especial.jpg"
  },{
    "name":"Dourada",
    "price":"10.00€",
    "image":"https://ruralea.com/wp-content/uploads/2020/08/7c9ccfba4a0c50e30011adeee393dc90-e1593267728593-2.jpg"
  },
  {
    "name":"Sardinhas",
    "price":"8.00€",
    "image":"https://s2.glbimg.com/pjqVMJv59XLZuS5M9d13VVclxOk=/620x455/e.glbimg.com/og/ed/f/original/2018/05/23/sardinhas_com_broa_e_batatas.jpg"
  },
  {
    "name":"Peixe-espada",
    "price":"9.50€",
    "image":"https://www.cozinharsemstress.pt/cozinhar/wp-content/uploads/2015/06/B-013_5291.jpg"
  },
  {
    "name":"Atum",
    "price":"12.00€",
    "image":"https://amodadoflavio.pt/ophaboah/2017/09/okbife-de-atum-algarvia.jpg"
  },
  {
    "name":"Espadarte",
    "price":"11.00€",
    "image":"https://www.saborintenso.com/images/receitas/Espadarte-com-Molho-de-Azeitonas-SI-2.jpg"
  },
  {
    "name":"Salmão",
    "price":"75.00€",
    "image":"https://static1.casapraticaqualita.com.br/articles/5/83/5/@/885-o-salmao-e-um-dos-peixes-mais-saborosos-article_content_img-2.jpg"
  },
];

const MARISCO = [
  {
    "name":"Gambas ao alho",
    "price":"12.00€",
    "image":"https://www.vortexmag.net/wp-content/uploads/2020/07/gambas-al-ajillo-XL-RECIPE0917-1-500x500.jpg"
  },{
    "name":"Lagosta",
    "price":"17.00€",
    "image":"https://www.portugaldigital.com.br/wp-content/uploads/2019/05/AlimentosLagostasGastronomiaFotoBebidasFamosasGoogle.jpg"
  },
  {
    "name":"Sapateira",
    "price":"18.00€",
    "image":"https://www.saberviver.pt/wp-content/uploads/2018/04/sapateira_destaque.jpg"
  },
  {
    "name":"Mexilhão",
    "price":"13.50€",
    "image":"https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/A73570A5-A03D-404B-BD60-F8CA6C27C59E/Derivates/a387226e-cbdc-464a-8b79-d16f7ee889f1.jpg"
  },
  {
    "name":"Arroz de Marisco",
    "price":"20.00€",
    "image":"https://www.teleculinaria.pt/wp-content/uploads/2018/08/arroz-de-marisco-da-praia-da-vieira.jpg"
  },
  {
    "name":"Ameijoas",
    "price":"14.50€",
    "image":"https://www.teleculinaria.pt/wp-content/uploads/2020/05/Imagens-site-TC-1-5.png"
  },
  {
    "name":"Polvo à Lagareiro",
    "price":"17.50€",
    "image":"https://www.pingodoce.pt/wp-content/uploads/2016/09/polvo-a-lagareiro.jpeg"
  },
];

const FF = [
  {
    "name":"BigBurger",
    "price":"6.00€",
    "image":"https://super.abril.com.br/wp-content/uploads/2017/03/bigmac.png?w=1024"
  },{
    "name":"Nuggets",
    "price":"3.00€",
    "image":"http://receitasmais.com.br/wp-content/uploads/2014/10/Nuggets-de-Frango-1200x675.jpg"
  },
  {
    "name":"Fried Chicken",
    "price":"4.50€",
    "image":"https://cdn.leitesculinaria.com/wp-content/uploads/2021/02/batter-fried-chicken-fp.jpg.optimal.jpg"
  },
  {
    "name":"Fried Chips",
    "price":"3.50€€",
    "image":"https://more.ctv.ca/food/recipes/crispy-salt--n--vinegar-potato-chips/_jcr_content/root/responsivegrid_1778395324/responsivegrid_182136378/featuredmedia.coreimg.jpeg/1594684530294/crispy-salt--n--vinegar-potato-chips.jpeg"
  },
  {
    "name":"Hot Dog",
    "price":"4.50€",
    "image":"https://img.itdg.com.br/tdg/images/recipes/000/160/242/116615/116615_original.jpg?w=1200"
  },
  {
    "name":"Onion Rings",
    "price":"4.00€",
    "image":"https://i0.wp.com/www.angsarap.net/wp-content/uploads/2015/03/Onion-Rings-Wide.jpg?ssl=1"
  },
  {
    "name":"Fries",
    "price":"3.50€",
    "image":"https://static.toiimg.com/thumb/54659021.cms?width=1200&height=900"
  },
];
