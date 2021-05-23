// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: manifold.xyz

import "manifoldxyz-creator-core-solidity/contracts/extensions/ICreatorExtensionBase.sol";
import "manifoldxyz-libraries-solidity/contracts/access/IAdminControl.sol";

/**
 * @dev Base redemption interface
 */
interface IRedeemBase is IAdminControl, ICreatorExtensionBase {

    /**
     * @dev Update approved contracts that can be used to redeem. Can only be called by contract owner/admin.
     */
    function updateApprovedContracts(address[] calldata contracts, bool[] calldata approved) external;

    /**
     * @dev Update approved tokens that can be used to redeem. Can only be called by contract owner/admin.
     */
    function updateApprovedTokens(address contract_, uint256[] calldata tokenIds, bool[] calldata approved) external;

    /**
     * @dev Update approved token ranges that can be used to redeem. Can only be called by contract owner/admin.
     * Clears out old ranges
     */
    function updateApprovedTokenRanges(address contract_, uint256[] calldata minTokenIds, uint256[] calldata maxTokenIds) external;

    /**
     * @dev Get the redemption rate
     */
    function redemptionRate() external view returns(uint16);

    /**
     * @dev Get number of redemptions left
     */
    function redemptionRemaining() external view returns(uint16);

    /**
     * @dev Check if an NFT is redeemable
     */
    function redeemable(address contract_, uint256 tokenId) external view returns(bool);

    /**
     * @dev Get the mint number of a created token id
     */
    function mintNumber(uint256 tokenId) external view returns(uint256);

    /**
     * @dev Get list of all minted tokens
     */
    function mintedTokens() external view returns(uint256[] memory);

}