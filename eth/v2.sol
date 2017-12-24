pragma solidity ^0.4.2;


contract DecentraLibrary{
        
    struct Multihash {
      bytes32 _hash;
      uint8 _hash_function;
      uint8 _size;
    }
    
    struct Review{
        Multihash _ipfsReviewMultihash;
        
        address _reviwer;
        
        uint8 _acceptance;
    }
    
    struct Paper{
        Multihash _ipfsPaperMultihash;

        // Ethereum's addresses of the authors
        address[] _authors;

        // Check if the paper is acepted
        bool _published;
        
        //Reviews of the paper
        bytes32[] _paperReviews;
    }
    
    mapping(bytes32 => Paper) shelf;
    mapping(bytes32 => Review) feedback;
    
    address owner;
    
    event PaperStored(
        bytes32 paperIdHash,
        address[] _authors);
    
    function addPaper(uint8 size,uint8 hash_function,bytes32 hash,address[] authors)
    public{
        bytes32 paperIdHash = keccak256(hash,size,hash_function);
        Multihash memory mh;
        mh._size= size;
        mh._hash_function = hash_function;
        mh._hash = hash;
        
        Paper memory ppr;
        ppr._ipfsPaperMultihash = mh;
        ppr._published = false;
        ppr._authors = authors;
        shelf[paperIdHash]=ppr;
        PaperStored(paperIdHash,authors);
    }
    
    
    function addReview(uint8 size,uint8 hash_function,bytes32 hash,uint8 acceptance, bytes32 paperAddress)
    public{
        bytes32 reviewIdHash = keccak256(hash,size,hash_function);
        Multihash memory mh;
        mh._size= size;
        mh._hash_function = hash_function;
        mh._hash = hash;
        
        Review memory rev;
        rev._ipfsReviewMultihash = mh;
        rev._reviwer = msg.sender;
        rev._acceptance = acceptance;
        bytes32 revID = keccak256(msg.sender, paperAddress, reviewIdHash);
        
        feedback[revID] = rev;
        shelf[paperAddress]._paperReviews.push(revID);
    }
    
    function getPaper(bytes32 paperIdHash)
    public 
    constant
    returns(uint8,uint8,bytes32,address[],bool){
        Paper memory p = shelf[paperIdHash];
        return(p._ipfsPaperMultihash._size,
        p._ipfsPaperMultihash._hash_function,
        p._ipfsPaperMultihash._hash,p._authors,p._published);
    }
    
    function DecentraLibrary() 
    public
    {
        owner = msg.sender;
    }
}
