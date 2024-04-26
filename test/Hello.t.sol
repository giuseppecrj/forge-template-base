// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

//interfaces
import {IHello} from "src/hello/IHello.sol";

//libraries

//contracts
import "./utils/TestUtils.sol";
import {DeployHello} from "scripts/DeployHello.s.sol";

contract HelloTest is TestUtils {
  IHello hello;

  function setUp() external {
    DeployHello helloHelper = new DeployHello();
    hello = IHello(helloHelper.deploy());
  }

  function test_sayHello() external view {
    assertEq(hello.sayHello(), "Hello, Forge!");
  }
}
