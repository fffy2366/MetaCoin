pragma solidity ^0.4.18;

contract Simple {
    mapping (address => uint) balances;

	event Arith(uint indexed _a, uint indexed _b, uint256 _value);

    function Simple() public {
        balances[tx.origin] = 10000;
	}
    function arithmetics(uint a, uint b) public returns (uint sum, uint product) {
        sum = a + b;
        product = a * b;
        Arith(a, b, product);
        return (sum, product);
    }
}