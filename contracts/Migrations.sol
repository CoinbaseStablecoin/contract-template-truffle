// SPDX-License-Identifier: MIT

pragma solidity 0.7.6;

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setCompleted(uint256 completed) external restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) external restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
