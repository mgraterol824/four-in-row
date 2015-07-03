#juego 4 en linea
require "colorize"


def start_game()
	board=[]
	row=[]
	for i in 0..5
		row=[]
		for j in 0..5
			row[j]="[ ]"
		end
	board[i]=row
	end
	return board
end

def paint_board(board)
	for i in 0..board.length-1
		print "                        "
		for j in 0..board.length-1

			board[i][j]="[".cyan + " ".yellow + "]".cyan
			print board[i][j]
		end
		puts " "
	end
	puts "                         1  2  3  4  5  6"
end

def turn(player)


	player=player%2+1
	return player
end
def play(board, player)
	nothing="[".cyan + " ".yellow + "]".cyan
	allowed=false
	while !allowed
	puts "       Jugador #{player}".cyan
	puts "       Ingrese la columna  en la cual quiere lanzar la ficha".green
	column=gets.chomp.to_i
		if board[0][column-1]==nothing && column!=0
			puts "jugada valida"
			if player==1
			token="[".cyan + "#{player}".yellow + "]".cyan	
			end			
			if player==2
			token="[".cyan + "#{player}".red + "]".cyan	
			end
			#aqui se ubica la ficha			
			i=0	
			empty=false
			while empty==false
				if board[board.length-i-1][column-1]==nothing
					board[board.length-i-1][column-1]=token
					empty=true
				else
					i=i+1
				end
			end

			allowed=true
		
		elsif board[0][column-1]!=nothing && column<=6 && column!=0
				puts "       Esta columna está llena, seleccione otra".magenta
				puts " "
		else
			allowed=false
				puts "       Asegurese de indicar la columna y que esté del 1 al 6".yellow
		end
	end
	return board
end

def update_board(board)
	for i in 0..board.length-1
		print "                        "
		for j in 0..board.length-1			
			print board[i][j]
		end
		puts " "
	end
	puts "                         1  2  3  4  5  6"
end

def verify_win_h(board)

	counter1=0
	counter2=0
	nothing="[".cyan + " ".yellow + "]".cyan
	player=0
	win=false
	for i in 0..board.length-1
		counter1=0
		counter2=0
		for j in 0..board.length-1
			if board[i][j]=="[".cyan + "1".yellow + "]".cyan
				counter1=counter1+1
				counter2=0
				player=1
			end
			if board[i][j]=="[".cyan + "2".red + "]".cyan
				counter2=counter2+1
				counter1=0
				player=2
			end
			if board[i][j]==nothing
			counter1=0
			counter2=0
			end
			if counter1==4 || counter2==4
				puts "Hay 4 fichas ubicadas horizontalmente, ganó el jugador #{player}"
				win=true
			end
		end
	end
	return win
end

def verify_win_v(board)

	counter1=0
	counter2=0
	nothing="[".cyan + " ".yellow + "]".cyan
	player=0
	win=false
	for j in 0..board.length-1
		counter1=0
		counter2=0
		for i in 0..board.length-1
			if board[i][j]=="[".cyan + "1".yellow + "]".cyan
				counter1=counter1+1
				counter2=0
				player=1
			end
			if board[i][j]=="[".cyan + "2".red + "]".cyan
				counter2=counter2+1
				counter1=0
				player=2
			end
			if board[i][j]==nothing
			counter1=0
			counter2=0
			end
			if counter1==4 || counter2==4
				puts "Hay 4 fichas ubicadas verticalmente, ganó el jugador #{player}"
				win=true
			end
		end
	end
	return win
end

def verify_win_d(board)

nothing="[".cyan + " ".yellow + "]".cyan
counter1=0
counter2=0
player=0

	counter1=0
	counter2=0
	j=0
	stay=0
while stay<5

		if stay==3
		j=0		
		end
	for i in 0..board.length-3+j
		if j<3 && stay<3

			indexi=i+2-j
			indexj=i 
		end	



		if j<3 && stay>=3

			indexj=i+2-j
			indexi=i
		end 

		if board[indexi][indexj]=="[".cyan + "1".yellow + "]".cyan
			counter1=counter1+1
			counter2=0

			player=1
		end
		if board[indexi][indexj]=="[".cyan + "2".red + "]".cyan
			counter2=counter2+1
			counter1=0
			player=2
		end
		if board[indexi][indexj]==nothing
		counter1=0
		counter2=0
		end
		if counter1==4 || counter2==4
			puts "Hay 4 fichas ubicadas diagonalmente, ganó el jugador #{player}"
			win=true
		end
	end
	j=j+1



	stay=stay+1

	counter1=0
	counter2=0

end	

	return win
end

def verify_win_d_i(board)
nothing="[".cyan + " ".yellow + "]".cyan
counter1=0
counter2=0
player=0

		counter1=0
		counter2=0
	j=0
	stay=0
	while stay<5
		if stay==3
			j=1
		end

		for i in 0..board.length-1-j
		if stay<3	
		
			indexi=board.length-1-i
			indexj=i+j
		end
		if stay>=3	
	
			indexi=board.length-j-1-i
			indexj=i
	end



			if board[indexi][indexj]=="[".cyan + "1".yellow + "]".cyan
				counter1=counter1+1
				counter2=0
				
				player=1
			end
			if board[indexi][indexj]=="[".cyan + "2".red + "]".cyan
				counter2=counter2+1
				counter1=0
				
				player=2
			end
			if board[indexi][indexj]==nothing
			counter1=0
			counter2=0
			end
			if counter1==4 || counter2==4


				puts "Hay 4 fichas icadas diagonalmente, ganó el jugador #{player}"
				win=true
			end
		end

	j=j+1
	stay=stay+1
	counter2=0
	counter1=0
	
	end

	return win
end
def verify_full(board)
		counter=0
		full=false
		nothing="[".cyan + " ".yellow + "]".cyan
	for i in 0..board.length-1
		if board[0][i]!=nothing
			counter=counter+1
		end
	end
	if counter==6
		full=true
		puts "No hay más posiciones libres, es un empate"
	end	
	
	return full
end

def main
	board=start_game()
	paint_board(board)
	winner=false
	full=false
	player=0
	
	while winner==false	&& full==false	
	player=turn(player)
	play(board,player)
	update_board(board)

	win=verify_win_v(board)

		if win==true
			puts "Felicitaciones jugados #{player} Ganaste!!".magenta
			winner=true
		end
		
	win=verify_win_h(board)
		if win==true
			puts "Felicitaciones jugador #{player} Ganaste!!".magenta
			winner=true
		end		
	win=verify_win_d(board)
		if win==true
			puts "Felicitaciones jugados #{player} Ganaste!!".magenta
			winner=true
		end

	win=verify_win_d_i(board)
		if win==true
			puts "Felicitaciones jugados #{player} Ganaste!!".magenta
			winner=true
		end

	full=verify_full(board)
	end
end


main()