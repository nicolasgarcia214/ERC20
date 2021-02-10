pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Vype is ERC20{
    address public owner;
    event TokensMinted(address, uint);

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not the owner");
        _;
    }
    
    constructor() ERC20("Vype Stablecoin", "VYPE"){
        owner = msg.sender;
    }

    function mint(address _to, uint _amount) external onlyOwner{
        _mint(_to, _amount);
        emit TokensMinted(_to, _amount);
    }
}

contract Tvype is ERC20{
    event TokensMinted(address, uint);

    constructor() ERC20("Vype Test", "TVYPE"){}

    function faucet(address _to, uint _amount) external {
        _mint(_to, _amount);
        emit TokensMinted(_to, _amount);
    }
}