// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract should have
the following functionality:  
  1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the
  owner can mint tokens.  
  2. Transferring tokens: Players should be able to transfer their tokens to others.  
  3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.  
  4. Checking token balance: Players should be able to check their token balance at any time.  
  5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.  
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    uint256 initSupply = 100 * 10**uint256(decimals());

    constructor() ERC20("Degen", "DGN") Ownable() {
      _mint(msg.sender, initSupply);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }
}
