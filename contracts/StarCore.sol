pragma solidity ^0.4.18;
// pragma experimental ABIEncoderV2;

import "./StarBase.sol";

contract StarCore is StarBase {
    function generateStar(address _user)
        public
        returns (
        uint tokenId            
    ) {
        require(ownershipTokenCount[_user] < 1);
        _createStar('我的星球', 30, _user);
        tokenId = _createStar('我的星球', 30, _user);
    }
    function getUser(address _user)
        public
        view
        returns (
        string name,
        string avatar,
        uint256 crystal
    ) {
        return (
            addressToUser[_user].name,
            addressToUser[_user].avatar,
            addressToUser[_user].crystal
            );
    }
    function getStar(uint _id)
        public
        view
        returns (
        string name,
        bool isReadyBattle,
        uint256 createTime,
        uint256 lastCollectTime
    ) {
        Star storage star = stars[_id];
        name = star.name;
        isReadyBattle = (star.cooldownEndTime <= now);
        
        createTime = uint256(star.createTime);

        lastCollectTime = uint256(star.lastCollectTime);
    }
    
    function getMyStars(address _user)
        public
        view
    returns (
        // Star[] _stars
        uint256[] myStars
    ) {
        myStars = ownerStars[_user];
        uint len = myStars.length;
        // for (uint i = 0; i < len; i++){
        //     _stars.push(getStar(myStars[i]));
        // }
        return myStars;
    }

    function collectCrystal(address _user)
        public 
    returns (
        uint256 crystal
    ) {

    }
    function collectAllCrystal(address _user)
        public 
    returns (
        uint256 crystal
    ) {

    }
}