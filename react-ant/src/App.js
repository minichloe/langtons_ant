import React, { Component } from 'react';
import AntGrid from './logic';
import Board from './components/Board';

class App extends Component {
  constructor() {
    super();
    this.speed = 50;
    this.state = {
      gridSize: 25,
      antGrid: null,
      play: false,
    };
  }

  componentDidMount() {
    const grid = this.createGrid();
    this.setState({ ...this.state, antGrid: grid });
  }

  componentDidUpdate(prevProps, prevState) {
    if (prevState.gridSize !== this.state.gridSize) {
      this.reset();
    }
  }

  updateGridSize = (e) => {
    const value = Number(e.target.value)
    if (value < 10 || value > 80) return;

    this.setState({ gridSize: value } )
  }

  createGrid() {
    return new AntGrid(this.state.gridSize, this.state.gridSize);
  }

  play = () => {
    if (this.state.play) {
      clearInterval(this.interval);
      this.setState({ ...this.state, play: false });
    } else {
      this.interval = setInterval(() => this.step(), this.speed);
      this.setState({ ...this.state, play: true });
    }
  };

  step = () => {
    const { antGrid } = this.state;
    antGrid.play();
    this.setState({ ...this.state, antGrid });
  };

  reset = () => {
    clearInterval(this.interval);
    this.setState({ play: false, antGrid: this.createGrid() });
  };

  render() {
    return (
      <>
        {this.state.antGrid && (
          <>
            <h2>Hello Ant World!</h2>
            <Board grid={this.state.antGrid.world} />
            <div className="grid">
              Grid Size: <input type='number' name='gridSize' value={this.state.gridSize} onChange={this.updateGridSize} />
            </div>
            <div>
              <button onClick={this.step}>Step</button>
              <button onClick={this.play}>{this.state.play ? 'Pause' : 'Play'}</button>
              <button onClick={this.reset}>Reset</button>
            </div>
          </>
        )}
      </>
    );
  }
}

export default App;
