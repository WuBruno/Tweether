// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Owned {
    address public ownerAddr;

    modifier onlyOwner() {
        require(msg.sender == ownerAddr);
        _;
    }

    constructor() {
        ownerAddr = msg.sender;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        // Address cannot be null
        require(_newOwner != address(0));

        ownerAddr = _newOwner;
    }
}
