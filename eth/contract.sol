pragma solidity^0.4.0;

contract RevHub{
    
    struct Reviewer{
        // Ethereum's address of the reviewer
        address reviewerAddress;
        
        // Reputation of the reviewer
        uint reputation;
        
        // Number of reviews
        uint numReviews;
        
        // Fields of expertise of the reviewer
        // You can find the index of fields in the index var
        uint[] fields;
    }
    
    //Contract variables
    address owner;

    mapping(uint => string) public indexFields;
    
    mapping(uint => Reviewer) public reviewers;
    uint numReviewers;

    
    mapping(uint => address) public admins;
    uint numAdmins;
    
    
    // Modifiers
    modifier onlyAdmins(){
        bool isAdmin = false;
        for(uint i = 0; i < numAdmins; i++){
            if(msg.sender == admins[i])
            {
                isAdmin = true;
                break;
            }
        }
        require(isAdmin);
        _;
    }
    modifier onlyReviewers(){
        bool isReviewer = false;
        for(uint i = 0; i < numReviewers; i++){
            if(msg.sender == reviewers[i].reviewerAddress)
            {
                isReviewer = true;
                break;
            }
        }
        require(isReviewer);
        _;
    }
    
    //Events
    event ReviewerRegistered(address reviewerAddress,uint[] fields);
    event ReputationReceived(address _from, address _to, uint _idReviewer, uint _rep);
    
    //Functions
    function RevHub() public{
        owner = msg.sender;
        numReviewers = 0;
        numAdmins = 0; 
        admins[numAdmins] = owner;
        numAdmins++;
    }
    
    function registerReviewer
    (
    address _reviewerAddress,
    uint _field1,
    uint _field2,
    uint _field3
    )
    public
    onlyAdmins()
    {
        Reviewer storage newReviewer = reviewers[numReviewers];
        newReviewer.reviewerAddress = _reviewerAddress;
        newReviewer.reputation = 0;
        //newReviewer.fields = new uint[](20);
        newReviewer.fields.push(_field1);
        newReviewer.fields.push(_field2);
        newReviewer.fields.push(_field3);
        numReviewers++;
        ReviewerRegistered(newReviewer.reviewerAddress, newReviewer.fields);
    }

    function getFields(uint idReviewer)
    public
    constant
    returns (uint[])
    {
        return reviewers[idReviewer].fields;
    }
    
    function giveRep(uint _idReviewer, uint _reputation)
    public{
        if(_reputation > 10 || _reputation < 1) {
            revert();
        } else {
            reviewers[_idReviewer].reputation =
            (reviewers[_idReviewer].reputation * 80 + _reputation *20)/100;
        }
    }
    
    //fallback function    
    function() public{
        revert();
    }
    /*
    struct Rating{
        address rater;
        address reviewer;
        bytes32 reviewHash;
        uint numRating;
    }
    
        event ReviewRated(
        address _from,
        address _toReviewer,
        string _ipfsPaperAddress,
        string _ipfsReviewAddress,
        uint _rating
        );
        
    */
}
contract RevNex{
    
    mapping(bytes32 => bytes32[]) public paperReviewsMap;
    mapping(bytes32 => uint8[]) public paperAcceptance;
    
    function sendReview(bytes32 _ipfsPaperAddress, bytes32 _ipfsReviewAddress, uint8 _acceptance)
    public
    {
        paperReviewsMap[_ipfsPaperAddress].push(_ipfsReviewAddress);
        paperAcceptance[_ipfsPaperAddress].push(_acceptance);
    }

    
    function RevNex()
    public{}
    
    function checkAcceptance(bytes32 _ipfsPaperAddress)
    public 
    constant
    returns (bool){
        return (paperAcceptance[_ipfsPaperAddress].length > 1);
    }
}

contract CustomReviewsNexus extends RevNex{
    
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

    //Reviews mapping of the pending papers
    //mapping(bytes32 => Review) reviewHashMapping;

    //Rating mapping of the reviews
    //mapping(bytes32 => Rating) reviewsRating;

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
        reviewsNexus.sendReview(_ipfsPaperAddress,_ipfsReviewAddress,_acceptance);
        //TODO check if the paper is accepted
        checkAcceptance(_ipfsReviewAddress);
    }

    function checkAcceptance(bytes32 _ipfsPaperAddress)
    private{

        //Custom acceptance metrics
        PaperPublished(_ipfsPaperAddress);
    }

}
