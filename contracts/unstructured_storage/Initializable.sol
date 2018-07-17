pragma solidity ^0.4.23;

contract Initializable {
    bool public initialized = false;

    function initialize(address _preimpl) public payable;

    modifier isInitialized() {
        require(!initialized);
        _;
        initialized = true;
    }
}