These are contracts for the mLQDR model for Morpheus Swap. Based off of cLQDR from Growth Defi, this instead swaps all xLQDR rewards into wFTM, and allows mLQDR-LQDR LPers to receive their regular xLQDR rewards as well as additional MORPH incentives by using some MasterchefV2 logic.

mLQDR.sol - token contract, where users swap LQDR for mLQDR 1:1
mLQDRExtension.sol - collects xLQDR rewards and distributes to mLQDRBuyback.sol
mLQDRBuyback.sol - swaps all xLQDR rewards for wFTM and sends to constant neo for staking rewards
ConstantNeoLQDR.sol - where users stake mLQDR to receive xLQDR rewards, and mLQDR-LQDR LP to receive xLQDR + MORPH incentives
Oracle.sol - Oracle for buyback contract