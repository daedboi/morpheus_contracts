# morpheus_contracts
Solidity contracts for Morpheus Swap

DEX contracts - MorpheusRouter, MorpheusFactory

Farm contracts - MorpheusChef, MasterChefV2

Token contracts - MorpheusToken, PILLS

Peripheral contracts - Zapper, Timelock

**Deployed contracts on FTM:**
MCHEF: 0xc7dad2e953Dc7b11474151134737A007049f576E
MCHEFV2: 0x5BDE895A1c7744972A35A006c97E11c6F5421D03
FACTORY: 0x9C454510848906FDDc846607E4baa27Ca999FBB6
ROUTER: 0x8aC868293D97761A1fED6d4A01E9FF17C5594Aa3
SWAPPER: 0x0C35b3B57cDE4a3007398045B274548A6592E9d0
ZAPPER: 0xDD9Ac0d6B5DBD3b009acc36ba40B4db657881e11
MORPH TOKEN: 0x0789fF5bA37f72ABC4D561D00648acaDC897b32d
PILLS TOKEN: 0xB66b5D38E183De42F21e92aBcAF3c712dd5d6286
TIMELOCK: 0x77e4B42c3d788735BC27aD7f494362B07ccd9f04


**Special contracts**:
ConstantNeo - Continuous revenue share staking pool where users stake PILLS to earn wFTM. Whenever updateRewardPerSec() is called, it will calculate the wFTM per sec to distribute for the next 7 days (with additional padding to avoid errors) based off the amount of wFTM in the contract. If there is no wFTM in the contract, then the rewardPerSec will be set to 0 until the update function is called again.

Matrix - Fee distributer/converter contract. Takes the DEX fees in LP tokens and converts them to wFTM, then automatically distributes per set allocation points to various addresses. When calling the convertMultiple() function, it will trigger this process, as well as calling updateRewardPerSec() in the ConstantNeo contract.

In the above contracts, there is the word "oracle" used, this is not an oracle, but allows for a bot/script to be able to assist with fully automating calling the functions such as convertMultiple().
