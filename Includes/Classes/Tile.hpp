#pragma once
#include "gomoku.hpp"

class Tile {
	private:
		PlayerColor clr = EMPTY;
	public:
		Tile();
		PlayerColor getColor();
		void setColor(PlayerColor);
};