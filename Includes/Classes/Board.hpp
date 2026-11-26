#pragma once

#include "Tile.hpp"

class Board {
	private:
		std::vector<std::unique_ptr<Tile>>	tiles;
	public:
		Board();
};