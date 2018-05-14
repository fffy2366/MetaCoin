var Simple = artifacts.require("./Simple.sol");

contract('Simple', function(accounts) {
  it("should input two args", function() {
    return Simple.deployed().then(function(instance) {
      return instance.arithmetics.call(2, 3);
    }).then(function(result) {
      let product = result[1].c[0];
      console.log(product);
      console.log(result.valueOf());
      assert.equal(product, 6, "2 * 3 should 6");
    });
  });
   
});
