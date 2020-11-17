import React from 'react';
import Cell from './Cell';

const Board = ({ grid }) => {
  return (
    <table>
      <tbody>
        {grid.data.map((row, idx) => (
          <tr key={idx}>
            {
              <>
                {row.map((cell, idx) => (
                  <Cell key={idx} cell={cell} />
                ))}
              </>
            }
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default Board;
