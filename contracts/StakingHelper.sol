// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "./interfaces/IStaking.sol";
import "./interfaces/IERC20.sol";

contract StakingHelper {

    address public immutable staking;
    address public immutable ETN;

    constructor ( address _staking, address _ETN ) {
        require( _staking != address(0) );
        staking = _staking;
        require( _ETN != address(0) );
        ETN = _ETN;
    }

    function stake( uint _amount, address recipient ) external {
        IERC20( ETN ).transferFrom( msg.sender, address(this), _amount );
        IERC20( ETN ).approve( staking, _amount );
        IStaking( staking ).stake( _amount, recipient );
        IStaking( staking ).claim( recipient );
    }
}