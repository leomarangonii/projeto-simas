# Projeto de Prática em Organização e Arquitetura de Computadores
## Descrição
Este projeto envolve o desenvolvimento de um jogo em Assembly inspirado no popular jogo "Termo", com algumas modificações, além da implementação de uma nova funcionalidade no processador. O código fonte do jogo pode ser encontrado no arquivo termo.asm, e a nova função para o processador (NAND) está disponível na pasta zip DE0_CV.zip.

### Jogo "Termo" Modificado
No jogo original "Termo", um único usuário tenta adivinhar a palavra do dia. No entanto, neste projeto, fizemos modificações para permitir que dois usuários joguem um contra o outro, competindo para ver quem adivinha mais palavras.

### Funcionalidade NAND na CPU
Implementamos a funcionalidade NAND no processador. A operação NAND (Not AND) é uma operação lógica que produz uma saída verdadeira somente se pelo menos uma das entradas for falsa. A tabela verdade da operação NAND é a seguinte:


| Entrada A | Entrada B | Saída (A NAND B) |
|:---------:|:---------:|:----------------:|
|     0     |     0     |        1         |
|     0     |     1     |        1         |
|     1     |     0     |        1         |
|     1     |     1     |        0         |
Esta nova funcionalidade foi integrada na CPU para expandir suas capacidades lógicas.

### Vídeo Explicativo
Para uma explicação mais detalhada sobre o jogo desenvolvido e a nova funcionalidade, assista ao vídeo no seguinte link: https://youtu.be/cjTSLVhipbY.

### Integrantes
- Antônio Carlos de Almeida Micheli Neto
- Bruno Kazuya Yamato Sakaji
- Gabriel de Andrade Abreu
- Guilherme Antonio Costa Bandeira
- Isabela Beatriz Sousa Nunes Farias
- Jesus Sena Fernandes
- Julia Cavallio Orlando
- Leonardo Marangoni
- Leticia Raddatz Jönck
- Maria Rita Gomides Cruz Hott

Este projeto foi desenvolvido como parte da disciplina de Organização e Arquitetura de Computadores, visando a aplicação prática dos conceitos aprendidos em sala de aula.
