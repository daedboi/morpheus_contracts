// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, 'SafeMath: addition overflow');

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, 'SafeMath: subtraction overflow');
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, 'SafeMath: multiplication overflow');

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, 'SafeMath: division by zero');
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, 'SafeMath: modulo by zero');
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }

    function min(uint256 x, uint256 y) internal pure returns (uint256 z) {
        z = x < y ? x : y;
    }

    // babylonian method (https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method)
    function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}


pragma solidity >=0.4.0;

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the token decimals.
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the token symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the token name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the erc token owner.
     */
    function getOwner() external view returns (address);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address _owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly {
            codehash := extcodehash(account)
        }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, 'Address: insufficient balance');

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{value: amount}('');
        require(success, 'Address: unable to send value, recipient may have reverted');
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, 'Address: low-level call failed');
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, 'Address: low-level call with value failed');
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, 'Address: insufficient balance for call');
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(
        address target,
        bytes memory data,
        uint256 weiValue,
        string memory errorMessage
    ) private returns (bytes memory) {
        require(isContract(target), 'Address: call to non-contract');

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{value: weiValue}(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}


pragma solidity ^0.6.0;



/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            'SafeERC20: approve from non-zero to non-zero allowance'
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(
            value,
            'SafeERC20: decreased allowance below zero'
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, 'SafeERC20: low-level call failed');
        if (returndata.length > 0) {
            // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), 'SafeERC20: ERC20 operation did not succeed');
        }
    }
}


pragma solidity >=0.4.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor() internal {}

    function _msgSender() internal view returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


pragma solidity >=0.4.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() internal {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        require(_owner == _msgSender(), 'Ownable: caller is not the owner');
        _;
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), 'Ownable: new owner is the zero address');
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


// File contracts/SousChef.sol

pragma solidity 0.6.12;


interface IMasterChef {
    // using BoringERC20 for IERC20;

    function deposit(uint256 _pid, uint256 _amount) external;
}


interface IPair {
    function totalSupply() external view returns (uint);
    function balanceOf(address _address) external view returns (uint);
    function getReserves() external view returns (uint112 _reserve0, uint112 _reserve1, uint32 _blockTimestampLast);
}

interface IVault {
    function getPoolTokens(bytes32 _poolId) external view returns (
        IERC20[] memory tokens,
        uint256[] memory balances,
        uint256 lastChangeBlock
    );
}


// Neo is the One. Knows a lot about the Matrix, and he is a fair guy as well as Morpheus.

