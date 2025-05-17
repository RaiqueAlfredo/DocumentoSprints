#Estrutura criada com base nos conhecimentos adquiridos no curso da udemy "Programação Python básico..." e "Domine Pytest..."
#Primeiro eu tinha criado a calculadora apenas com as funções, mas não estava conseguindo testar, pois os testes não estavam encontrando o diretório da "calculadora", então ao pesquisar soluções, umas das apresentadas foi o uso da "class" e para entender e usar a class, acessei a seguinte documentação: https://docs.python.org/pt-br/3/tutorial/classes.html
class Calculator:
    def adicao(self, number1, number2):
        return number1 + number2
    
    def subtracao(self, number1, number2):
        return number1 - number2
    
    def multiplicacao(self, number1, number2):
        return number1 * number2
    
    def divisao(self, number1, number2):
        if number2 != 0: # Este "!=" serve para verificar se os valores são diferentes, aprendi em JS e pesquisei para ver se tinha isso no python.
            return number1 / number2
        else:
            return print("Não é possível dividir por zero!")
    
    def porcentagem(self, valor_percentual, valor_total):
        return (valor_percentual/100) * valor_total

    def potencia(self, number_base, expoente):
        return number_base**expoente