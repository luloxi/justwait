// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {JustWait} from "src/JustWait.sol";

contract DepositScript {
    JustWait justWaitInstance;
    IERC20 token;

    function setUp() public {
        justWaitInstance = JustWait(0x440E21aB40b8A33EC02f3a71C54ccD860A5f5861);
        token = IERC20(0xF3aF54943d6ef98c2B083FC6e69d36019ee5459D);
    }

    function run() public {
        token.approve(address(justWaitInstance), type(uint256).max);
        justWaitInstance.deposit();
    }
}
