'use strict';

const expect = require('chai').expect;
const ConvertHandler = require('../controllers/convertHandler.js');

module.exports = function (app) {

  app.route('/api/convert')
    .get(function (req, res) {
      const input = req.query.input;
      const result = ConvertHandler(input);


      return res.status(200).json(result);
    });
};
