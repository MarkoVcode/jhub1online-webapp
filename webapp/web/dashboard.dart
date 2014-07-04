import 'dart:html';
import 'object.agent.dart';
import 'ajax.abstract.dart';

void main() {
//  loadData();
  var ajax = new ServiceAgents();
  ajax.get(doShitWithMyAgents);
  
  querySelector("#sample_text_id")
      ..text = "Click me!"
      ..onClick.listen(reverseText);
 // querySelector("#sample_text_id").text = "wewewewewew";
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}

void doShitWithMyAgents(Agents agents) {
  querySelector("#sample_text_id").text = agents.getSomething();
}



