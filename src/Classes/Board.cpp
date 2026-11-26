#include "Board.hpp"

Board::Board() {

}

PlayerColor Board::at(int x, int y) {
	return tiles[x + BOARD_SIZE * y].getColor();
}

void Board::display() {
	for (int i = 0; i < 19; i++)
	{
		for (int j = 0; j < 19; j++)
		{
			PlayerColor clr = at(i, j);
			if (clr == EMPTY) std::cout << "-";
			else if (clr == WHITE) std::cout << "O";
			else if (clr == BLACK) std::cout << "B";
		}
		std::cout << "\n";
	}
	std::cout << std::flush;
}

void Board::place(int x, int y, PlayerColor pl) {
	tiles[x + BOARD_SIZE * y].setColor(pl);
}