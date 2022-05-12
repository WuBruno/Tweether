// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../helpers/Owned.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TweetherToken is ERC20, Owned {
    uint256 public FOR_ICO = 750000;
    uint256 public FOR_FOUNDER = 250000;

    constructor() ERC20("TweetherToken", "TWE") {
        _mint(msg.sender, FOR_ICO + FOR_FOUNDER);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }

    function fundICO(address _icoAddr) public onlyOwner {
        transfer(_icoAddr, FOR_ICO);
    }
}
