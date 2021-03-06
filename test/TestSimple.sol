pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Simple.sol";

contract TestSimple {
  function testArithmetics() public {
    Simple sim = Simple(DeployedAddresses.Simple());

    uint expected = 6;
    var (sum, product) = sim.arithmetics(2, 3);
    Assert.equal(product, expected, "2 * 3 should 6");
  } 

}