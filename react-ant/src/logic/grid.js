import Cell from './cell';

class Grid {
  constructor(width, height) {
    this.width = width;
    this.height = height;
    this.location = [Math.floor(this.width / 2), Math.floor(this.height / 2)];
    this.data = this.generateGrid();
  }

  generateGrid() {
    const grid = [];
    const [x, y] = this.location;
    for (let i = 0; i < this.height; i++) {
      const row = [];
      for (let j = 0; j < this.width; j++) {
        const cell = new Cell();
        if (i === x && j === y) cell.occupy();
        row.push(cell);
      }
      grid.push(row);
    }
    return grid;
  }
}

export default Grid;
