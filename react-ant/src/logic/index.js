import Grid from './grid';

class AntGrid {
  constructor(x, y) {
    this.world = new Grid(x, y);
    this.row = this.world.location[0];
    this.col = this.world.location[1];
    this.direction = 0;
  }

  getLocation() {
    return [this.row, this.col];
  }

  changeDirection() {
    const { row, col, direction } = this;
    if (this.world.data[row][col].colour()) {
      this.direction = (direction + 4 - 1) % 4;
    } else {
      this.direction = (direction + 1) % 4;
    }
  }

  move(direction = this.direction) {
    const rows = this.world.width;
    const cols = this.world.height;
    switch (direction) {
      case 0:
        this.row = (this.row + rows - 1) % rows;
        break;
      case 1:
        this.col = (this.col + 1) % cols;
        break;
      case 2:
        this.row = (this.row + 1) % rows;
        break;
      case 3:
        this.col = (this.col + cols - 1) % cols;
        break;
      default:
        break;
    }
  }

  play(direction) {
    const grid = this.world.data;
    grid[this.row][this.col].occupy();
    this.move(direction);
    this.changeDirection();
    grid[this.row][this.col].activate();
    grid[this.row][this.col].occupy();
    grid[this.row][this.col].toggle();
  }
}

export default AntGrid;
