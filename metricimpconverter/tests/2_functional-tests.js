const chaiHttp = require('chai-http');
const chai = require('chai');
const mocha = require('mocha');
const describe = mocha.describe;
const it = mocha.it;
const assert = chai.assert;
const server = require('../server');

chai.use(chaiHttp);

describe('Functional Tests', function() {
  it('Convert a valid input such as 10L: GET request to /api/convert', (done) => {
    chai.request(server)
      .get('/api/convert?input=10L')
      .end((err, res) => {
        assert.equal(res.status, 200);
        assert.equal(res.body.initNum, 10);
        assert.equal(res.body.initUnit, 'L');
        assert.equal(res.body.returnNum, 2.64172);
        assert.equal(res.body.returnUnit, 'gal');
        assert.equal(res.body.string, '10 liters converts to 2.64172 gallons');
        done();
      });
  });

  it('Convert an invalid input such as 32g: GET request to /api/convert', (done) => {
    chai.request(server)
      .get('/api/convert?input=32g')
      .end((err, res) => {
        assert.equal(res.status, 200);
        assert.equal(res.body, 'invalid unit');
        done();
      });
  });

  it('Convert an invalid number such as 3/7.2/4kg: GET request to /api/convert', (done) => {
    chai.request(server)
      .get('/api/convert?input=3/7.2/4kg')
      .end((err, res) => {
        assert.equal(res.status, 200);
        assert.equal(res.body, 'invalid number');
        done();
      });
  });

  it('Convert an invalid number AND unit such as 3/7.2/4kilomegagram: GET request to /api/convert', (done) => {
    chai.request(server)
      .get('/api/convert?input=3/7.2/4kilomegagram')
      .end((err, res) => {
        assert.equal(res.status, 200);
        assert.equal(res.body, 'invalid number and unit');
        done();
      });
  });

  it('Convert with no number such as kg: GET request to /api/convert', (done) => {
    chai.request(server)
      .get('/api/convert?input=kg')
      .end((err, res) => {
        assert.equal(res.status, 200);
        assert.equal(res.body.initNum, 1);
        assert.equal(res.body.initUnit, 'kg');
        assert.equal(res.body.returnNum, 2.20462);
        assert.equal(res.body.returnUnit, 'lbs');
        assert.equal(res.body.string, '1 kilograms converts to 2.20462 pounds');
        done();
      });
  });
});
