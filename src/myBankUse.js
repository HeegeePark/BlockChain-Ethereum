var Web3=require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8305"));
var _abiArray=[{"constant":true,"inputs":[],"name":"queryBalance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"withdraw","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"deposit","outputs":[],"payable":true,"stateMutability":"payable","type":"function"}];
var _contract = web3.eth.contract(_abiArray);
var myBank = _contract.at("0xebd211f2eb2ee0931258fe3e80ac04677ec5201c");
console.log(web3.eth.getBalance(web3.eth.accounts[0]).toNumber());
console.log(myBank.deposit(1111,{from:web3.eth.accounts[0],gas:80000,value:1111}));
var bal=myBank.queryBalance.call();
console.log(bal.toString());
console.log(web3.eth.getBalance(web3.eth.accounts[0]).toNumber());
myBank.withdraw.sendTransaction({from:web3.eth.accounts[0]});
