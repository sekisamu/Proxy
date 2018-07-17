pragma solidity ^0.4.23;

import "./ILogicContract.sol";
import "../Initializable.sol";


contract LogicContract is ILogicContract,Initializable {
    /*
     * @dev the previous implementation of logic contract
     * this MUST be declared!
     */
    LogicContract public preImpl;

    mapping(uint => uint) internal uint2uint;

    function getUint2uint(uint _first) public view returns (uint) {
        return uint2uint[_first];
    }

    /*
    * @dev instantiate the previous logic contract, for initial version, it is itself
    * this function MUST be declared!
    */
    function initialize(address _preimpl) public payable isInitialized{
        preImpl = LogicContract(_preimpl);
    }

    function addRecord(uint _first, uint _second) public {
        require(uint2uint[_first] == 0);
        uint2uint[_first] = _second;
    }

}


contract LogicContractV2 is ILogicContract,Initializable {

    LogicContract public preImpl;

    mapping (uint => mapping (uint => bool)) internal extendmapping;

    function initialize(address _preimpl) public payable isInitialized{
        preImpl = LogicContract(_preimpl);
    }
    /*
    * @dev if this function modified from the previous one, r
    * ecommand pointing to the function in previous contract in the first line
    *
    */
    function addRecord(uint _first, uint _second, bool _b) public {
        preImpl.addRecord(_first, _second);
        extendmapping[_first][_second] = _b;
    }

    function getUint2uint(uint _first) public view returns (uint) {
        return preImpl.getUint2uint(_first);
    }

}
