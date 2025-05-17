import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("number1, number2, resultado_esperado", [(100,100,0), (-45,-45,0), (3**3,100**10,27-10**20), (0,0,0)])
def test_subtracao(fixture_calculator, number1, number2, resultado_esperado):
    assert fixture_calculator.subtracao(number1, number2) == resultado_esperado