pragma solidity ^0.4.18;
import "./StarBase.sol";

contract StarCore is StarBase {
    function generateStar(address _user){
        require(ownershipTokenCount[_user]<1)
        
    }
    function getUser(address _user)
        public
        view
        returns (
        string name,
        string avatar,
        uint256 crystal
    ) {

    }
    function getStar(uint256 _id)
        public
        view
        returns (
        bool isReadyBattle,
        uint256 createTime,
        uint256 lastCollectTime
    ) {
        Star storage star = stars[_id];

        isReadyBattle = (star.cooldownEndTime <= now);
        
        createTime = uint256(star.createTime);

        lastCollectTime = uint256(star.lastCollectTime);
    }
    
    // function getMyStars(address _user)
    //     public
    //     view
    // returns (
    //     Star[] stars
    // ) {
    //     uint256[] myStars = ownerStars[_user];
    //     uint len = myStars.length;
    //     for (uint i = 0; i < len; i++){
    //         stars.push(getStar(myStars[i]));
    //     }
    // }

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