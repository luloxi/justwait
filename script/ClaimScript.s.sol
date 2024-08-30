// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {JustWait} from "src/JustWait.sol";

contract ClaimScript {
    JustWait justWaitInstance;

    function setUp() public {
        justWaitInstance = JustWait(0x440E21aB40b8A33EC02f3a71C54ccD860A5f5861);
    }

    function run() public {
        justWaitInstance.claim(0x12BAA9000000000000000000000000000000000000000000000000000000BBBB);
    }
}
