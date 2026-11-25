// teste que falha
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('recusa valor inválido', () {
    expect(minhaFuncao(-1), false); 
  });

  test('aceita valor válido', () {
    expect(minhaFuncao(5), true);   
  });
}