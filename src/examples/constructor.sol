// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract B is X("Input to x"), Y("Input to y") {}

contract C is X, Y {
    constructor(string memory name, string memory text) X(name) Y(text) {}
}

contract D is X, Y {
    constructor() X("x was called") Y("y was called") {}
}
contract E is X, Y{
    constructor()Y("y was called") X("x was called"){}
}
