var Web3=require('web3');
var web3;
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
} else {
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8305"));
}
var _abiArray=[{"constant":true,"inputs":[],"name":"queryBalance","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"withdraw","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"deposit","outputs":[],"payable":true,"stateMutability":"payable","type":"function"}];
var _bin="608060405234801561001057600080fd5b50610188806100206000396000f3fe608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806336f40c611461005c5780633ccfd60b14610087578063b6b55f251461009e575b600080fd5b34801561006857600080fd5b506100716100cc565b6040518082815260200191505060405180910390f35b34801561009357600080fd5b5061009c6100eb565b005b6100ca600480360360208110156100b457600080fd5b810190808035906020019092919050505061014b565b005b60003073ffffffffffffffffffffffffffffffffffffffff1631905090565b3373ffffffffffffffffffffffffffffffffffffffff166108fc3073ffffffffffffffffffffffffffffffffffffffff16319081150290604051600060405180830381858888f19350505050158015610148573d6000803e3d6000fd5b50565b803414151561015957600080fd5b5056fea165627a7a7230582069910493f7da1c83c392f8249f394c38f36db7d3a8b049c503c5dcf4a887ee820029";
var _contract = web3.eth.contract(_abiArray);
//unlock the account with a password provided
//web3.personal.unlockAccount(web3.eth.accounts[0],'password');
var _instance=_contract.new({data:"0x"+_bin,from:web3.eth.accounts[0],gas:1000000}, function(err, contract) {
    if (!err) {
        console.log("contractAddress: ", contract.address);
        console.log("transactionHash: ", contract.transactionHash);
    }
});
