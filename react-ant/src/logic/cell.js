class Cell {
  constructor() {
    this.activated = false;
    this.occupied = false;
    this.color = false;
  }

  toggle() {
    this.color = !this.color;
  }

  occupy() {
    this.occupied = !this.occupied;
  }

  activate() {
    this.activated = true;
  }

  colour() {
    return this.color;
  }
}

export default Cell;
