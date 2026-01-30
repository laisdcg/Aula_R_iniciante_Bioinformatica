##################################################################################
###### Professora: MSc. Laís de Carvalho Gonçalves - Natal/RN - janeiro/2026 ######

####### Instalar pacotes pelo CRAN e ler ######
install.packages()
library()

# Exemplos 
install.packages("dplyr")     # Manipulação de dados
install.packages("data.table") # Leitura rápida de arquivos grandes
library(dplyr)
library(data.table)

#Exemplo - instalar vários pacotes de uma vez
install.packages(c("ggplot2", "tidyr", "readr"))

###### Instalar pacotes pelo BiocManager e ler #####
BiocManager::install()
library()

# Exemplos 
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")
BiocManager::install("DESeq2") # Exemplo de pacote para análise diferencial
library(GEOquery)
library(DESeq2)


##### Regras principais #####

# c() significa 'combine' - cria um conjunto de dados (vetor)
notas <- c(5, 7, 10, 8) 

# 1:10 cria uma sequência automática de 1 até 10
sequencia <- 1:10

##### Operações matemáticas em linguagem R #####
2+2 # Soma       # Resultado 4
8-3 # Subtração     # Resultado 5
5*3 # Multiplicação     # Resultado 15
8/2 # Divisão      # Resultado 4
10/3 # Divisão      # Resultado 3,33333....
10 %% 3 # Resto da divisão     # Resultado 1
2**2 # Exponencial (2 elevado a 2)     # Resultado 4
2**3 # Potenciação (2 elevado a 3)    # Resultado 8
(2 + 3) * 5  # Resultado: 25
2 + 3 * 5    # Resultado: 17

##### Funções Básicas em R ####
log(100, base = 10) # Logaritmo    # Resultado 2
sqrt(9)             # Raiz quadrada     # Resultado 3
sum(1:10)           # Soma de todos os números de 1 a 10     # Resultado 55
mean(1:10)          # Média aritmética       # Resultado 5.5
var(c(6,8,10,12))     # Variância     # Resultados 6.666667


##### Pedindo ajuda #####
?var            # Atalho rápido para o help (?) 
help()           # Função oficial de ajuda


##### Objetos e Atributos #####
Lais <- 1.60
Juliana <- 1.70

# Adicionando metadados (nomes) aos objetos
names(Lais) <- "altura"
names(Juliana) <- "altura"

##### Verificação antes da remoção #####
typeof(Lais)      # Retorna "double" (número real)
object.size(Lais) # Mostra o uso de memória em bytes
print(Lais)       # Mostra o valor e o nome ("altura")

##### Gerenciamento de Memória #####
ls()              # Lista todos os objetos criados até agora
rm(Lais)          # Remove o objeto 'Lais'

# Teste de erro (importante para o aluno entender a mensagem)
# typeof(Lais)    # Isso causará: Error: object 'Lais' not found


##### Exemplos ######
# imc
altura <- 1.60
peso <- 64
imc <- peso / (altura**2)

# área e volume de um retângulo
area <- base * altura

volume <- base*altura*largura


##### Construção de Tabela #####
# Importante: stringsAsFactors = FALSE era vital antigamente, hoje é o padrão.
alunos <- data.frame(
  nomes = c('Laís', 'Lívia', 'Guilherme', 'Fernanda', 'João', 'Matheus'),
  idade = c(34, 40, 36, 33, 50, 44),
  altura = c(1.60, 1.54, 1.66, 1.64, 1.70, 1.61)
)

##### Indexação Clássica [Linha, Coluna] #####
# 1. Remover a segunda coluna (idade)
dados_sem_col_2 <- alunos[, -2]

# 2. Remover a segunda linha (Lívia)
dados_sem_lin_2 <- alunos[-2, ]

# 3. Remover a segunda linha E a terceira coluna (altura)
dados_misto <- alunos[-2, -3]

##### Manipulação com dplyr #####
# O dplyr é mais intuitivo pois usa nomes em vez de números de índice.
library(dplyr)

# Remover colunas específicas pelo nome
# Nota: Não precisa de aspas dentro do select
dados_limpos <- alunos %>% 
  select(-idade, -altura)

#### adicionar linhas e colunas #####
peso <- c(54, 60, 66, 70, 84, 65)

# O nome da coluna pode ser definido diretamente no cbind
tabela1 <- cbind(alunos, peso = peso) 

###### renomear (caso necessário) #####
library(data.table)
# Já defini como 'peso' no cbind, esta linha é opcional, 
# mas é ótimo para ensinar como mudar nomes depois.
setnames(tabela1, "peso", "massa_corporal")

# Criando um novo aluno com a mesma estrutura
novo_aluno <- data.frame(nomes = "Carlos", idade = 28, altura = 1.80)

# Adicionando à tabela original
alunos <- rbind(alunos, novo_aluno)

##### salvar tabela #####
write.csv(alunos, file = "~/Downloads/alunos.csv", row.names = FALSE)

##### Abrir tabela #####
dados <- read.csv("~/Downloads/alunos.csv")

##### Tipos de Variáveis #####
name <- "Lais" 
typeof(name)     # character (texto)
numero <- 10   
typeof(numero)  # double (decimal implícito)
inteiro <- 10L  
typeof(inteiro)  # integer (inteiro explícito)
resposta <- TRUE  
typeof(resposta)  # logical (booleano)

