const mysql = require('mysql2');

const conf = require('dotenv').config().parsed;

const conn = mysql.createPool({
  host: conf.HOSTNAME,
  user: conf.USERNAME,
  password: conf.PASSWORD,
  database: conf.DATABASE,
  port: conf.HOSTPORT
}).promise();

module.exports = conn;