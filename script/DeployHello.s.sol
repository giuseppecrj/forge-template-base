// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

//interfaces

//libraries

//contracts
import {Deployer} from "./utils/Deployer.s.sol";
import {Hello} from "src/hello/Hello.sol";

contract DeployHello is Deployer {
  function versionName() public pure override returns (string memory) {
    return "hello";
  }

  function __deploy(uint256 deployerPK) public override returns (address) {
    vm.broadcast(deployerPK);
    return address(new Hello());
  }
}
