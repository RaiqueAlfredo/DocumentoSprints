import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("number1, number2, resultado_esperado", [(100,100,200), (-45,-45,-90), (140**145,140**145,2*140**145), (0,0,0)])
def test_adicao(fixture_calculator, number1, number2, resultado_esperado):
    assert fixture_calculator.adicao(number1, number2) == resultado_esperado