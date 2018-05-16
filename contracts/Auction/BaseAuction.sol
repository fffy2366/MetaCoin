pragma solidity ^0.4.18;
import "../StarAccessControl.sol";
import "../ERC721Draft.sol";

contract BaseAuction is EtherbotsPrivileges{
    // Represents an auction on an NFT
    struct Auction {
        // Current owner of NFT
        address seller;
        // Price (in wei) at beginning of auction
        uint128 startingPrice;
        // Price (in wei) at end of auction
        uint128 endingPrice;
        // Duration (in seconds) of auction
        uint64 duration;
        // Time when auction started
        // NOTE: 0 if this auction has been concluded
        uint64 startedAt;
    }
    ERC721 nonFungibleContract;
    function BaseAuction (address _nftAddress) public {
        ERC721 candidateContract = ERC721(_nftAddress);
        require(candidateContract.implementsERC721());
        nonFungibleContract = candidateContract;
    }
    /// @dev Remove all Ether from the contract, which is the owner's cuts
    ///  as well as any Ether sent directly to the contract address.
    ///  Always transfers to the NFT contract, but can be called either by
    ///  the owner or the NFT contract.
    function withdrawBalance() external {
        address nftAddress = address(nonFungibleContract);

        require(
            msg.sender == owner ||
            msg.sender == nftAddress
        );
        nftAddress.transfer(this.balance);
    }

        // Creates an auction and lists it.
    function createAuction( uint256 _partId, uint256 _startPrice, uint256 _endPrice, uint256 _duration, address _seller ) 
        external 
        whenNotPaused {
        // Sanity check that no inputs overflow how many bits we've allocated
        // to store them in the auction struct.
        require(_startPrice == uint256(uint128(_startPrice)));
        require(_endPrice == uint256(uint128(_endPrice)));
        require(_duration == uint256(uint64(_duration)));

        require(msg.sender == address(nonFungibleContract));
        // _escrow(_seller, _partId);
        Auction memory auction = Auction(
            _seller,
            uint128(_startPrice),
            uint128(_endPrice),
            uint64(_duration),
            uint64(now) //seconds uint 
        );
        // PrintEvent("Auction Start", 0x0, auction.start);
        // _newAuction(_partId, auction);
    }



}