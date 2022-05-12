pragma solidity >=0.4.22 <0.9.0;

import "./TweetherToken.sol";

contract TweetherICO {
    TweetherToken token;

    uint256 public RATE = 1000; // 1 ETH = 1000 TWE

    constructor(address _tokenAddr) {
        token = TweetherToken(_tokenAddr);
    }

    receive() external payable {
        uint256 _amount = _getTokenAmount(msg.value);

        token.transfer(msg.sender, _amount);
    }

    function _getTokenAmount(uint256 _weiAmount)
        internal
        view
        returns (uint256)
    {
        return (_weiAmount / 10**18) * RATE;
    }
}
