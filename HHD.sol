pragma solidity ^0.5.2;

contract HHD {

     mapping (address => uint ) public balances;




     modifier onlyOwner() {
          require(msg.sender == owner)
          _;
     }




       function DepositFunds() public payable {
           balances[msg.sender] += msg.value;
        }

        function WithdrawFunds(uint amount) public {
            require (balances[msg.sender] >= amount);
            balances[msg.sender] -= amount;

            msg.sender.transfer(amount);
        }

        function TransferFunds(uint amount, address payable recipient) public  {
            require (balances[msg.sender] >= amount);
            balances[msg.sender] -= amount;

            recipient.transfer(amount);
        }

}
