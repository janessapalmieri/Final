%include "/usr/local/share/csc314/asm_io.inc"

; Burger Toppings
%define LETTUCE		32		; 100000
%define ONIONS		16		; 010000
%define B_TOMATOES	8		; 001000
%define	PICKLES		4		; 000100
%define MUSTARD		2		; 000010
%define KETCHUP		1		; 000001

;Icecream Toppings
%define CHOCOLATE		32		; 100000
%define CARAMEL			16		; 010000
%define WHIPPED_CREAM	8		; 001000
%define	CHERRY			4		; 000100
%define SPRINKLES		2		; 000010
%define OREOS			1		; 000001

;Pizza Toppings
%define PEPPERONI		32		; 100000
%define S_CHEESE		16		; 010000
%define TOMATOES		8		; 001000
%define	SAUSAGES		4		; 000100
%define SPINACH 		2		; 000010
%define PINEAPPLE		1		; 000001

;Salad Toppings
%define CROUTONS		32		; 100000
%define S_TOMATOES		16		; 010000
%define MUSHROOMS		8		; 001000
%define	COTTAGE_CHEESE	4		; 000100
%define DRESSING		2		; 000010
%define CHEESE			1		; 000001

;Cake Toppings
%define CHOCO_FROSTING		32		; 100000
%define CHOCO_CAKE			16		; 010000
%define VANILLA_FROSTING	8		; 001000
%define	VANILLA_CAKE		4		; 000100
%define SUPRISE_FILLING		2		; 000010
%define CANDY_CORN			1		; 000001

segment .data

;Wecome Strings
str_WELCOME		db 		"Welcome to AJ's Food Shack! Here is our menu:", 0
str_ITEM		db 		"ITEM 		BASE PRICE",0
str_RECEIPT		db		"Here is your receipt (with totals): $",0
str_ELSE		db 		"Would you like to order anything else? (y/n) ",0
str_PAY			db 		"Would you like to pay? (y/n) ", 0
str_CODE		db 		"Here is your code: ", 0
str_CHEF		db 		"Please take to Chef Annabelle.", 0

;Items
str_BURGER	 	db 		"1. Burger	$3",0
str_ICECREAM	db 		"2. Icecream	$2",0
str_PIZZA	 	db 		"3. Pizza	$5",0
str_SALAD		db 		"4. Salad	$3",0
str_CAKE		db  	"5. Cake		$10",0

;Print Out
str_order		db 		"What would you like to order? (Enter the number): ",0
str_likeOn 		db		"What would you like on %s", 0

str_haveNiceDay db 		"Have a nice day! :)", 10, 0

;Burger Toppings
str_lettuce 	db 		"Lettuce? ($1): ",0
str_onions	 	db 		"Onions? ($1): ",0
str_tomatoes 	db 		"Tomatoes? ($1): ",0
str_pickles 	db 		"Pickles? ($1): ",0
str_mustard 	db 		"Mustard? ($1): ",0
str_ketchup 	db		"Ketchup? ($1): ",0

;Icecream Toppings
str_chocoSyrup	db 		"Chocolate Syrup? ($1): ", 0
str_CaramelSy	db 		"Caramel Syrup? ($1): ", 0
str_whippedC	db 		"Whipped Cream? ($1): ", 0
str_cherry 		db 		"Cherry? ($1): ", 0
str_sprinkles	db 		"Sprinkles? ($1):", 0
str_oreos		db 		"Oreos? ($2):", 0

;Pizza Toppings
str_pepperoni 	db		"Pepperoni? ($1): ", 0
str_cheese		db 		"Extra Cheese? ($1): ", 0
str_Ptomatoes	db 		"Tomatoes? ($1): ", 0
str_sausage 	db 		"Sausage? ($2): ", 0
str_spinach		db 		"Spinach? ($1): ", 0
str_pineapple	db 		"Pineapple? ($2): ", 0

;Salad Toppings
str_croutons 	db 		"Croutons? ($1): ", 0
str_sTomatoes 	db 		"Tomatoes? ($1): ", 0
str_mushrooms	db 		"Mushrooms? ($1): ", 0
str_cottageCh	db 		"Cottage Cheese? ($1): ", 0
str_dressing 	db 		"Dressing? ($1): ", 0
str_shreddedCh	db 		"Shredded Cheese? ($1): ", 0

