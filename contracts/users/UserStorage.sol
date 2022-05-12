// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../helpers/BaseStorage.sol";

contract UserStorage is BaseStorage {
    struct Profile {
        uint256 id;
        bytes32 username;
        bytes32 firstName;
        bytes32 lastName;
        string bio;
        string gravatarEmail;
    }

    mapping(uint256 => Profile) public profiles;
    mapping(address => uint256) public addresses;
    mapping(bytes32 => uint256) public usernames;

    uint256 latestUserId = 0;

    function createUser(
        address _address,
        bytes32 _username,
        bytes32 _firstName,
        bytes32 _lastName,
        string memory _bio,
        string memory _gravatarEmail
    ) public onlyController returns (uint256) {
        latestUserId++;

        profiles[latestUserId] = Profile(
            latestUserId,
            _username,
            _firstName,
            _lastName,
            _bio,
            _gravatarEmail
        );

        addresses[_address] = latestUserId;
        usernames[_username] = latestUserId;

        return latestUserId;
    }
}
