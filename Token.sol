pragma solidity ^0.4.24;

contract Token is ERC721{
    
    struct Token{
        string name; // Name of the Token
        uint level; // Token Level
        uint rarityLevel;  // 1 = normal, 2 = rare, 3 = epic, 4 = legendary
        uint power;
    }
    
    Token[] public tokens; // First Token has Index 0
    address public owner;
    
   event tokenEat(uint tokenInd, uint power); // add power
   event tokenWalk(uint tokenId, uint power); // less power
   event tokenPlay(uint tokenId);
    
    function Token() public {
        owner = msg.sender; // The Sender is the Owner; Ethereum Address of the Owner
    }
    
    function createToken(string _name, address _to) public{
        require(owner == msg.sender); // Only the Owner can create tokens
        uint id = tokens.length; // Token ID = Length of the Array tokens
        tokens.push(Token(_name,5,1,0)) // Token ("Dragon",5,1,0)
        _mint(_to,id); // Assigns the Token to the Ethereum Address that is specified
    }
    
    function eat(_tokenId,_power) public{
       token[_tokenInd].power.add(_power);
       emit tokenEat(_tokenId, _power);
    }
    
    function walk(_tokenId,_power) public{
       token[_tokenInd].power.sub(_power);
       emit tokenWalk(_tokenId, _power);
    }
    
    function play(_tokenInd) public{
 
        uint random = getRandom();
        uint morepower;
        if(random > 10 ){
           morepower = 100;
           token[_tokenInd].rarityLevel.add(getRarity());
        }else{
           morepower = 10;
        }
      
       token[_tokenInd].power.add(morepower);
       emit tokenPlay(_tokenId);
    }
    
    // Get random numbers
    function getRandom() private returns (uint)
    {
        uint random = uint(keccak256(now, msg.sender, randNonce)) % 100;
        randNonce++;
        return random;
    }
    
    
    function getRarity() private view returns(uint32)
    {
        // Generating random numbers
        uint random = getRandom();
        // Get 1-5 different rarity according to scale.
        if(random <= 5)
            return 5;
        else if(random <= 15 && random > 5)
            return 4;
        else if(random <= 30 && random >15)
            return 3;
        else if(random <= 50 && random > 30)
            return 2;
        else
            return 1;
            
    }
}
