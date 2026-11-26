#pragma once

#include "Tile.hpp"

class Board {
	private:
		std::array<Tile, BOARD_SIZE * BOARD_SIZE> tiles;
	public:
		Board();
		PlayerColor at(int x, int y);
		void display();
		void place(int x, int y, PlayerColor pl);
};

