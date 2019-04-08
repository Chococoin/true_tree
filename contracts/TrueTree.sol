pragma solidity 0.5.0;

contract TrueTree {

    address payable public Warehouse;
    address payable public Owner;
    // Referrer is the address of the contract of the referrer.
    address payable public Referrer;

    bool State;

    State contractState;

    modifier contractIsActive() {
        require(contractState == true);
        _;
    } 

    modifier onlyOwner() {
        require(msg.sender == Owner);
        _;
    }

    modifier onlyAdmin() {
        require(msg.sender == Warehouse);
        _;
    }

    constructor(address payable _referrer) public {
        Referrer = _referrer;
        Owner = msg.sender;
        Warehouse = 0xbafAc3cfD051d861776021991fCAc608Ad3039c1;
        contractState = true;
    }

    function contractBalance() public view returns (uint256){
        return address(this).balance;
    }

    function() external payable contractIsActive {
    }

    function changeOwnerAddress (address payable _newAddress) public onlyOwner contractIsActive returns (address payable) {
        Owner = _newAddress;
        return Owner;
    }

    function triggerPayment () public payable onlyOwner {
        uint256 cashflow = address(this).balance;
        Warehouse.transfer(cashflow*90/100);
        Referrer.transfer(cashflow*10/100);

    }

    function disableContract () public onlyAdmin {
        contractState = false;
    }

    function showStatus () public view returns (bool) {
        return contractState;
    }
}
