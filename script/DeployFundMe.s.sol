//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        //Before startBroadcast -> Not a "real" transaction
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        //After startBroadcast -> Real transaction!
        vm.startBroadcast();
        //Mock contract
        FundMe fundMe = new FundMe(ethUsdPriceFeed);

        //this line is deleted
        // new FundMe();
        vm.stopBroadcast();
        return fundMe;
    }
}
