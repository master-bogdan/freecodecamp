const CONVERT_MAP = {
  gal: {
    convertsTo: 'l',
    spell: 'gallons',
    convert: (num) => num * 3.78541,
  },
  l: {
    convertsTo: 'gal',
    spell: 'liters',
    convert: (num) => num / 3.78541,
  },
  lbs: {
    convertsTo: 'kg',
    spell: 'pounds',
    convert: (num) => num * 0.453592,
  },
  kg: {
    convertsTo: 'lbs',
    spell: 'kilograms',
    convert: (num) => num / 0.453592,
  },
  mi: {
    convertsTo: 'km',
    spell: 'miles',
    convert: (num) => num * 1.60934,
  },
  km: {
    convertsTo: 'mi',
    spell: 'kilometers',
    convert: (num) => num / 1.60934,
  },
}

const ConvertHandler = (input) => {
  let initNum = parseFloat(input) || 1;
  let fractionalArray = input.includes('/') ? input.split('/') : null;

  if (fractionalArray && fractionalArray.length > 2) {
    initNum = null;
  } else if (fractionalArray && fractionalArray.length === 2) {
    const [numerator, denominator] = fractionalArray;
    initNum = parseFloat(numerator) / parseFloat(denominator);
  }

  const initUnit = input.replace(/[0-9./]/g, '').trim();

  if (!initUnit) {
    return 'invalid unit';
  }

  const baseUnit = CONVERT_MAP[initUnit.toLowerCase()];

  if (!baseUnit && !initNum) {
    return 'invalid number and unit';
  }

  if (!initNum) {
    return 'invalid number';
  }
  
  if (!baseUnit) {
    return 'invalid unit';
  }

  const returnUnit = CONVERT_MAP[baseUnit.convertsTo];
  const returnNum = CONVERT_MAP[initUnit.toLowerCase()].convert(initNum).toFixed(5);
  
  const string = `${initNum} ${baseUnit.spell} converts to ${returnNum} ${returnUnit.spell}`;
    
  return {
    initNum,
    initUnit: initUnit.toLowerCase() === 'l' ? 'L' : initUnit.toLowerCase(), // L is a special case
    returnNum,
    returnUnit: baseUnit.convertsTo,
    string
  };
};

module.exports = ConvertHandler;
