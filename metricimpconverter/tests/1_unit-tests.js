const mocha = require('mocha');
const describe = mocha.describe;
const it = mocha.it;
const assert = require('chai').assert;
const ConvertHandler = require('../controllers/convertHandler.js');

describe('Unit Tests', function() {
  it('Whole number input', (done) => {
    const input = '32L';
    const result = ConvertHandler(input);
    assert.equal(result.initNum, 32);
    assert.equal(result.initUnit, 'l');
    done();
  });

  it('Decimal Input', (done) => {
    const input = '3.2L';
    const result = ConvertHandler(input);
    assert.equal(result.initNum, 3.2);
    assert.equal(result.initUnit, 'l');
    done();
  });

  it('Fractional Input', (done) => {
    const input = '1/2L';
    const result = ConvertHandler(input);
    assert.equal(result.initNum, 0.5);
    assert.equal(result.initUnit, 'l');
    done();
  });

  it('Fractional Input w/ Decimal', (done) => {
    const input = '1.5/2L';
    const result = ConvertHandler(input);
    assert.equal(result.initNum, 0.75);
    assert.equal(result.initUnit, 'l');
    done();
  });

  it('Invalid Input (double fraction)', (done) => {
    const input = '1/2/3L';
    const result = ConvertHandler(input);
    assert.equal(result, 'invalid number');
    done();
  });

  it('should correctly default to a numerical input of 1 when no numerical input is provided', (done) => {
    const input = 'L';
    const result = ConvertHandler(input);
    assert.equal(result.initNum, 1);
    done();
  });

  it('Valid Unit Input', (done) => {
    const input = '1L';
    const result = ConvertHandler(input);
    assert.equal(result.initUnit, 'l');
    done();
  });

  it('Invalid Unit Input', (done) => {
    const input = '1LX';
    const result = ConvertHandler(input);
    assert.equal(result, 'invalid unit');
    done();
  });

  it('No Unit Input', (done) => {
    const input = '1';
    const result = ConvertHandler(input);
    assert.equal(result, 'invalid unit');
    done();
  });

  it('should correctly return the spelled-out string unit for each valid input unit.', (done) => {
    const input = '1L';
    const result = ConvertHandler(input);
    assert.equal(result.returnUnit, 'gal');
    done();
  });

  it('should correctly convert gal to L', (done) => {
    const input = '1gal';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 3.78541);
    done();
  });

  it('should correctly convert L to gal', (done) => {
    const input = '1L';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 0.26417);
    done();
  });

  it('should correctly convert mi to km', (done) => {
    const input = '1mi';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 1.60934);
    done();
  });

  it('should correctly convert km to mi', (done) => {
    const input = '1km';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 0.62137);
    done();
  });

  it('should correctly convert lbs to kg', (done) => {
    const input = '1lbs';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 0.45359);
    done();
  });

  it('should correctly convert kg to lbs', (done) => {
    const input = '1kg';
    const result = ConvertHandler(input);
    assert.equal(result.returnNum, 2.20462);
    done();
  });
});