jmp main
Palavra: var #6	
correto: var #1  
Escrever: var #1
PalavraSize: var #1
Letra: var #1		
Termo: var #6
Tentativa: var #1
Aleatoria: var #1
LetraPalavra: var #1
Jogador1: var #11
Jogador2: var #11
pontuacaoJogador1: var #1
static pontuacaoJogador1 + #0, #'0'
pontuacaoJogador2: var #1
static pontuacaoJogador2 + #0, #'0'
flagJogadores: var #1
static flagJogadores + #0, #'0'
vetorLetrasTermo: var #27
vetorLetrasPalavra: var #27
mensagemPerdeu : string "nao conseguiu adivinhar a palavra"
gameOver : string "PERDEU PLAY BOY"
mensagemGanhou : string "conseguiu adivinhar a palavra  eh vapo"
deNovo : string "Jogar de novo (s/n)"
mensagemPalavraCerta: string "Palavra correta: "
nomeJogador1 : string "Nome do primeiro jogador: "
nomeJogador2 : string "Nome do segundo jogador: "
digPalavra : string "Digite a palavra: "
pontoPara : string "Ponto para "
digitePalavraPara : string "digite uma palavra para"
tentarAdivinhar : string "tentar adivinhar"
empate : string "Nao temos um campeao de termo :("
ganhador : string "ganhou de"
placarfinalStr : string "Placar Final"
placar : string "Placar"
pressioneTecla : string "Pressine qualquer tecla"
bemvindo : string "Bem-vindo ao termo com amiguinhos"
main:
	push r0
	push r1
	call entrada
	call esperaTecla
	call ApagaTela
	call inputJogadores

jogo:
	loadn r0, #15
	loadn r1, #vetorLetrasTermo
	call zerarVetor
	store Escrever, r0 
	loadn r0, #0 
	
	store Tentativa, r0
	loadn r0, #480
	
	store Aleatoria, r0
		
	call ApagaTela
	call montaPlacar
	call inputPalavra
	
	call contaLetrasTermo
	
	call ApagaTela 
	call montaPlacar
	call desenhaTermo 
	call montaPlacar
	call jogarTermo 
	
	halt
	
	
	
;********************************************************
;                   INPUT JOGADORES
;********************************************************	
; Essa função escreve na tela as strings nomeJogador1 e nome Jogador2 e depois espera os usuarios digitarem os seus nomes de no maximo 10 letras

