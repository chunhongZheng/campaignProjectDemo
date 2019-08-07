pragma solidity ^0.4.23;
/**众筹合约**/
contract Campaign{
   struct  Request{
     string description;//描述
     uint value;
     address reciptients;//受益人的地址
     bool complete;//项目是否完成
     mapping (address => bool) approvers;
     uint  approvesCount;
   }

    Request[] public requests;
    address public manager; //管理者
    uint public minunumContribute;//最小金额
    mapping (address => bool) approvers;
    uint  approvesCount;


    constructor(uint mininum, address _addr)public{
       manager=_addr;
       minunumContribute=mininum;
    }
    /**投资或者捐款**/
    function contribute() public payable{
      require(msg.value>minunumContribute);
      approvers[msg.sender]=true;
      approvesCount++;
    }
    //创建项目请求
    function createRequest(string _desc,uint _value,address _addr) public{
      Request memory newquest = Request({
        value:_value,
        description: _desc,
        reciptients: _addr,
        complete: false,
        approvesCount: 0
      }
     );
       requests.push(newquest);
    }
    function approvalRequest(uint index) public{
      Request  memory request=requests[index];
      
    }


}
