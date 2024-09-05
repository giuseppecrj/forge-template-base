// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.25;

// interfaces

// libraries

// contracts

interface IHello {
    function sayHello() external view returns (string memory);

    function setGreeting(string memory newGreeting) external;
}