inputJogadores:
	
	push fr		
	push r0		
	push r1		
	push r2	
	push r3		
	push r4		
	push r5		
	push r6
	push r7
	loadn r0, #0
	loadn r1, #nomeJogador1
	loadn r2, #'\0'
	jogador1_loop:
		loadi r3, r1
		cmp r3, r2
		jeq jogador2
		outchar r3, r0
		inc r0
		inc r1
		jmp jogador1_loop
	
	jogador2:
		loadn r0, #160
		loadn r1, #nomeJogador2
	jogador2_loop:
		loadi r3, r1
		cmp r3, r2
		jeq lerJogador1
		outchar r3, r0
		inc r0
		inc r1
		jmp jogador2_loop
		
	lerJogador1:
		loadn r1, #13		
		loadn r2, #0		
		loadn r3, #Jogador1	
		loadn r5, #10		
		loadn r6, #25
		loadn r7, #32
	inputJogador1_Loop:
		call digLetra		
		   		
			load r0, Letra			
			cmp r0, r1					
			jeq inputJogador1_Fim		
			cmp r0, r7
			jne segue1
			
			
			eh_backspace1:
	            loadn r5, #0  
	            cmp r2, r5    
	            jeq inputJogador1_Loop 

	            dec r2 
	            dec r6  
	            loadn r0, #' ' 
	            outchar r0, r6 

	            jmp inputJogador1_Loop
			
			segue1:
				outchar r0, r6
				add r4, r3, r2
				storei r4, r0				
				inc r6
				inc r2
				loadn r5, #10
				cmp r2, r5						
				jne inputJogador1_Loop			
				
			loadn r1, #13 
	        inputJogador1_loop_enter:
	            call digLetra    

	            load r0, Letra       
	            cmp r0, r1         
	            jeq inputJogador1_Fim

	            cmp r0, r7  
	            jeq eh_backspace1
	        	jmp inputJogador1_loop_enter
			
	   inputJogador1_Fim:
	
		loadn r0, #0
		add r4, r3, r2
		storei r4, r0				
		loadn r0, #255
		loadn r4, #Letra
		storei r4, r0
		
		lerJogador2:
		loadn r1, #13		
		loadn r2, #0		
		loadn r3, #Jogador2	
		loadn r5, #10		
		loadn r6, #184
		loadn r7, #32
	inputJogador2_Loop:
		call digLetra		
		   		
			load r0, Letra				
			cmp r0, r1					
			jeq inputJogador2_Fim		
			cmp r0, r7
			jne segue2
			
			
			eh_backspace2:
	            loadn r5, #0 
	            cmp r2, r5    
	            jeq inputJogador2_Loop 
	            dec r2 
	            dec r6
	            loadn r0, #' ' 
	            outchar r0, r6 

	            jmp inputJogador2_Loop
			
			segue2:
				outchar r0, r6 
				add r4, r3, r2
				storei r4, r0				
				inc r6
				inc r2
				loadn r5, #10
				cmp r2, r5						
				jne inputJogador2_Loop			
				
			loadn r1, #13 
	        inputJogador2_loop_enter:
	            call digLetra    

	            load r0, Letra       
	            cmp r0, r1        
	            jeq inputJogador2_Fim

	            cmp r0, r7  
	            jeq eh_backspace2
	        	jmp inputJogador2_loop_enter
			
		inputJogador2_Fim:
			
			loadn r0, #0
			add r4, r3, r2
			storei r4, r0			
			loadn r0, #255
			loadn r4, #Letra
			storei r4, r0
			pop r7
			pop r6
			pop r5
			pop r4
			pop r3
			pop r2
			pop r1
			pop r0
			pop fr
			rts	
			
;********************************************************
;                   INPUT UMA PALAVRA
;********************************************************	
; Essa função espera o usuario digitar uma palavra 		
			
	inputPalavra:	
		push fr		
		push r0		
		push r1		
		push r2		
		push r3		
		push r4		
		push r5		
		push r6
		push r7
		call quemEscreve
		loadn r0, #160
		loadn r1, #digPalavra
		call Imprimestr
		lerPalavra:
		
			loadn r1, #13		
			loadn r2, #0	
			loadn r3, #Termo	
			loadn r5, #5		
			loadn r6, #177
			loadn r7, #32

		   inputPalavra_Loop:
				call digLetra		
			   		
				load r0, Letra			
				cmp r0, r1					
				jeq podeEnter1		
				cmp r0, r7
				jne segue
				
				
				eh_backspace:
		            loadn r5, #0 
		            cmp r2, r5   
		            jeq inputPalavra_Loop 

		            dec r2
		            dec r6 
		            loadn r0, #' '
		            outchar r0, r6 

		            jmp inputPalavra_Loop
				
				segue:
					outchar r0, r6 
					add r4, r3, r2
					storei r4, r0			
					inc r6
					inc r2
					loadn r5, #5
					cmp r2, r5						
					jne inputPalavra_Loop			
					
				loadn r1, #13 
		        inputPalavra_loop_enter:
		            call digLetra    

		            load r0, Letra        
		            cmp r0, r1         
		            jeq inputPalavra_Fim

		            cmp r0, r7  
		            jeq eh_backspace
		        	jmp inputPalavra_loop_enter
				
			podeEnter1:
				
				loadn r5, #5
				cmp r2, r5
				jeq inputPalavra_Fim
				jmp inputPalavra_Loop
			
		   inputPalavra_Fim:
			
			loadn r0, #0
			add r4, r3, r2
			storei r4, r0				
			loadn r0, #255
			loadn r4, #Letra
			storei r4, r0
			pop r7
			pop r6
			pop r5
			pop r4
			pop r3
			pop r2
			pop r1
			pop r0
			pop fr
			rts	
