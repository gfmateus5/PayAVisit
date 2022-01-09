pragma solidity ^0.5.16 ;

contract PayAVisit {
    // amount returned to user
    int balanceAmount;

    constructor() public {
        balanceAmount = 20;
    }

    // read operation
    function getBalanceAmount() public view returns (int) {
        return balanceAmount;
    }

    // write operation
    function addDepositAmount(int amount) public {
        balanceAmount += amount;
    }

    // write operation
    function payAmount(int amount) public {
        balanceAmount -= amount;
    }
}