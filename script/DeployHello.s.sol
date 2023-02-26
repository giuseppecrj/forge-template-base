// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ScriptUtils} from "./utils/ScriptUtils.sol";
import {Hello} from "src/Hello.sol";
import {console} from "forge-std/console.sol";

contract DeployHello is ScriptUtils {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    Hello hello = new Hello();
    vm.stopBroadcast();

    console.log("Hello deployed at: ", address(hello));
  }
}
