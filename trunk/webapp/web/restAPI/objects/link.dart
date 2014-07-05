library link;

class Link {
  String href;
  
  Link.fromMap(Map map) {
    href = map["href"];
  }
  
  String getHref() {
    return href;
  }
}