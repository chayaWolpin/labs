// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Array {
    uint256[] arr;
    uint256[] arr2 = [1, 2, 3];
    uint256[10] fixedSizeArray;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    function getArr() public view returns (uint256[] memory) {
        return arr2;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function popFromArr() public view {
        arr2.pop;
    }

    function remove(uint256 i) public {
        delete arr2[i];
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function examples() public pure {
        uint256[] memory exampleArr = new uint256[](5);
    }
}

contract arrayRemoveByShifting {
    uint256[] arr;

    function remove(uint256 _i) public {
        require(_i <= arr.length, "not valid index");
        for (uint256 i = _i - 1; i < arr.length; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function testRemove() public {
        arr = [1, 2, 3, 4, 5];
        remove(3);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }
}

contract ArrayReplaceFromEnd {
    uint256[] arr;

    function remove(uint256 index) public {
        require(index < arr.length - 1, "index out of bound");
        arr[index - 1] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4, 5];
        remove(3);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }
}
