import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("number1, number2, resultado_esperado", [(100**100,10,100**100*10), (-45,-45, 2025), (-3**3,10,-270), (0,-1,0)])
def test_multiplicacao(fixture_calculator, number1, number2, resultado_esperado):
    assert fixture_calculator.multiplicacao(number1, number2) == resultado_esperado