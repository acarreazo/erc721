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
    
    function Token() public {
        owner = msg.sender; // The Sender is the Owner; Ethereum Address of the Owner
    }
    
    function createToken(string _name, address _to) public{
        require(owner == msg.sender); // Only the Owner can create tokens
        uint id = tokens.length; // Token ID = Length of the Array tokens
        tokens.push(Token(_name,5,1,0)) // Token ("Dragon",5,1,0)
        _mint(_to,id); // Assigns the Token to the Ethereum Address that is specified
    }
    
    function eat() public{
    
    }
    
    function walk() public{
    
    }
    
    function play() public{
    
    }
    
    // Get random numbers
    function _getRandom() private returns (uint)
    {
        uint random = uint(keccak256(now, msg.sender, randNonce)) % 100;
        randNonce++;
        return random;
    }
}
