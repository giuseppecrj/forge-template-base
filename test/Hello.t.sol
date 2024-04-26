// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

//interfaces
import {Hello} from "src/hello/Hello.sol";

//libraries

//contracts
import "./utils/TestUtils.sol";
import {DeployHello} from "scripts/DeployHello.s.sol";

contract HelloTest is TestUtils {
  Hello hello;

  function setUp() external {
    DeployHello helloHelper = new DeployHello();
    hello = Hello(helloHelper.deploy());
  }

  function test_sayHello() external view {
    assertEq(hello.sayHello(), "Hello, Forge!");
  }
}