contract NeoPool is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public oracle;

    // Info of each user.
    struct UserInfo {
        uint256 amountLP;   // How many mLQDR-LQDR LP tokens the user has provided.
        uint256 amount;     // How many mLQDR tokens the user has provided.
        uint256 rewardDebt; // Reward debt. See explanation below.
        uint256 rewardDebtMorph; // Reward debt. See explanation below.
    }

    uint public period = 90000; // 25 hours
    address public morph = 0x0789fF5bA37f72ABC4D561D00648acaDC897b32d;
    address public lqdr = 0x10b620b2dbAC4Faa7D7FFD71Da486f5D44cd86f9;
    address public mlqdrlp = 0xeCAa1cBd28459d34B766F9195413Cb20122Fb942;   
    address public mlqdr = 0xCa3C69622E22524fF2b6cC24Ee7e654bbF91578a;    
    address public wftm = 0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83;

    // uint256 allocPoint;       // How many allocation points assigned to this pool. MORPHs to distribute per second.
    uint256 lastUpdateTimestamp;
    uint256 lastRewardTimestamp;  // Last block number that MORPHs distribution occurs.
    uint256 accMorphPerShare; // Accumulated MORPHs per share, times 1e12. See below.
    uint256 accWFTMPerShare;

    address masterchef = 0xc7dad2e953Dc7b11474151134737A007049f576E;
    uint masterchef_pid;

    mapping (address => UserInfo) public userInfo;

    // 3.4
    // address[] userAddresses;


    // dynamic accMorphPerShare
    uint256[] public rewardUpdateTimestamps;
    // block.timestamp => rewardPerSec during that reward segement
    mapping(uint256 => uint256) public wftmRewardSegments;

    // block.timestamp => rewardPerSec during that reward segement
    mapping(uint256 => uint256) public morphRewardSegments;

    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);
    event EmergencyWithdraw(address indexed user, uint256 amount);

    constructor() public {
        // masterchef = _masterchef;
        // for testing
        // pills = _stakingToken;
        // wftm = _rewardToken;


        lastRewardTimestamp = block.timestamp;
        accMorphPerShare = 0;
        accWFTMPerShare = 0;

        // to be set later
        oracle = msg.sender;
    }

    function depositDummy(address token) public onlyOwner {
        IERC20(token).approve(masterchef, 1);
        IMasterChef(masterchef).deposit(masterchef_pid, 1);
    }

    function setOracle(address _oracle) public onlyOwner {
        oracle = _oracle;
    }

    function setMasterChefPid(uint pid) public onlyOwner {
        masterchef_pid = pid;
    }

    // get the current reward per sec
    function getRewardPerSec() public view returns (uint, uint) {
        uint256 timestamp = rewardUpdateTimestamps[rewardUpdateTimestamps.length - 2];
        return (wftmRewardSegments[timestamp], morphRewardSegments[timestamp]);
    }

    // UPDATED
    function getRewardRates() public view returns (uint wftmRewards, uint morphRewards) {
        for (uint j = 0; j < rewardUpdateTimestamps.length; j++) {
            uint256 multiplier = 0;
            // if we are at the end of the rewardUpdateTimestamps
            if (j == rewardUpdateTimestamps.length - 2) {
                // if we have reached the end of the rewards
                // i.e oracle didnt trigger update in time, because continuity is expected
                if(rewardUpdateTimestamps[j + 1] <= block.timestamp)
                    multiplier = rewardUpdateTimestamps[j + 1] - lastRewardTimestamp;

                // if the last reward timestamp was before a new segment started
                // the time since the start of this segment
                else if(lastRewardTimestamp <= rewardUpdateTimestamps[j])
                    multiplier = block.timestamp - rewardUpdateTimestamps[j];

                // if the last reward timestamp was in the current segment
                // the time since last reward timestamp
                else
                    multiplier = block.timestamp - lastRewardTimestamp;

                // we are at the end
                // UPDATED
                wftmRewards = wftmRewards.add(multiplier.mul(wftmRewardSegments[rewardUpdateTimestamps[j]]));
                morphRewards = morphRewards.add(multiplier.mul(morphRewardSegments[rewardUpdateTimestamps[j]]));
                break;
            }

            // if the last reward timestamp was after this segment
            // it means we've already added this segment
            else if (rewardUpdateTimestamps[j + 1] <= lastRewardTimestamp) continue;

            // if we haven't added this segment fully
            // add in remaining blocks
            // 3.5
            else if (rewardUpdateTimestamps[j + 1] <= block.timestamp)
                multiplier = rewardUpdateTimestamps[j + 1] - lastRewardTimestamp;

            // UPDATED
            wftmRewards = wftmRewards.add(multiplier.mul(wftmRewardSegments[rewardUpdateTimestamps[j]]));
            morphRewards = morphRewards.add(multiplier.mul(morphRewardSegments[rewardUpdateTimestamps[j]]));
        }
    }

    function pendingMorph(address _user) external view returns (uint256) {
        UserInfo storage user = userInfo[_user];
        uint mlqdrlpSupply = IERC20(mlqdrlp).balanceOf(address(this));
        
        uint _accMorphPerShare = accMorphPerShare;

        if (block.timestamp > lastRewardTimestamp && mlqdrlpSupply != 0) {
            (,uint rewardPerSec) = getRewardRates();

            _accMorphPerShare = _accMorphPerShare.add(rewardPerSec.mul(1e12).div(mlqdrlpSupply));
        }
        return user.amount.mul(_accMorphPerShare).div(1e12).sub(user.rewardDebt);
    }

    // View function to see pending Reward on frontend.
    // constant neo
    function pendingReward(address _user) external view returns (uint256) {
        UserInfo storage user = userInfo[_user];

        uint mlqdrlpSupply = IERC20(mlqdrlp).balanceOf(address(this));
        // gets the amount of mlqdr
        // uint mlqdrlpSupply = getStakedValue(IERC20(mlqdrlp).balanceOf(address(this)));
        // uint totalSupply = mlqdrSupply + mlqdrlpSupply;

        uint _accWFTMPerShare = accWFTMPerShare;
        if (block.timestamp > lastRewardTimestamp && mlqdrlpSupply != 0) {
            (uint rewardPerSec,) = getRewardRates();

            _accWFTMPerShare = _accWFTMPerShare.add(rewardPerSec.mul(1e12).div(mlqdrlpSupply));
        }
        return user.amount.mul(_accWFTMPerShare).div(1e12).sub(user.rewardDebt);
    }

    function updatePeriod(uint _period) public onlyOwner {
        period = _period;
    }

    // 3.4
    // returns the total amount of outstanding rewards from the current segment
    function outstandingRewards() public view returns (uint256 outstandingWFTM, uint256 outstandingMorph) {
        // pC2
        if(rewardUpdateTimestamps.length == 0) return (0,0);

        uint segment0Timestamp = rewardUpdateTimestamps[rewardUpdateTimestamps.length - 2];
        uint segment1Timestamp = rewardUpdateTimestamps[rewardUpdateTimestamps.length - 1];
        if(segment1Timestamp >= block.timestamp) {
            outstandingWFTM = 0;
            outstandingMorph = 0;
        } else {
            uint timeRemaining = segment1Timestamp - block.timestamp;
            uint morphRewardPerSec = morphRewardSegments[segment0Timestamp];
            uint wftmRewardPerSec = wftmRewardSegments[segment0Timestamp];
            outstandingMorph = timeRemaining * morphRewardPerSec;
            outstandingWFTM = timeRemaining * wftmRewardPerSec;
        }
    }

    // constant neo
    function updateRewardPerSec(uint256 newAmount) public {
        require(msg.sender == oracle || msg.sender == owner(), "Only the oracle or Neo himself can get through...");
        require(block.timestamp > lastUpdateTimestamp);
        lastUpdateTimestamp = block.timestamp;

        uint256 oldMorphBalance = IERC20(morph).balanceOf(address(this));
        IMasterChef(masterchef).deposit(masterchef_pid, 0);
        uint256 newMorphAmount = IERC20(morph).balanceOf(address(this)) - oldMorphBalance;

        uint256 wftmBalance = IERC20(wftm).balanceOf(address(this));
        uint256 morphBalance = IERC20(morph).balanceOf(address(this));
        if (wftmBalance == 0 && morphBalance == 0) return;

        (uint outstandingWFTM, uint outstandingMorph) = outstandingRewards();
        uint wftmRewardSupply = newAmount.add(outstandingWFTM);
        uint morphRewardSupply = newMorphAmount.add(outstandingMorph);

        // amount of seconds in a week + 1/3 day padding in case of network congestion
        // don't want to run out of that good good
        uint256 wftmRewardPerSec = wftmRewardSupply.div(period);
        uint256 morphRewardPerSec = morphRewardSupply.div(period);

        // if it's not the first segment
        // update this segment
        // replace previous n.length - 1 index with current timestamp
        if(
            // not the first segment
            rewardUpdateTimestamps.length != 0 
            // within bounds of current segment
            && block.timestamp < rewardUpdateTimestamps[rewardUpdateTimestamps.length - 1]) 
            rewardUpdateTimestamps[rewardUpdateTimestamps.length - 1] = block.timestamp;
        // this should never happen, but in case there is oracle lag/downtime
        // this prevents extra rewards, so there would be a segment with a 0 rewardPerSec value
        else
            rewardUpdateTimestamps.push(block.timestamp);

        rewardUpdateTimestamps.push(block.timestamp + period);
        morphRewardSegments[block.timestamp] = morphRewardPerSec;
        wftmRewardSegments[block.timestamp] = wftmRewardPerSec;

        // in case rewardPerSec doesnt update in time
        morphRewardSegments[block.timestamp + period] = 0;
        wftmRewardSegments[block.timestamp + period] = 0;

        updatePool();
    }

    // UPDATED
    // constant neo
    // Update reward variables of the given pool to be up-to-date.
    function updatePool() public {
        if (block.timestamp <= lastRewardTimestamp) return;
        if (rewardUpdateTimestamps[rewardUpdateTimestamps.length - 1] <= lastRewardTimestamp) return; // no more to give since last reward
        uint256 mlqdrlpSupply = IERC20(mlqdrlp).balanceOf(address(this));

        if (mlqdrlpSupply == 0) {
            lastRewardTimestamp = block.timestamp;
            return;
        }

        (uint wftmRewardPerSec, uint morphRewardPerSec) = getRewardRates();
        accWFTMPerShare = accWFTMPerShare.add(wftmRewardPerSec.mul(1e12).div(mlqdrlpSupply));
        accMorphPerShare = accMorphPerShare.add(morphRewardPerSec.mul(1e12).div(mlqdrlpSupply));
        lastRewardTimestamp = block.timestamp;
    }

    // NEW
    // get mLQDR value from mLQDR-LQDR LP
    function getStakedValue(uint amount) public view returns (uint) {
        if(amount == 0) return 0;

        (,uint256[] memory balances,) = IVault(0x20dd72Ed959b6147912C2e529F0a0C651c33c9ce).getPoolTokens(0xecaa1cbd28459d34b766f9195413cb20122fb942000200000000000000000120);
        uint totalSupply = IPair(mlqdrlp).totalSupply();

        uint value = (balances[1] * amount) / totalSupply;
        return value;
    }

    // UPDATED
    function deposit(uint256 _amount) public {
        UserInfo storage user = userInfo[msg.sender];
        updatePool();

        if(_amount > 0) {
            IERC20(mlqdrlp).safeTransferFrom(address(msg.sender), address(this), _amount);
            user.amount = user.amount.add(_amount);
        }

        if (user.amount > 0) {
            // wftm rewards
            uint256 pending = user.amount.mul(accWFTMPerShare).div(1e12).sub(user.rewardDebt);
            if(pending > 0) {
                IERC20(wftm).safeTransfer(address(msg.sender), pending);
            }

            // morph rewards
            uint256 pendingMorphReward = user.amount.mul(accMorphPerShare).div(1e12).sub(user.rewardDebtMorph);
            if(pendingMorphReward > 0) {
                IERC20(morph).safeTransfer(address(msg.sender), pendingMorphReward);
            }
        }

        user.rewardDebt = user.amount.mul(accWFTMPerShare).div(1e12);
        user.rewardDebtMorph = user.amount.mul(accMorphPerShare).div(1e12);

        emit Deposit(msg.sender, _amount);
    }

    // Withdraw SYRUP tokens from STAKING.
    function withdraw(uint256 _amount) public {
        UserInfo storage user = userInfo[msg.sender];
        require(user.amount >= _amount, "withdraw: not good");

        updatePool();
        uint256 pending = user.amount.mul(accWFTMPerShare).div(1e12).sub(user.rewardDebt);
        if(pending > 0) {
            IERC20(wftm).safeTransfer(address(msg.sender), pending);
        }
        if(_amount > 0) {
            user.amount = user.amount.sub(_amount);
            IERC20(mlqdrlp).safeTransfer(address(msg.sender), _amount);
        }

        user.rewardDebt = user.amount.mul(accWFTMPerShare).div(1e12);

        emit Withdraw(msg.sender, _amount);
    }

    // Withdraw without caring about rewards. EMERGENCY ONLY.
    // function emergencyWithdraw() public {
    //     UserInfo storage user = userInfo[msg.sender];
    //     pills.safeTransfer(address(msg.sender), user.amount);
    //     user.amount = 0;
    //     user.rewardDebt = 0;
    //     emit EmergencyWithdraw(msg.sender, user.amount);
    // }

    // Withdraw reward. EMERGENCY ONLY.
    function emergencyRewardWithdrawLqdr(uint256 _amount) public onlyOwner {
        require(_amount < IERC20(wftm).balanceOf(address(this)), 'not enough token');
        IERC20(wftm).safeTransfer(address(msg.sender), _amount);
    }

    // Withdraw reward. EMERGENCY ONLY.
    function emergencyRewardWithdrawMorph(uint256 _amount) public onlyOwner {
        require(_amount < IERC20(morph).balanceOf(address(this)), 'not enough token');
        IERC20(morph).safeTransfer(address(msg.sender), _amount);
    }

}