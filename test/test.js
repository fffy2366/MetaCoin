const debug = require("debug")("ck");
const BigNumber = require("bignumber.js");

const ETH_STRING = web3.toWei(1, "ether");
const FINNEY_STRING = web3.toWei(1, "finney");
const ETH_BN = new BigNumber(ETH_STRING);
const FINNEY_BN = new BigNumber(FINNEY_STRING);
const NULL_ADDRESS = "0x0000000000000000000000000000000000000000";

const util = require("./util.js");
util.getBalance('0x627306090abaB3A6e1400e9345bC60c78a8BEf57')
.then(balance => {
    console.log('balance is %s', balance / ETH_STRING);
});