;------------------------		
;********************************************************
;                   DIGITE UMA LETRA
;********************************************************
; Espera que uma tecla seja digitada e salva na variavel global "Letra"
digLetra:	
	push fr
	push r0
	push r1
	push r2
	loadn r1, #255	
	loadn r2, #0	
   digLetra_Loop:
		inchar r0			
		cmp r0, r1		
		jeq digLetra_Loop	
		cmp r0, r2			
		jeq digLetra_Loop	

	store Letra, r0		
	
   digLetra_Loop2:	
	inchar r0		
	cmp r0, r1			
	jne digLetra_Loop2	
	
	pop r2
	pop r1
	pop r0
	pop fr
	rts
;********************************************************
;                   IMPRIME UMA STRING
;********************************************************
; Essa função Imprime qualquer string em qualquer posição na tela basta antes de chamar essa função carregar em r0 a posição da tela e em r1 o ponteiro pra a string
Imprimestr:	
	
	push r3
	push r4
	loadn r3, #'\0'
	
	ImprimestrLoop:	
		loadi r4, r1
		cmp r3, r4
		jeq ImprimestrSai
		outchar r4, r0
		inc r0
		inc r1
		jmp ImprimestrLoop
		
	ImprimestrSai:	
		pop r4	
		pop r3
		rts
;********************************************************
;                   APAGA TUDO DA TELA
;********************************************************
; Essa função apaga tudo na tela
ApagaTela:
	push fr
	push r0
	push r1
	
	loadn r0, #1200
	loadn r1, #' '
	
	   ApagaTela_Loop:
		dec r0
		outchar r1, r0
		jnz ApagaTela_Loop
 
	pop r1
	pop r0
	pop fr
	rts
	
;********************************************************
;                   ZERAR VETOR
;********************************************************
; Essa função zera os vetores que auxiliam na contagem de letras das palavras

zerarVetor:
	push r2
	push r3
	push r4
	loadn r2, #0
	loadn r4, #'0'
	zerarVetorLoop:
		add r3, r1, r2
		storei r3, r4
		inc r2
		loadn r3, #27
		cmp r2, r3
		jne zerarVetorLoop
	pop r4
	pop r3
	pop r2
	rts
	
;********************************************************
;                   ENTRADA
;********************************************************
; Essa função imprime a string bemvindo e espera o usuario digitar uma tecla
entrada:
	push fr
	push r0
	push r1
	
	loadn r0, #363
	loadn r1, #bemvindo
	call Imprimestr
	loadn r0, #648
	loadn r1, #pressioneTecla
	call Imprimestr
	pop r1
	pop r0
	pop fr
	rts
	
	
;********************************************************
;                   ESPERA UMA TECLA
;********************************************************
; Essa função espera uma tecla ser digitada	
esperaTecla:
	push fr
	push r0
	push r1
	
	call digLetra
	loadn r0, #255
	loadn r1, #Letra
	storei r1, r0
	pop r1
	pop r0
	pop fr
	rts



;********************************************************
;             CONTA AS LETRAS DA PALAVRA TERMO
;********************************************************
; Essa função conta cada letra da palavra que tem que ser adivinhada
contaLetrasTermo:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	loadn r0, #0
	loadn r1, #97
	loadn r2, #vetorLetrasTermo
	loadn r3, #Termo
	contaLetrasTermoLoop:
		add r4, r3, r0
		loadi r4, r4
		sub r5, r4, r1
		add r5, r2, r5
		loadi r6, r5
		inc r6
		storei r5, r6
		inc r0
		loadn r7, #5
		cmp r0, r7
		jne contaLetrasTermoLoop
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts	
	
	
;********************************************************
;             IMPRIME O PLACAR FINAL
;********************************************************
; Essa função imprime o placar final 	
placarFinal:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	loadn r0, #53
	loadn r1, #placarfinalStr
	call Imprimestr
	loadn r0, #240
	loadn r1, #Jogador1
	call Imprimestr
	loadn r1, #':'
	outchar r1, r0
	inc r0
	loadn r1, #' '
	outchar r1, r0
	inc r0
	load r1, pontuacaoJogador1
	outchar r1, r0
	loadn r0, #260
	loadn r1, #Jogador2
	call Imprimestr
	loadn r1, #':'
	outchar r1, r0
	inc r0
	loadn r1, #' '
	outchar r1, r0
	inc r0
	load r1, pontuacaoJogador2
	outchar r1, r0
	
	load r2, pontuacaoJogador1
	load r3, pontuacaoJogador2
	cmp r2, r3
	jgr vencedorJogador1
	cmp r3, r2
	jgr vencedorJogador2
	
	loadn r0, #403
	loadn r1, #empate
	call Imprimestr
	jmp saiPlacarFinal
	vencedorJogador1:
		loadn r0, #400
		loadn r1, #Jogador1
		call Imprimestr
		loadn r1, #' '
		outchar r1, r0
		inc r0
		loadn r1, #ganhador
		call Imprimestr
		loadn r1, #' '
		outchar r1, r0
		inc r0
		loadn r1, #Jogador2
		call Imprimestr
		jmp saiPlacarFinal
	vencedorJogador2:
		loadn r0, #400
		loadn r1, #Jogador2
		call Imprimestr
		loadn r1, #' '
		outchar r1, r0
		inc r0
		loadn r1, #ganhador
		call Imprimestr
		loadn r1, #' '
		outchar r1, r0
		inc r0
		loadn r1, #Jogador1
		call Imprimestr
	saiPlacarFinal:
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts


