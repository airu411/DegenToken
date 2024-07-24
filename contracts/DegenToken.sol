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
    mapping(string => uint256) redeemableItems;

    struct RedeemableItem {
      string itemName;
      uint256 itemCost;
    }

    string[] private itemNames;

    event ItemRedeemed(address indexed to, string itemName);

    constructor() ERC20("Degen", "DGN") Ownable() {
        addRedeemableItem("Degen Item1", 1);
        addRedeemableItem("Degen Item2", 2);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transfer(address _to, uint256 _amount) public override returns (bool) {
        require(balanceOf(msg.sender) >= _amount, "You don't have enough DGN tokens to transfer.");
        return super.transfer(_to, _amount);
    }

    function addRedeemableItem(string memory _itemName, uint256 _itemCost) public onlyOwner {
        itemNames.push(_itemName);
        redeemableItems[_itemName] = _itemCost;
    }

    function checkRedeemableItems() public view returns (RedeemableItem[] memory) {
        RedeemableItem[] memory items = new RedeemableItem[](itemNames.length);
        for (uint256 i = 0; i < itemNames.length; i++) {
            items[i] = RedeemableItem({
                itemName: itemNames[i],
                itemCost: redeemableItems[itemNames[i]]
            });
        }
        return items;
    }

    function redeemItem(string memory _itemName) public {
        require(balanceOf(msg.sender) >= redeemableItems[_itemName], "You don't have enough DGN tokens for this item.");
        transfer(owner(), redeemableItems[_itemName]);
        emit ItemRedeemed(msg.sender, _itemName);
    }

    function checkBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burn(uint256 _amount) public override {
        require(balanceOf(msg.sender) >= _amount, "You don't have enough DGN tokens to burn.");
        _burn(msg.sender, _amount);
    }
}
