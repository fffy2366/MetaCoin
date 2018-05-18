const debug = require("debug")("cs");

var StarCore = artifacts.require("./StarCore.sol");

contract('StarCore', function(accounts) {
  let core;
  // async function deployContract() {
  //   debug("deploying contract");
  //   core = await StarCore.new();
  // }
  // describe("Initial star", function() {
  //   before(deployContract);
  //   it("The first should 0", async function(){
  //     console.log('accounts[1] is %s', accounts[1]);
  //     let _id = await core.generateStar(accounts[1], {gas: 800000});
  //     console.log('_id is %o' , _id);
  //     // console.log('The first should 0');
  //   });    
  // }); 
  
  it('Initial star', function(){
    return StarCore.deployed().then(function(instance) {
      core = instance;
      return instance.generateStar.call(accounts[0]);
    }).then(function(_id) {
      console.log('_id is %s', _id);
      assert.equal(_id, 1, "The first should 1");
      return _id;
    }).then(function(_id){
      return core.getMyStars.call(accounts[0])
    }).then(function(stars){
      console.log('my stars is %o', stars);
    }).then(function(){
      // return core.getStar.call(0);
    }).then(function(star){
      // console.log('star 1 is %o', star);
    });
  });
});
