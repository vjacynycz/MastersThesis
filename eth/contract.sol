pragma solidity^0.4.0;

contract RevHub{
    
    struct Reviewer{
        
        // Reputation of the reviewer
        uint reputation;

        // Number of reviews
        uint numReviews;

        // Field ids of expertise of the reviewer
        // Check ACM CCS https://dl.acm.org/ccs/ccs.cfm

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

//DAJ contract template (Decentralized Autonomous Journal)
contract DAJ{

    //Structs
    struct Paper{
        // IPFS Address of the file
        // i.e. QmbFMke1KXqnYyBBWxB74N4c5SBnJMVAiMNRcGu6x1AwQH
        bytes32 ipfsPaperAddress;

        // Ethereum's address of the author
        address[] authors;

        // Check if the paper is acepted
        bool published;
    }



    /*
    Variables
    */

    RevHub reviewerHub;
    RevNex reviewsNexus;

    //Mapping structure for papers
    mapping(uint => Paper) public idPaperMap;
    mapping(bytes32 => uint) ipfsPaperMap;
    uint numPapers;

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
        uint _paperId,
        bytes32 _ipfsPaperAddress);

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
        numPapers = 0;
        owner = msg.sender;
        numPapers = 0;
        reviewsNexus = _reviewsNexus;
    }

    function getPaper(uint paperId)
    constant
    public
    returns (
        bytes32 ipfsPaperAddress,
        address[] authors
        ){
        return (
            idPaperMap[paperId].ipfsPaperAddress,
            idPaperMap[paperId].authors
        );
    }

    function sendPaper(
        bytes32 _ipfsPaperAddress,
        address[] _authors
        )
        public{
            idPaperMap[numPapers].ipfsPaperAddress = _ipfsPaperAddress;
            idPaperMap[numPapers].authors = _authors;
            ipfsPaperMap[_ipfsPaperAddress] = numPapers;
            PaperSent(msg.sender,_authors,numPapers,_ipfsPaperAddress);
            numPapers++;
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
