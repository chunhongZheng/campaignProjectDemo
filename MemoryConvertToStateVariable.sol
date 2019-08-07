pragma solidity ^0.4.0;

contract MemoryConvertToStateVariable{
  struct S{string a;uint b;}

  //默认是storage的
  S s;

  function memoryToState(S memory tmp) internal{
    s = tmp;//从内存中复制到状态变量中。

    //修改旧memory中的值，并不会影响状态变量
    tmp.a = "Test";
  }

  function call() returns(string){
    S memory tmp = S("memory", 0);
    memoryToState(tmp);

    return s.a;
  }
}
