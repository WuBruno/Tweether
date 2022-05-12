// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "truffle/Assert.sol";
import "../../contracts/users/UserStorage.sol";

contract TestUserStorage {
    UserStorage userStorage;

    constructor() {
        userStorage = new UserStorage();
        userStorage.setControllerAddr(address(this));
    }

    function testCreateFirstUser() public {
        uint256 _expectedId = 1;

        Assert.equal(
            userStorage.createUser(
                address(0),
                "tristan",
                "Tristan",
                "Edwards",
                "I like building stuff",
                "example@example.com"
            ),
            _expectedId,
            "Should create user with ID 1"
        );
    }
}
