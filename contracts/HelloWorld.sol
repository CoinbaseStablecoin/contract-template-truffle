/**
 * SPDX-License-Identifier: MIT
 *
 * Copyright (c) 2020 Coinbase, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

pragma solidity 0.6.11;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract HelloWorld is Ownable {
    string private _message = "Hello, world!";

    event MessageChanged(address indexed setter);

    constructor() public Ownable() {}

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
