var Web3=require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8305"));
var _abiArray=[{"constant":true,"inputs":[],"name":"queryBalance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"withdraw","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"deposit","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"name":"_receiver","type":"address"}],"name":"sendTo","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":false,"stateMutability":"nonpayable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"string"}],"name":"PrintLog","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"to","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"Sent","type":"event"}];
var _contract = web3.eth.contract(_abiArray);
var bank = _contract.at("0xebd211f2eb2ee0931258fe3e80ac04677ec5201c");
//var filter = bank.PrintLog(function (error, result) {
//  if (!error)
//    console.log(result);
//});
//console.log(bank.sendTo(0x778ea91cb0d0879c22ca20c5aea6fbf8cbeed480, 100,{from:web3.eth.accounts[0],gas:100000}));
console.log(bank.queryBalance().toNumber());
console.log(bank.deposit(111, {from:web3.eth.accounts[0], value:111}));
console.log(bank.withdraw({from:web3.eth.accounts[0]}));
console.log(bank.deposit(100, {from:web3.eth.accounts[0], value:100}));
console.log(bank.deposit(100, {from:web3.eth.accounts[0], value:100}));
console.log(bank.queryBalance().toNumber());
