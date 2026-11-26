#include "gomoku.hpp"
#include "Tile.hpp"
#include "Board.hpp"

int main() {
	std::cout << "LETS GOOOO" << std::endl;
	Board b;
	b.place(2,1,WHITE);
	b.place(2,2,BLACK);
	b.display();
}