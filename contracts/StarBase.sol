pragma solidity ^0.4.18;
import "./AccessControl.sol";
import "./Console.sol";

contract StarBase is EtherstarsPrivileges, Console{
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    struct Star {
        string name;
        // Crystal output per hour.
        uint32 speed;

        // The timestamp from the block when this stat create.
        uint64 createTime;

        // The last collect time for crystal.
        uint64 lastCollectTime;

        // The minimum timestamp after which this star can battle again.
        uint64 cooldownEndTime;

        // uint256[] decoration;
    }
    struct Spaceship {
        string name;
        // The minimum timestamp after which this star can battle again.
        uint64 cooldownEndTime;
    }
    struct User {
        string name;
        string avatar;
        uint256 crystal;
    }
    struct Decoration {
        string name;

        // Crystal output per hour.
        uint32 speed;
    }
    enum Color {white, gree, blue, purple, orange}
    struct Equipment {
        string name;

        // if 0 this equipment will destory
        uint8 durability;
        uint8 attackpower;
        Color quality;
    }
    
    User[] users;
    Star[] stars;
    Spaceship[] spaceships;
    Decoration[] decorations;
    Equipment[] equipment;
    
    mapping ( address => User ) public addressToUser;
    // A mapping from star IDs to the address that owns them.
    mapping (uint256 => address) public starIndexToOwner;

    // A mapping from owner address to count of tokens that address owns.
    // Maximum 100.
    mapping (address => uint256) ownershipTokenCount;

    mapping (address => uint256[]) ownerStars;

    // A mapping decorations of the star.
    mapping (uint256 => uint256[]) public starDecoration;

    /// @dev Assigns ownership of a specific Star to an address.
    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        // since the number of stars is capped to 2^32
        // there is no way to overflow this
        ownershipTokenCount[_to]++;
        // transfer ownership
        starIndexToOwner[_tokenId] = _to;
        ownerStars[_to].push(_tokenId);
        // When creating new stars _from is 0x0, but we can't account that address.
        if (_from != address(0)) {
            ownershipTokenCount[_from]--;
        }
        // Emit the transfer event.
        Transfer(_from, _to, _tokenId);
    }
    function _createStar(
        string _name,
        uint32 _speed,
        address _owner
    )
        internal
        returns (uint)
    {
        uint256[] _decoration;
        Star memory _star = Star({
            name: _name,
            speed: _speed,
            createTime: uint64(now),
            lastCollectTime: uint64(now),
            cooldownEndTime: uint64(now)
            // decoration: _decoration
        });
        uint256 newStarId = stars.push(_star) - 1;

        // It's probably never going to happen, 4 billion cats is A LOT, but
        // let's just be 100% sure we never let this happen.
        require(newStarId <= 4294967295);
        

        // This will assign ownership, and also emit the Transfer event as
        // per ERC721 draft
        _transfer(0, _owner, newStarId);
        return newStarId;
    }
    
}