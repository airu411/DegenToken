# Project Title

This is a smart contract for DGN tokens.  

## Description

This is in fulfillment of the fourth and last module of the ETH + AVAX Intermediate course in Metacrafters. It uses the provided starter project code from Metacrafters. It imports 3 smart contracts from OpenZeppelin: `ERC20.sol`, `Ownable.sol`, and `ERC20Burnable.sol`. The contract is for creating DGN tokens. It allows the owner to mint DGN tokens, and any user is able to transfer and redeem tokens that they own, redeem items that they can avail, check their balance, and burn tokens.  

## Getting Started

### Setting Up

1. You may start by getting a copy of the repository. You may do so in ways such as cloning, forking, or simply downloading the code.  

2. You may then use a coding editor and environment of your choice; I used Remix.  

3. Put your copy of the repository in your coding environment.  

4. In your Metamask account, go to networks and add a new network:  
  Network name: Fuji (C-Chain)  
  New RPC URL: https://api.avax-test.network/ext/C/rpc  
  Chain ID: 43113  
  Currency Symbol: AVAX  
  Block: https://testnet.snowtrace.io/  
You may change the network name to whatever you want.  

### Executing program

1. If you're using Remix, open the `DegenToken.sol` file under the `contracts` folder.  

2. Under `Solidity compiler`, and click `Compile DegenToken.sol`.  

3. Under `Deploy & Run Transactions`, change your environment to `Injected Provider - Metamask`.  

4. Then, deploy and connect your Metamask account.  

5. When the contract is successfully deployed, the user can do many things, but let's focus on a few that are required for this project: `addRedeemableItem`, `burn`, `mint`, `redeemItem`, `transfer`, `checkBalance`, and `checkRedeemableItems`.  
  5.1. `addRedeemableItem` - This can only be used by the contract owner. The owner has to provide two parameters: `_itemName` and `_itemCost`. Initially, there are two redeemable items when the contract is first deployed: `Degen Item1` and `Degen Item2` with costs of 1 and 2 DGN tokens respectively.  
  5.2. `burn` - This can be used by any user. Using it would reduce the amount of DGN tokens that they own by the amount that they specified.  
  5.3. `mint` - This can be only be used by the contract owner. The owner has to provide two parameters: `_to` and `_amount`. Using mint would increase the amount of DGN tokens that the address in `_to` owns.  
  5.4. `redeemItem` - This can be used by any user. Using it would allow them to redeem any item that they can redeem and also transfer the amount used for redeeming the item to the owner.  
  5.5. `transfer` - This can be used by any user. The user has to provide two parameters: `_to` and `_amount`. Using it would allow them to transfer the amount of DGN tokens they specified, which they own, to any account.  
  5.6. `checkBalance` - This can be used by any user. Using it would allow them to check how much DGN tokens they have.  
  5.7. `checkRedeemableItems` - This can be used by any user. Using it would allow them to check what are the redeemable items that are available and were added by the owner.  

![Figure 1](public\fig1.png)  
![Figure 2](public\fig2.png)  

## Help

You may verify your transactions on the contract deployed on Snowtrace testnet. Mine can be found [here](https://testnet.snowtrace.io/address/0x22D7F78a3f12Ae00564953fCF0C228E76134cAf6). It should look similar to:  

![Figure 3](public\fig3.png)  

If you run into problems, you may look at the following:  

[Solidity Documentation](https://docs.soliditylang.org/en/v0.8.9/)  
[Remix IDE Documentation](https://remix-ide.readthedocs.io/en/latest/)  
[OpenZeppelin Documentation](https://docs.openzeppelin.com/)  
[MetaMask Documentation](https://docs.metamask.io/)  
[Snowtrace Testnet Documentation](https://testnet.snowtrace.io/documentation)  

## Authors

- airu411  
- [Starter Project code](https://github.com/Metacrafters/DegenToken) from [@Metacrafters](https://x.com/metacraftersio)  
