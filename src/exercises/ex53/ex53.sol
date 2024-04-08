forge debug --target-contract Add ./src/add/add.sol \

contract Add {
    constructor() {}

    function addTwo(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }
}
