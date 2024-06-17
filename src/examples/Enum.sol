// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancle() public {
        status = Status.Canceled;
    }

    function remove() public {
        delete status;
    }
}