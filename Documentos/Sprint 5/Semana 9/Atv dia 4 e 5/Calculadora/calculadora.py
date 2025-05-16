def operacoes_matematicas():
    operador = input("Escolha a operação que deseja realizar: \n + = Adição \n - = Subtração \n * = Multiplicação \n / = Divisão \n % = Porcentagem \n Digite aqui: ")
    return operador
    
def numeros_para_operacoes(operador):
    if operador == "%":
        valor_percentual = float(input("Digite a porcentagem (Exemplo: 10 para 10%): "))
        valor_total = float(input("Digite o valor total: "))
        return valor_percentual, valor_total
    else:
        number1 = int(input("Digite o primeiro número: "))
        number2 = int(input("Digite o segundo número: "))
        return number1, number2

def realizando_calculo(operador, number1, number2, valor_percentual, valor_total):
    if operador == "+":
        resultado_adicao = number1 + number2
        return print("O resultado da soma é: " + str(resultado_adicao))
    elif operador == "-":
        resultado_subtracao = number1 - number2
        return print("O resultado da subtração é: " + str(resultado_subtracao))
    elif operador == "*":
        resultado_multiplicacao = number1 * number2
        return print("O resultado da multiplicação é: ", str(resultado_multiplicacao))
    elif operador == "/":
        if number2 != 0: 
            resultado_divisao = number1 / number2 
            return print("O resultado da divisão é: " + str(resultado_divisao))
        else: 
            return print("Não é possível dividir por zero!")
    elif operador == "%":
        resultado_percentual = (valor_percentual/100) * valor_total
        return print("O resultado da porcentagem é: " + str(resultado_percentual))
    else:
        return print("Operação inválida!")

operador = operacoes_matematicas()
if operador == "%":
    valor_percentual, valor_total = numeros_para_operacoes(operador)
    realizando_calculo(operador, None, None, valor_percentual, valor_total)
else:
    number1, number2 = numeros_para_operacoes(operador)
    realizando_calculo(operador, number1, number2, None, None)