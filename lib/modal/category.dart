
class Category {
  String id;
  String title;
  String imagePath ;
  int color ;
  
  Category({
    required this.title,
    required this.imagePath,
    required this.id,
    required this.color
});
  
  static List<Category> getCategories (){
    return [
      Category(title: 'Sports', imagePath: 'assets/ball.png', id: 'sports', color: 0xffC91C22),
      Category(title: 'Business', imagePath: 'assets/bussines.png', id: 'business', color: 0xffCF7E48),
      Category(title: 'Entertainment', imagePath: 'assets/environment.png', id: 'entertainment', color: 0xff4882CF),
      Category(title: 'Health', imagePath: 'assets/health.png', id: 'health', color: 0xffED1E79),
      Category(title: 'Science', imagePath: 'assets/science.png', id: 'science', color: 0xffF2D352),
      Category(title: 'Technology', imagePath: 'assets/science.png', id: 'technology', color: 0xff003E90),
      Category(title: 'General', imagePath: 'assets/Politics.png', id: 'general', color: 0xff003E90),
    ];
  }
}