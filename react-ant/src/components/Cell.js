import React from 'react';
import Ant from './Ant';

const Cell = ({ cell }) => {
  const classes = cell.activated ? (cell.color ? 'red' : 'blue') : '';
  return <td className={classes}>{cell.occupied && <Ant />}</td>;
};

export default Cell;
