const TrueTree = artifacts.require('TrueTree');

module.exports = function(deployer) {
    deployer.deploy(TrueTree, "0x7D80c2e16099e39ff8d60721ddf5470B72b72D41");
}