from robot.api.deco import keyword
import random
import string

@keyword("Gerador senha")
def gerar_senha():
    '''
        Keyword para gerar senha;
    '''
    # Definindo os caracteres possíveis para a senha
    caracteres_especiais = '@#$%'
    letras_maiusculas = string.ascii_uppercase
    letras_minusculas = string.ascii_lowercase
    numeros = string.digits

    # Tamanho mínimo e máximo da senha
    tamanho_min = 8
    tamanho_max = 12

    # Definindo o tamanho da senha aleatoriamente entre 8 e 12 caracteres
    tamanho_senha = random.randint(tamanho_min, tamanho_max)

    # Garantindo que a senha tenha pelo menos um caractere especial
    senha = random.choice(caracteres_especiais)

    # Adicionando letras maiúsculas, minúsculas, números e caracteres especiais à senha
    senha += ''.join(random.choices(letras_maiusculas, k=random.randint(1, tamanho_senha - 4)))
    senha += ''.join(random.choices(letras_minusculas, k=random.randint(1, tamanho_senha - len(senha) - 2)))
    senha += ''.join(random.choices(numeros, k=random.randint(1, tamanho_senha - len(senha) - 1)))
    senha += ''.join(random.choices(caracteres_especiais + letras_maiusculas + letras_minusculas + numeros, k=tamanho_senha - len(senha)))

    # Embaralhando a senha para garantir aleatoriedade
    senha_embaralhada = ''.join(random.sample(senha, len(senha)))

    return senha_embaralhada

