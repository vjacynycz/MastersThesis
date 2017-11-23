pragma solidity^0.4.0;

contract RevHub{
    
    struct Reviewer{
        
        // Reputation of the reviewer
        uint reputation;

        // Number of reviews
        uint numReviews;

        // Fields of expertise of the reviewer
        // You can find the index of fields in the index var
        uint16[] fields;
    }
    
    mapping(address => Reviewer) public reviewers;

    //Events
    event ReviewerRegistered(address reviewerAddress,uint16[] fields);
    event ReputationReceived(address _from, address _to, uint _idReviewer, uint _rep);

    //Functions
    function RevHub() public{
    }

    function registerReviewer
    (
    address _reviewerAddress,
    uint16[] _fields
    )
    public
    {
        Reviewer memory newReviewer;
        newReviewer.reputation = 0;
        newReviewer.fields = _fields;
        reviewers[_reviewerAddress] = newReviewer;
        ReviewerRegistered(_reviewerAddress, _fields);
    }

    function giveRep(address _reviewerAddress, bool _reputation)
    public{
        if(_reputation){
            reviewers[_reviewerAddress].reputation ++;
        }else{
            reviewers[_reviewerAddress].reputation --;
        }
    }
    
    //fallback function    
    function() public{
        revert();
    }
}
contract CustomRevHub is RevHub{
    
    function giveRep(address _reviewerAddress, bool _reputation)
    public{
        if(_reputation){
            reviewers[_reviewerAddress].reputation ++;
        }else{
            reviewers[_reviewerAddress].reputation --;
        }
    }
    
}

contract RevNex{

    mapping(bytes32 => bytes32[]) public paperReviewsMap;
    mapping(bytes32 => uint8[]) public paperAcceptance;
    mapping(bytes32 => address[]) public paperReviewers;
    
    RevHub hub;
    
    function sendReview(
        bytes32 _ipfsPaperAddress, 
        bytes32 _ipfsReviewAddress, uint8 _acceptance,
        address _reviewerAddress
        )
    public
    {
        paperReviewsMap[_ipfsPaperAddress].push(_ipfsReviewAddress);
        paperAcceptance[_ipfsPaperAddress].push(_acceptance);
        paperReviewers[_ipfsPaperAddress].push(_reviewerAddress);
    }

    function RevNex(RevHub _hub)
    public{
        hub = _hub;
    }

    function checkAcceptance(bytes32 _ipfsPaperAddress)
    public
    constant
    returns (bool){
        return (paperAcceptance[_ipfsPaperAddress].length > 1);
    }
}

contract CustomReviewsNexus is RevNex{
    
    function checkAcceptance(bytes32 _ipfsPaperAddress)
    public
    constant
    returns (bool){
        return (paperAcceptance[_ipfsPaperAddress].length > 1);
    }
}

contract DecentraLibrary{
        
    struct Multihash {
      bytes32 _hash;
      uint8 _hash_function;
      uint8 _size;
    }
    
    struct Paper{
        Multihash _ipfsPaperMultihash;

        // Ethereum's addresses of the authors
        address[] _authors;

        // Check if the paper is acepted
        bool _published;
    }
    
    mapping(bytes32 => Paper) shelf;
    
    
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
    
    function getPaper(bytes32 paperIdHash)
    public 
    constant
    returns(uint8,uint8,bytes32,address[],bool){
        Paper memory p = shelf[paperIdHash];
        return(p._ipfsPaperMultihash._size,
        p._ipfsPaperMultihash._hash_function,
        p._ipfsPaperMultihash._hash,p._authors,p._published);
    }
    
    
}

//DAJ contract template (Decentralized Autonomous Journal)
contract DAJ{

    /*
    Variables
    */

    RevHub reviewerHub;
    RevNex reviewsNexus;
    DecentraLibrary lib;

    //Owner of the contract
    address owner;

    //Pending papers waiting for reviews
    uint[] pendingPapers;

    /*
    Modifiers
    */

    event PaperSent(
        address _from,
        address[] _authors,
        uint8 _size,
        uint8 _hash_function,
        bytes32 _hash);

    event PaperPublished(
        bytes32 _ipfsPaperAddress
      );

    event ReviewSent(
        address _reviewerAddress,
        bytes32 _ipfsPaperAddress,
        bytes32 _ipfsReviewAddress,
        uint _aceptance,
        bytes32 reviewHash);

    /*
    Functions
    */

    function DAJ(RevNex _reviewsNexus) public{
        owner = msg.sender;
        reviewsNexus = _reviewsNexus;
    }

    function sendPaper(
        uint8 _size,
        uint8 _hash_function,
        bytes32 _hash,
        address[] _authors
        )
        public{
            lib.addPaper(
                 _size,
                 _hash_function,
                 _hash,_authors
                );
        PaperSent(msg.sender,_authors, _size, _hash_function, _hash);
    }

    function sendReview(
      bytes32 _ipfsPaperAddress,
      uint8 _acceptance,
      bytes32 _ipfsReviewAddress
      )
    public
    {
        reviewsNexus.sendReview(_ipfsPaperAddress,_ipfsReviewAddress,_acceptance,msg.sender);
        //TODO check if the paper is accepted
        checkAcceptance(_ipfsReviewAddress);
    }

    function checkAcceptance(bytes32 _ipfsPaperAddress)
    private{

        //Custom acceptance metrics
        PaperPublished(_ipfsPaperAddress);
    }

}