;********************************************************
;             QUEM GANHOU????????????????????????
;********************************************************
; Essa função descobre qem ganhou, caso a flag seja 0 e o jogador 1 acertou, logo o jogador 1 ganha um ponto, se a flag for 1 e o jogador 2 acertou 
; logo o jogador 2 ganha um ponto
quemGanhou:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	load r1, flagJogadores
	loadn r0, #'0'
	cmp r1, r0
	jeq jogador1Ganhou
	
	loadn r1, #Jogador2
	loadn r0, #0
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #mensagemGanhou
	call Imprimestr
	loadn r0, #160
	loadn r1, #pontoPara
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #Jogador2
	call Imprimestr
	loadn r0, #'0'
	loadn r1, #flagJogadores
	storei r1, r0
	loadn r1, #pontuacaoJogador2
	loadi r0, r1
	inc r0
	storei r1, r0
	jmp saiQuemGanhou
	
	
	
	jogador1Ganhou:
		loadn r1, #Jogador1
		loadn r0, #0
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #mensagemGanhou
		call Imprimestr
		loadn r0, #160
		loadn r1, #pontoPara
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #Jogador1
		call Imprimestr
		loadn r0, #'1'
		loadn r1, #flagJogadores
		storei r1, r0
		loadn r1, #pontuacaoJogador1
		loadi r0, r1
		inc r0
		storei r1, r0
		jmp saiQuemGanhou
		
	
	saiQuemGanhou:	
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts	
;********************************************************
;             QUEM PERDEU????????????????????????
;********************************************************
; Essa função descobre qem perdeu, caso a flag seja 0 o jogador 1 perdeu,  se a flag for 1 o jogador 2 perdeu 	
quemPerdeu:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	load r1, flagJogadores
	loadn r0, #'0'
	cmp r1, r0
	jeq jogador1Perdeu
	
	loadn r1, #Jogador2
	loadn r0, #0
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #mensagemPerdeu
	call Imprimestr
	loadn r0, #160
	loadn r1, #gameOver
	call Imprimestr
	loadn r0, #'0'
	loadn r1, #flagJogadores
	storei r1, r0
	jmp saiQuemPerdeu
	
	
	
	jogador1Perdeu:
		loadn r1, #Jogador1
		loadn r0, #0
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #mensagemPerdeu
		call Imprimestr
		loadn r0, #160
		loadn r1, #gameOver
		call Imprimestr
		loadn r0, #'1'
		loadn r1, #flagJogadores
		storei r1, r0
		jmp saiQuemPerdeu
		
	
	saiQuemPerdeu:	
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts	
	
