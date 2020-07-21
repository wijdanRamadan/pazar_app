class Slide {
  String image;
  String description;
  String description1;

  Slide({this.image, this.description, this.description1});
}

final slideList = [
  Slide(
      image: 'assets/two.png',
      description: 'أهلا وسهلا بكم في عائلة بازار اب ',
      description1: 'المتجر الالكتروني الأول للمنتجات العربية والتركية'),
  Slide(
      image: 'assets/watch.png',
      description: 'توفير الوقت والجهد',
      description1: ' التوصيل مجاني الى باب البيت'),
  Slide(
      image: 'assets/pay.png',
      description: 'طرق دفع متنوعة ',
      description1: 'دفع عند الاستلام والبطاقة الائتمانية')
];
