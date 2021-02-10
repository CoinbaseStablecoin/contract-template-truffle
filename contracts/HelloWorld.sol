// SPDX-License-Identifier: MIT

pragma solidity 0.7.6;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract HelloWorld is Ownable {
    string private _message = "Hello, world!";

    event MessageChanged(address indexed setter);

    constructor() Ownable() {}

    /**
     * @notice Get the message
     * @return Message
     */
    function getMessage() external view returns (string memory) {
        return _message;
    }

    /**
     * @notice Set the message
     * @param message   Message
     */
    function setMessage(string calldata message) external onlyOwner {
        _message = message;
        emit MessageChanged(msg.sender);
    }
}
