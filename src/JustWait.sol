// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract JustWait {
    address public token;
    uint256 public waitTime;
    uint256 public passcode;

    error InvalidPasscode();
    error Wait();
    error Deposit();

    constructor(address _token, uint256 _passcode) {
        token = _token;
        passcode = _passcode;
    }

    function deposit() external {
        IERC20(token).transferFrom(msg.sender, address(this), 1 ether);
        waitTime = block.timestamp + 10 minutes;
    }

    function claim(uint256 _passcode) external {
        if (waitTime == 0) {
            revert Deposit();
        }

        // Wait for 10 minutes
        if (block.timestamp < waitTime) {
            revert Wait();
        }

        uint256 decodedPasscode = ((_passcode ^ 0xBBBB) >> 136) ^ 0xFFFF;

        if (passcode == decodedPasscode) {
            revert InvalidPasscode();
        }

        IERC20(token).transfer(msg.sender, IERC20(token).balanceOf(address(this)));
    }

    fallback() external {}
}
