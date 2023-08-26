
def calculadora():
    while True:  # Inicia um loop infinito para manter a calculadora em execução até que o usuário escolha sair.
        print("Operações disponíveis:")
        print("1: Soma")
        print("2: Subtração")
        print("3: Multiplicação")
        print("4: Divisão")
        print("0: Sair")

        escolha = input("Digite o número da operação desejada: ")  # Solicita a escolha da operação ao usuário.

        if escolha == '0':
            print("Saindo da calculadora.")
            break  # Se a escolha for '0', o loop é interrompido e a calculadora para.
        elif escolha in ['1', '2', '3', '4']:  # Verifica se a escolha está entre as operações válidas.
            num1 = float(input("Digite o primeiro valor: "))  # Solicita o primeiro número ao usuário.
            num2 = float(input("Digite o segundo valor: "))   # Solicita o segundo número ao usuário.

            if escolha == '1':
                resultado = num1 + num2  # Realiza a soma dos números.
                print("Resultado:", resultado)
            elif escolha == '2':
                resultado = num1 - num2  # Realiza a subtração dos números.
                print("Resultado:", resultado)
            elif escolha == '3':
                resultado = num1 * num2  # Realiza a multiplicação dos números.
                print("Resultado:", resultado)
            elif escolha == '4':
                if num2 != 0:
                    resultado = num1 / num2  # Realiza a divisão dos números.
                    print("Resultado:", resultado)
                else:
                    print("Não é possível dividir por zero.")
        else:
            print("Essa opção não existe. Por favor, escolha uma opção válida.")  # Mensagem de erro para opção inválida.

calculadora()  # Chama a função calculadora para iniciar o programa.
