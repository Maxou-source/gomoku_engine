#include "Tile.hpp"

Tile::Tile() {

}

PlayerColor Tile::getColor() {
	return clr;
}

void Tile::setColor(PlayerColor pl) {
	clr = pl;
}