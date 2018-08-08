pragma solidity ^0.4.0;
contract Winner {

    string winner = "no winner yet";
    string betWinner = "no bet";
    uint256 betAmount= 0;
    int numberOfPlayers = 0;
    mapping(address => bool) isPlayer;
    
    constructor() public payable{
    }
    
    function BuyIn() public payable {
        betAmount = betAmount + msg.value;
        numberOfPlayers = numberOfPlayers + 1;
        if(numberOfPlayers <= 2){
            isPlayer[msg.sender] = true;
        }
    }
    
    function BetOn(string _betWinner) public payable {
        betWinner = _betWinner;
        betAmount = msg.value;
    }
    
    function SetWinner(string _newWinner) public {
        winner = _newWinner;
    }
    
    function GetWinner() public view returns(string){
        return winner;
    }
    
    function GetBet() public view returns(uint256){
        return betAmount;
    }
    
    function BettingResult() public payable {
        if(isPlayer[msg.sender] == true){
            msg.sender.transfer(betAmount);
            betAmount = 0;
            numberOfPlayers = 0;
        }

    }
}