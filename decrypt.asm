%include "/usr/local/share/csc314/asm_io.inc"

%define LETTUCE			32		; 100000
%define ONION			16		; 010000
%define B_TOMATOES    		8		; 001000
%define PICKLES        		4		; 000100
%define MUSTARD        		2		; 000010
%define KETCHUP        		1		; 000001

%define CHOCOLATE		32		; 100000
%define CARAMEL			16		; 010000
%define WHIPPED_CREAM		8		; 001000
%define CHERRY			4		; 000100
%define SPRINKLES		2		; 000010
%define OREOS			1		; 000001

%define PEPPERONI		32		; 100000
%define CHEESE			16        	; 010000
%define TOMATOES        	8        	; 001000
%define SAUSAGES		4        	; 000100
%define SPINACH         	2        	; 000010
%define PINEAPPLE       	1        	; 000001

%define CROUTONS		32       	; 100000
%define S_TOMATOES      	16       	; 010000
%define MUSHROOMS		8        	; 001000
%define COTTAGE_CHEESE		4       	; 000100
%define DRESSING        	2        	; 000010
%define S_CHEESE		1        	; 000001

%define CHOCO_FROSTING		32		; 100000
%define CHOCO_CAKE		16     		; 010000
%define VANILLA_FROSTING	8   		; 001000
%define VANILLA_CAKE		4       	; 000100
%define SUPRISE_FILLING		2       	; 000010
%define CANDY_CORN		1       	; 000001

