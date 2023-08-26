import datetime

def get_valid_year():
    while True:
        try:
            year = int(input("Digite o ano de nascimento (entre 1922 e 2021): "))
            if 1922 <= year <= 2021:
                return year
            else:
                print("Ano fora do intervalo permitido. Tente novamente.")
        except ValueError:
            print("Valor inválido. Digite um número válido.")

def main():
    nome = input("Digite seu nome completo: ")
    ano_nascimento = get_valid_year()
    
    ano_atual = datetime.datetime.now().year
    idade = ano_atual - ano_nascimento
    
    print(f"Nome: {nome}")
    print(f"Idade: {idade} anos")

if __name__ == "__main__":
    main()