;********************************************************
;             QUEM ESCREVE PRA QUEM
;********************************************************
; Essa função descobre quem vai escrever pra quem, caso a flag seja 0 o jogador 2 escreve para jogador 1, caso a flag seja 1, o jogador 1 escreve para o jogador 2
quemEscreve:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	load r1, flagJogadores
	loadn r0, #'0'
	cmp r1, r0
	jeq jogador2Escreve
	
	loadn r1, #Jogador1
	loadn r0, #0
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #digitePalavraPara
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #Jogador2
	call Imprimestr
	loadn r2, #' '
	outchar r2, r0
	inc r0
	loadn r1, #tentarAdivinhar
	jmp saiQuemEscreve
	
	
	
	jogador2Escreve:
		loadn r1, #Jogador2
		loadn r0, #0
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #digitePalavraPara
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #Jogador1
		call Imprimestr
		loadn r2, #' '
		outchar r2, r0
		inc r0
		loadn r1, #tentarAdivinhar
		jmp saiQuemEscreve
		
	
	saiQuemEscreve:	
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		rts	

;********************************************************
;                   DESENHA O JOGO
;********************************************************
desenhaTermo:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	loadn r0, #15
	loadn r1, #0
	loadn r3, #'_'
	loadn r4, #5
	loadn r5, #75
	loadn r6, #6
	desenhaTermoLoop1:
		loadn r2, #0
		desenhaTermoLoop2:
			outchar r3, r0
			inc r0
			inc r2
			cmp r2, r4
			jne desenhaTermoLoop2
		add r0, r0, r5
		inc r1
		cmp r1, r6
		jne desenhaTermoLoop1
	
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
	
;********************************************************
;             MONTAR O PLACAR
;********************************************************
; Essa função monta o placar no meio do jogo
montaPlacar:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	
	loadn r0, #615
	loadn r1, #placar
	call Imprimestr
	
	loadn r0, #760
	loadn r1, #Jogador1
	call Imprimestr
	
	loadn r1, #':'
	outchar r1, r0
	inc r0
	loadn r1, #' '
	outchar r1, r0
	inc r0
	load r1, pontuacaoJogador1
	outchar r1, r0
		
	loadn r0, #780
	loadn r1, #Jogador2
	call Imprimestr
	
	loadn r1, #':'
	outchar r1, r0
	inc r0
	loadn r1, #' '
	outchar r1, r0
	inc r0
	load r1, pontuacaoJogador2
	outchar r1, r0
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	pop fr
	rts
	