# Verificação
class(name)
typeof(numero)

##### Vetores e Ordenação #####
idade <- c(50, 55, 33, 60, 70, 32, 21, 80, 15, 18)

# Crescente (Padrão)
idade_crescente <- sort(idade)

# Decrescente
idade_decrescente <- sort(idade, decreasing = TRUE)

##### Diferença importante #####
sort(idade)   # Retorna: 15, 18, 21...
order(idade) # Retorna as posições: 9, 10, 7... (o 15 está na 9ª posição)

##### Explorando os dados #####
length(idade)       # Quantos elementos existem?
sum(idade)          # Qual a soma das idades?
summary(idade)      # Resumo estatístico (Mínimo, Quartis, Média, Máximo)

# Visualização em aba separada
View(idade_decrescente)

# Visualização no Console 
print(idade_decrescente)

##### Testes Boleanos ####
2 == 2
3 == 4

2 != 2
3 != 4

1 > 2
5 > 2

1 >= 1
5 <= 2

idade <- c(22, 44, 32, 12, 60, 40, 12, 18, 15)
length(idade)
idade[idade >= 44]
idade[idade <= 22]

idade == 12
idade == 11
idade[idade == 12 | idade == 60]

##### Testes Booleanos (Operadores) ####
2 == 2   # TRUE
3 == 4   # FALSE

3 != 4   # TRUE (3 é diferente de 4)
3 != 3   # FALSE (3 é igual a 3)

1 > 2   # FALSE (1 não é maior que 2)
5 > 2   # TRUE (5 é maior que 2)

1 >= 1   # TRUE (1 é maior ou igual a 1)
5 <= 2   # FALSE (5 não é menor ou igual a 2)

##### Filtragem de Vetores #####
idade <- c(22, 44, 32, 12, 60, 40, 12, 18, 15)

# Filtrando valores específicos
maiores_44 <- idade[idade >= 44] 
posicao_12 <- idade[idade == 12]

##### Operadores Lógicos (E / OU) #####

# OU (|): Quero quem tem 12 OU 60 anos
idade[idade == 12 | idade == 60]

# E (&): Quero quem é maior de 18 E menor de 40 (intervalo)
idade[idade >= 18 & idade <= 40]

# NEGACAO (!): Quero todos, EXCETO quem tem 12 anos
idade[idade != 12]


##### Condicionais em R #####
a <- 5 
b <- 6

# Comparação simples com saída no console
if (a > b) {
  print("a é maior")
} else {
  print("b é maior ou igual")
}

# Verificação de igualdade
if (a == b) {
  print("condicional aceita: são iguais")
} else {
  print("condicional não aceita: são diferentes")
}

# Operação matemática condicional
# Se a > b, subtrai. Se não, soma.
if (a > b) {
  c <- a - b
  print(paste("Resultado da subtração:", c))
} else {
  c <- a + b
  print(paste("Resultado da soma:", c))
}


###### Conjunto/Contido ######
conjunto <- c(2, 4, 5, 7, 11, 1, 6, 12, 22)
b <- 2  
a <- 1
c <- 40

# Testes individuais
a %in% conjunto # Retorna TRUE
b %in% conjunto # Retorna TRUE
c %in% conjunto # Retorna FALSE

##### Estrutura Condicional com Texto Dinâmico #####
# O paste() junta o texto com o valor da variável 'c'
if (c %in% conjunto) {
  print(paste('O valor', c, 'está contido no conjunto'))
} else {
  print(paste('O valor', c, 'não está contido no conjunto'))
}

##### ifelse ####
a <- 3
b <- 4

ifelse(a == b, a, b)

conjunto <- c(2, 4, 5, 7, 11, 1, 6, 12, 22)
b <- 2  
a <- 1
c <- 40

ifelse(c %in% conjunto, b, a)

# Criando uma classificação rápida
idades <- c(15, 22, 12, 40)
status <- ifelse(idades >= 18, "Adulto", "Menor")
print(status)

# Exemplo: Classificando genes como expressos ou não
contagens <- c(0, 150, 0, 45, 1200)
gene_status <- ifelse(contagens > 0, "Expresso", "Silenciado")

# Adicionando isso a uma tabela (data.frame)
tabela_genes <- data.frame(contagens, gene_status)
View(tabela_genes)


##### Loop for (Automação) #####
# Objetivo: Contar de 1 a 100
valor <- 0
for (i in 1:100) {
  valor <- valor + 1
  print(valor) 
}
# O print() é necessário dentro do loop para aparecer no console

##### Funções (Criando ferramentas) #####
# Função para calcular o quadrado de um número
ao_quadrado <- function(num) {
  resultado <- num^2
  return(resultado)
}

# Testando a função
ao_quadrado(11) # Retorna 121
ao_quadrado(5)  # Retorna 25

# Função de IMC (Exemplo prático de saúde)
calcular_imc <- function(peso, altura) {
  imc <- peso / (altura^2)
  return(round(imc, 2)) # round limita as casas decimais
}

calcular_imc(70, 1.75)


##### Para abrir um arquivo clicando nele: #######
meus_dados <- read.csv(file.choose())

##### Para salvar escolhendo a pasta (digite o nome do arquivo na janela):  #####
write.csv(alunos, file = file.choose(new = TRUE), row.names = FALSE)
