// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract ErrorHandler {

    uint256 public num;
    event show_num_value(uint256 indexed current_value, string err_mes);

    function test_error (uint256 _input_number, uint256 _error_code) public {
        
        if(_error_code == 1) {

            require(_input_number > 10, "Please enter a number which is Greater than 10");
            num = _input_number;
            emit show_num_value(num, "No error.");

        }else if(_error_code == 2) {

            assert(_input_number >= 1);
            num = _input_number;
            emit show_num_value(num, "No error.");

        }else{

            do {
                console.log(_input_number, " IS GOOD");
                _input_number--;
            } while( _input_number >= 1);                    

            if(_input_number < 1) {
                revert("THE VALUE OF a IS NOW ZERO (0). TRANSACTION REVERTED.");
            }

        }
    }
}
