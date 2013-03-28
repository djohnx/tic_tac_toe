tic_tac_toe
===========

Tic Tac Toe


Update minimax algorithm 

If board is empty, and CPU is first to act, then random first square is selected
This significantly speeds up game and doesn't effect result as there is no
losing first move. (All level 1 nodes have score value of 0)


CPU player must always be index value of 1 (2nd value) when passing moves to minimax algorithm