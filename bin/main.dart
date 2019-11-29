// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday

// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)


// Stretch: Show all moves which lead to win, given a state.


List<List<int>> willWinInOneMove(List<List<int>> inputState) {
  List<List<List<int>>> allPossibleMoves = possibleMoves(inputState);
  for (int i = 0; i < allPossibleMoves.length - 1; i++) {
      if(checkForFinalState(allPossibleMoves[i])){
        return allPossibleMoves[i];
      }
          
  }
}



List<List<int>> willWinInGivenNumberOfMoves(List<List<int>> inputState, int numberOfMoves){
  List<List<List<int>>> allPossibleMoves = possibleMoves(inputState);
  if(numberOfMoves == 1){
    return willWinInOneMove(inputState);
  }
  for(List<List<int>> list in allPossibleMoves){
    if(willWinInGivenNumberOfMoves(list,  numberOfMoves-1)!=null){
      return list;
    }
  }
    
  
  return null;
}

bool checkForFinalState(List<List<int>> listToCheck){
  if(listToCheck[0].isEmpty && listToCheck[1].isEmpty){
  return true;
  }
  return false;
}

List<List<List<int>>> possibleMoves(List<List<int>> inputState) {
  List<List<List<int>>> finalState = [];

  for (int i = 0; i < inputState.length; i++) {
    for (int j = 0; j < inputState.length; j++) {
      if (isValidMove(inputState, i, j)) {
        List<List<int>> copyInputState = [];
        for (List<int> list in inputState) {
          List<int> tempList = List.from(list);
          copyInputState.add(tempList);
        }
        copyInputState[j].insert(0, copyInputState[i][0]);

        copyInputState[i].removeAt(0);

        finalState.add(copyInputState);
      }
    }
  }
  return finalState;
}

bool isValidMove(List<List<int>> checkList, int from, int to) {
  if (checkList[from].isEmpty) {
    return false;
  }

  if (checkList[to].isEmpty) {
    return true;
  }

  return (checkList[from].first < checkList[to].first);
}




void printPossibleMoves(List<List<int>> inputState, int numberOfMoves){

  while(numberOfMoves > 0){
   List<List<int>> nextMove = willWinInGivenNumberOfMoves(inputState, numberOfMoves);
   print(nextMove);
   inputState = nextMove;
   numberOfMoves = numberOfMoves - 1;
  }
    
  
 

}

main() {

}