import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("number1, number2, resultado_esperado", [(100,100,1), (-10,10,-1), (10,0,None), (100*100, 2, 5000)])
def test_divisao(fixture_calculator, number1, number2, resultado_esperado):
    assert fixture_calculator.divisao(number1, number2) == resultado_esperado