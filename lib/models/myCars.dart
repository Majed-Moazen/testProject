class MyCar{

  String pathImage='',Company_ratio='',  Price_kilo='', title='',type='',color='',number='';
  MyCar({this.title='',this.Company_ratio='',this.pathImage='',this.Price_kilo='',this.type='',this.color='',this.number=''});


 static List<MyCar> cars = [
    MyCar(
        title: 'اودي 2020',
        Price_kilo: 'سعر الكيلو :          1كم / 50 ل.س',
        Company_ratio: 'نسبة الشركة :          1كم / 50 ل.س',
        pathImage: 'asset/image/car.png',
      color: 'فضي',
      type: 'سيارة',
      number: '545841',

    ),


    MyCar(
        title: 'اودي 2020',
        Price_kilo: 'سعر الكيلو :          1كم / 50 ل.س',
        Company_ratio: 'نسبة الشركة :          1كم / 50 ل.س',
        color: 'اسود',
        type: 'سيارة',
        number: '4444',
        pathImage: 'asset/image/car.png'),

    MyCar(
        title: 'موتور راكينغ',
        Price_kilo: 'سعر الكيلو :          1كم / 50 ل.س',
        Company_ratio: 'نسبة الشركة :          1كم / 50 ل.س',
        color: 'احمر',
        type: 'ميتور',
        number: '55650',
        pathImage: 'asset/image/motor.png'),


  ];
}