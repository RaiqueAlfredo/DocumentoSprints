import pytest
from calculadora.calculadora import Calculator

@pytest.fixture
def fixture_calculator():
    return Calculator()

@pytest.mark.parametrize("valor_percentual, valor_total, resultado_esperado", [(25,85, 21.25), (-72,-45, 32.4), (6**6,5**5,1458000), (0,0,0)])
def test_porcentagem(fixture_calculator, valor_percentual, valor_total, resultado_esperado):
    assert fixture_calculator.porcentagem(valor_percentual, valor_total) == resultado_esperado