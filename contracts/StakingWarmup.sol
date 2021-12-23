// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "./interfaces/IERC20.sol";

contract StakingWarmup {

    address public immutable staking;
    address public immutable sETN;

    constructor ( address _staking, address _sETN ) {
        require( _staking != address(0) );
        staking = _staking;
        require( _sETN != address(0) );
        sETN = _sETN;
    }

    function retrieve( address _staker, uint _amount ) external {
        require( msg.sender == staking );
        IERC20( sETN ).transfer( _staker, _amount );
    }
}