segment .data
	; Prompts
	numofcodes	db	"Thank you for stopping by! How many codes will you be entering? ", 0
	code		db	"Please enter the code(s) along with the initial identifer: ", 0

	; Messages
	ordered		db	"You ordered a %s with:",10,0
	endmsg		db	"Thank you, please visit again!", 0

	; Food Items
	str_burger	db	"Burger",0
	str_icecream	db	"Ice Cream",0
	str_pizza	db	"Pizza",0
	str_salad	db	"Salad",0
	str_cake	db	"Cake",0

	; Burger Toppings
	str_lettuce 	db	"- Lettuce ",0
	str_onions	db	"- Onions ",0
	str_tomatoes 	db	"- Tomatoes ",0
	str_pickles 	db	"- Pickles ",0
	str_mustard 	db	"- Mustard ",0
	str_ketchup 	db	"- Ketchup ",0

	; Ice Cream Toppings
	str_chocoSyrup	db	"- Chocolate Syrup ", 0
	str_CaramelSy	db	"- Caramel Syrup ", 0
	str_whippedC	db	"- Whipped Cream ", 0
	str_cherry 	db	"- Cherry ", 0
	str_sprinkles	db	"- Sprinkles ", 0
	str_oreos	db	"- Oreos ", 0

	; Pizza Toppings
	str_pepperoni 	db	"- Pepperoni ", 0
	str_cheese	db 	"- Extra Cheese ", 0
	str_Ptomatoes	db 	"- Tomatoes ", 0
	str_sausage 	db 	"- Sausage ", 0
	str_spinach	db 	"- Spinach ", 0
	str_pineapple	db 	"- Pineapple ", 0

	; Salad Toppings
	str_croutons 	db 	"- Croutons ", 0
	str_sTomatoes 	db 	"- Tomatoes ", 0
	str_mushrooms	db 	"- Mushrooms ", 0
	str_cottageCh	db 	"- Cottage Cheese ", 0
	str_dressing 	db 	"- Dressing ", 0
	str_shreddedCh	db 	"- Shredded Cheese ", 0

	; Cake Toppings
	str_chocoFro	db 	"- Chocolate Frosting ", 0
	str_chocoCake	db 	"- Chocolate Cake ", 0
	str_VanillaFro	db 	"- Vanilla Frosting ", 0
	str_VanillaCake	db 	"- Vanilla Cake ", 0
	str_supriseFill	db	"- Suprise Filling ", 0
	str_candyCorn	db 	"- Candy Corn ", 0

	; Ascii art
	welcomeArt	db	0x1b,"[93m  _____ _           __ _        _____                  _            ",10,"  / ____| |         / _( )      / ____|                | |           ",10," | |    | |__   ___| |_|/ ___  | |     ___  _   _ _ __ | |_ ___ _ __ ",10," | |    | '_ \ / _ \  _| / __| | |    / _ \| | | | '_ \| __/ _ \ '__|",10," | |____| | | |  __/ |   \__ \ | |___| (_) | |_| | | | | ||  __/ |   ",10,"  \_____|_| |_|\___|_|   |___/  \_____\___/ \__,_|_| |_|\__\___|_|   ",0x1b,"[39m",10,0
	burgerArt   	db      0x1b,"[38;5;215m          _..----.._       ",10,"        .'     o    '.     ",10,"       /   o       o  \    ",10,"      |o        o     o|  ",10,"      /'-.._o     __.-'\  ",10,"      \      `````     /  ",10,"      |``--........--'`|  ",10,"       \              /",10,"        `'----------'`",10,0x1b,"[39m",10,0
	icecreamArt   	db      0x1b,"[38;5;15m       ()",10,"      (__)",10,"     (____)",10,"    (______)",10,"   (________)",10,"    \/\/\/\/",10,"     \/\/\/",10,"      \/\/",10,"       \/",10,0x1b,"[39m",10,0
	pizzaArt    	db      0x1b,"[91m                       ___",10,"                        |  ~~--.",10,"                        |%=@%%/",10,"                        |o%%%/",10,"                     __ |%%o/",10,"               _,--~~ | |(_/ ._",10,"            ,/'  m%%%%| |o/ /  `\.",10,"           /' m%%o(_)%| |/ /o%%m `\",10,"         /' %%@=%o%%%o|   /(_)o%%% `\",10,"        /  %o%%%%%=@%%|  /%%o%%@=%%  \",10,"       |  (_)%(_)%%o%%| /%%%=@(_)%%%  |",10,"       | %%o%%%%o%%%(_|/%o%%o%%%%o%%% |",10,"       | %%o%(_)%%%%%o%(_)%%%o%%o%o%% |",10,"       |  (_)%%=@%(_)%o%o%%(_)%o(_)%  |",10,"        \ ~%%o%%%%%o%o%=@%%o%%@%%o%~ /",10,"         \. ~o%%(_)%%%o%(_)%%(_)o~ ,/",10,"           \_ ~o%=@%(_)%o%%(_)%~ _/",10,"             `\_~~o%%%o%%%%%~~_/'",10,"                `--..____,,--'",10,0x1b,"[39m",10,0
	saladArt    	db      0x1b,"[32m  .~~~(,&,)~~~.",10," |^----------^|",10,"  \          /",10,"   `========`  ",10,0x1b,"[39m",10,0
	cakeArt   	db      0x1b,"[96m       $$   $$   $$   ",10,"    ___||___||___||____",10,"   | *  *  *  *   *  * |",10,"   |*  *  *  *   *  *  |",10,"   | *  *   *  *  *  * |",10,"   |___________________|",0x1b,"[39m",10,0

segment .bss

	arr		resd	100

segment .text
	global  asm_main
	extern	scanf
	extern	printf

asm_main:
	push	ebp
	mov	ebp, esp
	; ********** CODE STARTS HERE **********

	; edi = total
	; esi = identifier
	; edx = number of codes
	; Print chef's counter

	call	print_nl
	mov	eax, welcomeArt
	call	print_string
	call	print_nl

	; Request number of codes
	mov	eax, numofcodes				; amount to loop
	call	print_string
	call	read_int
	mov	edx, eax				; edx is number of integers to accept

	; Loop to accept proper amount of codes
	mov		ecx, 0
	top_loop:
		mov	eax, code			; Prompt to enter code
		call	print_string
		call	read_int						
		mov	esi, eax			; Identifier
		call	read_int
		mov	DWORD [arr + ecx * 4], eax	; codes

		; Checks identifier to see which food item 
		cmp		esi, 1
		je		burger
		cmp		esi, 2
		je		ice_cream
		cmp		esi, 3
		je		pizza
		cmp		esi, 4
		je		salad
		cmp		esi, 5
		je		cake
		jmp		end

		burger:
			; Message
			pusha
			push	str_burger
			push	ordered
			call	printf
			add	esp, 8
			popa

			; Lettuce
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, LETTUCE
			cmp	ebx, 0
			je	NoL
			mov	eax, str_lettuce
			call	print_string
			call	print_nl
			NoL:

			; Onions
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, ONION
			cmp	ebx, 0
			je	NoO
			mov	eax, str_onions
			call	print_nl
			call	print_string
			NoO:

			; Tomatoes
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, B_TOMATOES
			cmp	ebx, 0
			je	NoT
			mov	eax, str_tomatoes
			call	print_nl
			call	print_string
			NoT:

			; Pickles
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, PICKLES
			cmp	ebx, 0
			je	NoP
			mov	eax, str_pickles
			call	print_nl
			call	print_string
			NoP:

			; Mustard
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, MUSTARD
			cmp	ebx, 0
			je	NoM
			mov	eax, str_mustard
			call	print_nl
			call	print_string
			NoM:

			; Ketchup
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, KETCHUP
			cmp	ebx, 0
			je	NoK
			mov	eax, str_ketchup
			call	print_nl
			call	print_string
			NoK:
			
			; Print
			call	print_nl
			mov	eax, burgerArt
			call	print_string
			call	print_nl
			jmp	end
		end_burger:

		ice_cream:
			; Message
			pusha
			push	str_icecream
			push	ordered
			call	printf
			add	esp, 8
			popa

			; Chocolate Syrup
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CHOCOLATE
			cmp	ebx, 0
			je	NoChoco
			mov	eax, str_chocoSyrup
			call	print_nl
			call	print_string
			NoChoco:

			; Caramel Syrup
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CARAMEL
			cmp	ebx, 0
			je	NoCara
			mov	eax, str_CaramelSy
			call	print_nl
			call	print_string
			NoCara:

			; Whipped Cream
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, WHIPPED_CREAM
			cmp	ebx, 0
			je	NoWhip
			mov	eax, str_whippedC
			call	print_nl
			call	print_string
			NoWhip:

			; Cherry
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CHERRY
			cmp	ebx, 0
			je	NoCherry
			mov	eax, str_cherry
			call	print_nl
			call	print_string
			NoCherry:

			; Sprinkles
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, SPRINKLES
			cmp	ebx, 0
			je	NoSprink
			mov	eax, str_sprinkles
			call	print_nl
			call	print_string
			NoSprink:

			; Oreos
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, OREOS
			cmp	ebx, 0
			je	NoOreo
			mov	eax, str_oreos
			call	print_nl
			call	print_string
			NoOreo:

			; Print
			call	print_nl
			call	print_nl
			mov	eax, icecreamArt
			call	print_string
			call	print_nl
			jmp	end
		end_ice_cream:

		pizza:
			; Message
			pusha
			push	str_pizza
			push	ordered
			call	printf
			add	esp, 8
			popa

			; Pepperoni
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, PEPPERONI
			cmp	ebx, 0
			je	NoPep
			mov	eax, str_pepperoni
			call	print_nl
			call	print_string
			NoPep:

			; Cheese
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CHEESE
			cmp	ebx, 0
			je	NoChee
			mov	eax, str_cheese
			call	print_nl
			call	print_string
			NoChee:

			; Tomatoes
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, TOMATOES
			cmp	ebx, 0
			je	NoTom
			mov	eax, str_Ptomatoes
			call	print_nl
			call	print_string
			NoTom:

			; Sausages
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, SAUSAGES
			cmp	ebx, 0
			je	NoSaus
			mov	eax, str_sausage
			call	print_nl
			call	print_string
			NoSaus:

			; Spinach
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, SPINACH
			cmp	ebx, 0
			je	NoSpin
			mov	eax, str_spinach
			call	print_nl
			call	print_string
			NoSpin:

			; Pineapple
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, PINEAPPLE
			cmp	ebx, 0
			je	NoPine
			mov	eax, str_pineapple
			call	print_nl
			call	print_string
			NoPine:

			; Print
			call	print_nl
			mov	eax, pizzaArt
			call	print_string
			call	print_nl
			jmp	end
		end_pizza:

		salad:
			; Message
			pusha
			push	str_salad
			push	ordered
			call	printf
			add	esp, 8
			popa

			; Croutons
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CROUTONS
			cmp	ebx, 0
			je	NoCrou
			mov	eax, str_croutons
			call	print_nl
			call	print_string
			NoCrou:

			; Tomatoes
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, S_TOMATOES
			cmp	ebx, 0
			je	NoToms
			mov	eax, str_sTomatoes
			call	print_nl
			call	print_string
			NoToms:

			; Mushrooms
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, MUSHROOMS
			cmp	ebx, 0
			je	NoMush
			mov	eax, str_mushrooms
			call	print_nl
			call	print_string
			NoMush:

			; Cottage Cheese
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, COTTAGE_CHEESE
			cmp	ebx, 0
			je	NoCot
			mov	eax, str_cottageCh
			call	print_nl
			call	print_string
			NoCot:

			; Dressing
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, DRESSING
			cmp	ebx, 0
			je	NoDress
			mov	eax, str_dressing
			call	print_nl
			call	print_string
			NoDress:

			; Shredded Cheese
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, S_CHEESE
			cmp	ebx, 0
			je	NoSC
			mov	eax, str_shreddedCh
			call	print_nl
			call	print_string
			NoSC:

			; Print
			call	print_nl
			call	print_nl
			mov	eax, saladArt
			call	print_string
			call	print_nl
			jmp	end
		end_salad:

		cake:
			; Message
			pusha
			push	str_cake
			push	ordered
			call	printf
			add	esp, 8
			popa

			; Chocolate Frosting
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CHOCO_FROSTING
			cmp	ebx, 0
			je	NoChocoF
			mov	eax, str_chocoFro
			call	print_nl
			call	print_string
			NoChocoF:

			; Chocolate Cake
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CHOCO_CAKE
			cmp	ebx, 0
			je	NoChocoC
			mov	eax, str_chocoCake
			call	print_nl
			call	print_string
			NoChocoC:

			; Vanilla Frosting
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, VANILLA_FROSTING
			cmp	ebx, 0
			je	NoVanF
			mov	eax, str_VanillaFro
			call	print_nl
			call	print_string
			NoVanF:

			; Vanilla Cake
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, VANILLA_CAKE
			cmp	ebx, 0
			je	NoVanC
			mov	eax, str_VanillaCake
			call	print_nl
			call	print_string
			NoVanC:

			; Surprise Filling
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, SUPRISE_FILLING
			cmp	ebx, 0
			je	NoSurF
			mov	eax, str_supriseFill
			call	print_nl
			call	print_string
			NoSurF:

			; Candy Corn
			mov	ebx, DWORD [arr + ecx * 4]	
			and	ebx, CANDY_CORN
			cmp	ebx, 0
			je	NoCanC
			mov	eax, str_candyCorn
			call	print_nl
			call	print_string
			NoCanC:

			; Print
			call	print_nl
			call	print_nl
			mov	eax, cakeArt
			call	print_string
			call	print_nl
			jmp	end
		end_cake:

	end:

	inc	ecx
	cmp	ecx, edx
	jl	top_loop

	; End message
	call	print_nl
	mov	eax, endmsg
	call	print_string
	call	print_nl
	; *********** CODE ENDS HERE ***********
	mov	eax, 0
	mov	esp, ebp
	pop	ebp
	ret
