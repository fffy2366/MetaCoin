pragma solidity ^0.4.18;
import "./StarAccessControl.sol";

contract StarBase is EtherbotsPrivileges{
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

        uint256[] decoration;
    }
    struct Spaceship {
        string name;
        // The minimum timestamp after which this star can battle again.
        uint64 cooldownEndTime;
    }
    struct User {
        string name;
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

    // A mapping from star IDs to the address that owns them.
    mapping (uint256 => address) public starIndexToOwner;

    // A mapping from owner address to count of tokens that address owns.
    // Maximum 100.
    mapping (address => uint256) ownershipTokenCount;

    mapping (address => uint256[]) ownerStars;

    
}