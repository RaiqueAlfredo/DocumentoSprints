import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("number_base, expoente, resultado_esperado", [(45,3, 91125), (-1,-2,1), (-10,5,-100000), (0,0,1)])
def test_potencia(fixture_calculator, number_base, expoente, resultado_esperado):
    assert fixture_calculator.potencia(number_base, expoente) == resultado_esperado