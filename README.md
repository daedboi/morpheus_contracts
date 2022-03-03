# morpheus_contracts
Solidity contracts for Morpheus Swap

DEX contracts - MorpheusRouter, MorpheusFactory

Farm contracts - MorpheusChef, MasterChefV2

Token contracts - MorpheusToken, PILLS

Peripheral contracts - Zapper, Timelock

**Special contracts**:
ConstantNeo - Continuous revenue share staking pool where users stake PILLS to earn wFTM. Whenever updateRewardPerSec() is called, it will calculate the wFTM per sec to distribute for the next 7 days (with additional padding to avoid errors) based off the amount of wFTM in the contract. If there is no wFTM in the contract, then the rewardPerSec will be set to 0 until the update function is called again.

Matrix - Fee distributer/converter contract. Takes the DEX fees in LP tokens and converts them to wFTM, then automatically distributes per set allocation points to various addresses. When calling the convertMultiple() function, it will trigger this process, as well as calling updateRewardPerSec() in the ConstantNeo contract.

In the above contracts, there is the word "oracle" used, this is not an oracle, but allows for a bot/script to be able to assist with fully automating calling the functions such as convertMultiple().
