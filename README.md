# agrimarket
decentralised agriculture marketplace

## setting up project
1. Have foundry installed
2. Create project using the command : ```forge init agrimarket```
3. Go to the src folder and create your smart contract
4. Import the required libraries using the import statement
5. To install the required libraries use the command : ``` forge install [github link]```
6. The installed libraries will be there in the lib folder. To correctly import said libraries specify the absolute path of the folder. Works differently based on how you've setup your computer

## deploying your project
1. The project can deployed to a local evm chain using the command : ```forge create --interactive```
2. To setup a local chain run : ```anvil```
3. This will setup a local chain with the chain id; RPC url and bunch of accounts with enough ether to last you a lifetime
4. You can also create a .env file to store these constants so that you don't have to copy paste this everytime you run the command. While doin this ensure that you put the .env in the gitignore file
5. Deploying using this method is a simulation and to actually deploy the contract and get it verified deploy it using scripts

## writing tests
1. tests should be written for each function and other aspects of the contract to ensure the contract is working correctly
2. test are run using : ```forge test```
3. In the tests contract import the standard forge tests : ```import {Test} from "forge-std/Test.sol";```
4. Import our contract also : ```import {agrimarket} from "../src/agrimarket.sol"```
5. To get the visibility of each test run : ```forge test -vv``` or ```forge test -vvv```
6. forge runs tests only on those functions whose name begins with the word 'test'