;Cake Toppings
str_chocoFro	db 		"Chocolate Frosting? ($3): ", 0
str_chocoCake	db 		"Chocolate Cake? ($1): ", 0
str_VanillaFro	db 		"Vanilla Frosting? ($3): ", 0
str_VanillaCake	db 		"Vanilla Cake? ($1): ", 0
str_supriseFill	db 		"Suprise Filling? ($5): ", 0
str_candyCorn	db 		"Candy Corn? ($1): ", 0

str_space 		db		" ", 0


str_ascii        db      0x1b,"[34m ○ ",10,"く|)へ   < Staff",10,"  〉 ",10, 0x1b,"[39m ┗┓  ",10,"   ┗┓", 0x1b, "[32m　    ヾ○ｼ    < You",0x1b, "[39m",10,"  　 ┗┓",0x1b, "[32m    ヘ/ 　 　 ",0x1b, "[39m",10," 　    ┗┓",0x1b,"[32m  ノ ",0x1b, "[39m",10,"　 　 　 ┗┓",10,0

str_ascii2		db 		0x1b,"[34m               _ _       ______              _    _____ _                _    ",10, "     /\       | ( )     |  ____|            | |  / ____| |              | |   ", 10, "    /  \      | |/ ___  | |__ ___   ___   __| | | (___ | |__   __ _  ___| | __", 10, "   / /\ \ _   | | / __| |  __/ _ \ / _ \ / _` |  \___ \| '_ \ / _` |/ __| |/ /", 10, "  / ____ \ |__| | \__ \ | | | (_) | (_) | (_| |  ____) | | | | (_| | (__|   < ", 10, " /_/    \_\____/  |___/ |_|  \___/ \___/ \__,_| |_____/|_| |_|\__,_|\___|_|\_\",0x1b, "[39m",10, 0
segment .bss

	total 		resd 	1


segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

		print_ascii2:
				call print_nl
				mov eax, str_ascii2
				call print_string
				call print_nl

		mov ecx, 1 
		mov DWORD[total],0
		
	
		;----------PRINTING INTRO--------------
		mov eax, str_WELCOME 
		call print_string
		call print_nl

		again:
		mov edi, 0 ;000000
		mov bl, 'y'

		mov eax, str_ITEM
		call print_string
		call print_nl

		mov eax, str_BURGER
		call print_string
		call print_nl

		mov eax, str_ICECREAM
		call print_string
		call print_nl

		mov eax, str_PIZZA
		call print_string
		call print_nl

		mov eax, str_SALAD
		call print_string
		call print_nl

		mov eax, str_CAKE
		call print_string
		call print_nl

		mov eax, str_order
		call print_string
		call read_int

		mov esi, eax
		
		;---------Comparing Foods------------------

			if_burger:
				cmp eax, 1
				je burger_toppings 
				jne if_icecream
				burger_toppings:
				add DWORD[total], 3

					if_lettuce:
						mov eax, str_lettuce
						call print_string
						call read_char
						call read_char
						mov bl, 'y'
						cmp al, bl
						jne if_onions
							or edi, LETTUCE
							add DWORD[total], 1

					if_onions:
						mov eax, str_onions
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_tomatoes
							or edi, ONIONS
							add DWORD[total], 1
					
					if_tomatoes:
						mov eax, str_tomatoes
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_pickles
							or edi, TOMATOES
							add DWORD[total], 1
						
					if_pickles:
						mov eax, str_pickles
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_mustard
							or edi, PICKLES
							add DWORD[total], 1

					if_mustard:
						mov eax, str_mustard
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_ketchup
							or edi, MUSTARD
							add DWORD[total], 1

					if_ketchup:
						mov eax, str_ketchup
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_anythingElse
							or edi, KETCHUP
							add DWORD[total], 1
					
					jmp if_anythingElse

			if_icecream:
				cmp eax, 2
				je icecream_toppings
				jne if_pizza
				icecream_toppings:
				add DWORD[total], 2

					if_chocoSyrup:
						mov eax, str_chocoSyrup
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_caramelSyrup
							or edi, CHOCOLATE
							add DWORD[total], 1

					if_caramelSyrup:
						mov eax, str_CaramelSy
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_whippedCream
							or edi, CARAMEL
							add DWORD[total], 1

					if_whippedCream:
						mov eax, str_whippedC
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_cherry
							or edi, WHIPPED_CREAM
							add DWORD[total], 1

					if_cherry:
						mov eax, str_cherry
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_sprinkles
							or edi, CHERRY
							add DWORD[total], 1

					if_sprinkles:
						mov eax, str_sprinkles
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_oreos
							or edi, SPRINKLES
							add DWORD[total], 1

					if_oreos:
						mov eax, str_oreos
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_anythingElse
							or edi, OREOS
							add DWORD[total], 2

					jmp if_anythingElse		

			if_pizza:
				cmp eax, 3
				je pizza_toppings
				jne if_salad
				pizza_toppings:	
				add DWORD[total], 5

					if_pepperoni:
					mov eax, str_pepperoni
						call print_string
						call read_char
						call read_char
						mov bl, 'y'
						cmp al, bl
						jne if_cheese
							or edi, PEPPERONI
							add DWORD[total], 1

					if_cheese:
					mov eax, str_cheese
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_Ptomatoes
							or edi, S_CHEESE
							add DWORD[total], 1

					if_Ptomatoes:
					mov eax, str_tomatoes
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_sausage
							or edi, TOMATOES
							add DWORD[total], 1

					if_sausage:
					mov eax, str_sausage
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_spinach
							or edi, SAUSAGES
							add DWORD[total], 2

					if_spinach:
					mov eax, str_spinach
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_pineapple
							or edi, SPINACH
							add DWORD[total], 1

					if_pineapple:
					mov eax, str_pineapple
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_anythingElse
							or edi, PINEAPPLE	
							add DWORD[total], 2

					jmp if_anythingElse

			if_salad:
				cmp eax, 4
				je salad_toppings
				jne if_cake
				salad_toppings:
				add DWORD[total], 3

					if_croutons:
					mov eax, str_croutons
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_Stomatoes
							or edi, CROUTONS
							add DWORD[total], 1

					if_Stomatoes:
					mov eax, str_sTomatoes
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_mushrooms
							or edi, S_TOMATOES
							add DWORD[total], 1

					if_mushrooms:
					mov eax, str_mushrooms
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_cottageCheese
							or edi, MUSHROOMS
							add DWORD[total], 1

					if_cottageCheese:
					mov eax, str_cottageCh
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_dressing
							or edi, COTTAGE_CHEESE
							add DWORD[total], 1

					if_dressing:
					mov eax, str_dressing
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_sCheese
							or edi, DRESSING
							add DWORD[total], 1

					if_sCheese:
					mov eax, str_shreddedCh
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_anythingElse
							or edi, CHEESE
							add DWORD[total], 1

					jmp if_anythingElse

			if_cake:
				cmp eax, 5
				je cake_toppings
				jne if_NoPay
				cake_toppings:
				add DWORD[total], 10

					if_chocoFrosting:
					mov eax, str_chocoFro
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_chocoCake
							or edi, CHOCO_FROSTING
							add DWORD[total], 3

					if_chocoCake:
					mov eax, str_chocoCake
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_vanillaFrosting
							or edi, CHOCO_CAKE
							add DWORD[total], 1

					if_vanillaFrosting:
					mov eax, str_VanillaFro
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_vanillaCake
							or edi, VANILLA_FROSTING
							add DWORD[total], 3

					if_vanillaCake:
					mov eax, str_VanillaCake
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_supriseFilling
							or edi, VANILLA_CAKE
							add DWORD[total], 1

					if_supriseFilling:
					mov eax, str_supriseFill
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_candyCorn
							or edi, SUPRISE_FILLING
							add DWORD[total], 5

					if_candyCorn:
					mov eax, str_candyCorn
						call print_string
						call read_char
						call read_char
						cmp al, bl
						jne if_anythingElse
							or edi, CANDY_CORN
							add DWORD[total], 1

					jmp if_anythingElse

;------------------PRINTING----------------------
			if_anythingElse:
				mov bl, 'y'
				mov eax, str_ELSE
				call print_string
				call read_char
				call read_char
				mov cl, al

			print_code:
				call print_nl
				mov eax, str_CODE
				call print_string

				mov eax, esi
				call print_int
				mov eax, str_space
				call print_string
				mov eax, edi
				call print_int
				call print_nl
				mov eax, str_CHEF
				call print_string
				call print_nl
				cmp cl, bl
				je again

			print_receipt:
				mov eax, str_RECEIPT
				call print_string
				mov eax, DWORD[total]
				call print_int
				call print_nl

			if_NoPay:
				;ask if they want to pay
				mov eax, str_PAY
				call print_string
				call read_char
				call read_char
				call print_nl
				mov bl, 'y'
				cmp al, bl
				jne print_ascii
					mov eax, str_haveNiceDay
					call print_string
					jmp end


				print_ascii:
				mov eax, str_ascii
				call print_string

				end:
			
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