;********************************************************
;                   JOGAR TERMO
;********************************************************
; Essa função comeca o jogo 
jogarTermo:
	push fr
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	loadn r1, #13
	loadn r2, #6
	load r4, Tentativa
	loadn r3, #Palavra
	load r6, Escrever
	loadn r7, #32
	cmp r2, r4
	jeq perdeu
	inc r4
	store Tentativa, r4
	loadn r2, #0
	inputPalavraTermo_Loop:
		call digLetra		
	   		
		load r0, Letra	
		cmp r0, r1				
		jeq podeEnter		
		cmp r0, r7
		jne segueTermo
		
		
		eh_backspaceTermo:
            loadn r5, #0 
            cmp r2, r5  
            jeq inputPalavraTermo_Loop

            dec r2 
            dec r6 
            loadn r0, #'_' 
            outchar r0, r6 

            jmp inputPalavraTermo_Loop
		
		segueTermo:
			outchar r0, r6 
			add r4, r3, r2
			storei r4, r0				
			inc r6
			inc r2
			loadn r5, #5
			cmp r2, r5						
			jne inputPalavraTermo_Loop		
			
		loadn r1, #13
        inputPalavraTermo_loop_enter:
            call digLetra    

            load r0, Letra        
            cmp r0, r1        
            jeq inputPalavraTermo_Fim

            cmp r0, r7  
            jeq eh_backspaceTermo
        	jmp inputPalavraTermo_loop_enter
		
   	podeEnter:
		
		loadn r5, #5
		cmp r2, r5
		jeq inputPalavraTermo_Fim
		jmp inputPalavraTermo_Loop
		
	inputPalavraTermo_Fim:
		loadn r0, #0
		add r4, r3, r2
		storei r4, r0				
		loadn r0, #255
		loadn r4, #Letra
		storei r4, r0
	
	Verificador:
		loadn r0, #0
		loadn r2, #LetraPalavra
		loadn r3, #Termo
		loadn r4, #Palavra 
		load r7, Escrever
		store correto, r0
		loadn r1, #vetorLetrasPalavra
		call zerarVetor
		Loop_1:
			add r5, r3, r0
			loadi r5, r5
			add r6, r4, r0
			loadi r6, r6
			call Igual
			loadn r2, #5
			inc r7
			inc r0
			inc r1
			cmp r0, r2
			jne Loop_1
		loadn r0, #0
		load r7, Escrever
		Loop_2:
			add r6, r4, r0
			loadi r6, r6
			call charVerde
			inc r7
			loadn r2, #5
			inc r0
			cmp r0, r2
			jne Loop_2
		call estaCompleto 
	Igual:
		cmp r5, r6
		jeq pintaVerde
		rts
		
	charIgual:
		cmp r0, r1 
		jeq pintaVerde 
		cmp r0, r1 
		jne charVerde 
		rts
	pintaVerde:
		loadn r5, #512 
		loadn r2, #97
		loadn r1, #vetorLetrasPalavra
		sub r2, r6, r2
		add r2, r1, r2
		loadi r1, r2
		inc r1
		storei r2, r1
		add r6, r5, r6 
		outchar r6, r7 
		add r5, r0, r4 
		storei r5, r6
		loadn r5, #1 
		load r6, correto 
		add r6, r6, r5 
		store correto, r6
		rts
	
	charVerde:
		loadn r3, #130
		cmp r6, r3
		jle precisaAmarelo
		rts 
		
	precisaAmarelo:
		loadn r3, #97
		sub r2, r6, r3
		loadn r1, #vetorLetrasPalavra
		
		add r2, r2, r1
		loadi r2, r2
		loadn r1, #vetorLetrasTermo
		sub r5, r6, r3
		add r5, r5, r1
		loadi r5, r5
		cmp r2, r5
		jle pintaAmarelo
		rts
		
	pintaAmarelo:
		loadn r1, #vetorLetrasPalavra
		loadn r2, #97
		sub r2, r6, r2
		add r2, r1, r2
		loadi r1, r2
		inc r1
		storei r2, r1
		loadn r5, #2816 
		add r6, r5, r6 
		outchar r6, r7 
		rts
	estaCompleto:
		loadn r5, #75
		add r7, r7, r5 
		store Escrever, r7 
		load r0, correto 
		loadn r1, #5 
		cmp r0, r1 
		jne jogarTermo 
	
	ganhou:		
		call ApagaTela 
		call quemGanhou
		call mostrarPalavraCerta
		call voltaJogo
		call fim 

	perdeu:
		call ApagaTela
		call quemPerdeu
		call mostrarPalavraCerta
		call voltaJogo
		call fim
		
	mostrarPalavraCerta:
		push r0	
		push r1	
		push r3	
		push r4	
		loadn r0, #320
		loadn r1, #mensagemPalavraCerta
		loadn r3, #'\0'
	
		mostrarLoop1:	
			loadi r4, r1
			cmp r3, r4
			jeq mostrarTermo
			outchar r4, r0
			inc r0
			inc r1
			jmp mostrarLoop1
		
		
		mostrarTermo:
			loadn r1, #Termo
			mostrarLoop2:	
				loadi r4, r1
				cmp r3, r4
				jeq mostrarSai
				outchar r4, r0
				inc r0
				inc r1
				jmp mostrarLoop2
		mostrarSai:	
			pop r4	
			pop r3
			pop r1
			pop r0
			rts
	voltaJogo:
		push fr
		push r0
		push r1
		push r2
		push r3
		push r4
		loadn r2, #610
		loadn r3, #deNovo
		loadn r4, #'\0'
		voltaJogo_loop:	
			loadi r0, r3
			cmp r4, r0
			jeq voltaJogo_SN
			outchar r0, r2
			inc r3
			inc r2
			jmp voltaJogo_loop
		
		voltaJogo_SN:
			loadn r1, #115
			loadn r2, #110
			call digLetra
			load r0, Letra
			cmp r0, r1
			jeq sim
			cmp r0, r2
			jeq nao
			jmp voltaJogo_SN
			sim:
				loadn r0, #255
				loadn r4, #Letra
				storei r4, r0
				call jogo
			nao:
				call ApagaTela
				call placarFinal
	fim:
		pop r7
		pop r6
		pop r5
		pop r4
		pop r3
		pop r2
		pop r1
		pop r0
		pop fr
		halt
	