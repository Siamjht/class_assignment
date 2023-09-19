import 'dart:math';
import 'dart:io';

bool isNotCalled = true;

// To do round/ short  a double data
double roundDouble(double value, int places){
  double mod = pow(10.0, places).toDouble();
  return ((value * mod).round().toDouble() / mod);
}

// to call simple/ compound interest method
void calculateInterests(double principle, double year, double intRate, Function fn){
  fn(principle, year, intRate);
}

// to generate simple interest from input data
var simpleInterest = (double principle, double year, double intRate){
  double totalInterest = roundDouble(principle * year * (intRate / 100), 2);
  double totalAmount = principle + totalInterest;

  if(isNotCalled){print('Simple Interest: Principle Amount   Duration   Interest Rate     Total Interest      Total Amount');}
  print('                  $principle TK          $year y          $intRate %         $totalInterest TK       ${roundDouble(totalAmount, 0)} TK');

  isNotCalled = false;
};

// to generate compound interest from input data
var compoundInterest = (double principle, double year, double intRate){
  double totalInterest = roundDouble(principle * (pow((1 + (intRate/100)), year) - 1), 2);
  double totalAmount = principle + totalInterest;

  if(isNotCalled){print('Compound Interest: Principle Amount   Duration   Interest Rate     Total Interest     Total Amount');}
  print('                    $principle TK       $year y           $intRate %          $totalInterest TK      ${roundDouble(totalAmount, 0)} TK');

  isNotCalled = false;
};

// to generate random number
double random(double least, double max, int toRound){
  return (least + ((Random().nextDouble() * (max - least))/toRound).round()* toRound);
}

// Inputted data splitting and converted to double
List<double> splitting(String stringForSplit){
  var splitString = stringForSplit.split(" ");
  return [double.parse(splitString[0]), double.parse(splitString[1])];
}


void main(){
  
  stdout.write('How many "TIMES" do you want to calculate interest (Simple & Compound)? Enter Here:');
  int loopLimit = int.parse(stdin.readLineSync()!);

  stdout.write('              Press Space Bar between taking two values!\n');
  // Discuss with sir how to I can use Try Catch to take input data

  stdout.write('How much "MONEY" will you take loan? Enter "Least amount" & "Max amount":');
  var amount = splitting(stdin.readLineSync()!);


  stdout.write('How many "YEARS" do you want to take to pay your loan! Please enter years range(min & max year):');
  var year = splitting(stdin.readLineSync()!);


  stdout.write('How much "INTEREST RATE" do you prefer? Enter the limit (min & Max value):');
  var intRate = splitting(stdin.readLineSync()!);



  for(int i = 0; i < loopLimit; i++){
    calculateInterests( random(amount[0], amount[1], 1000), random(year[0], year[1], 1), random(intRate[0], intRate[1], 1), simpleInterest);
  }
  print('');
  isNotCalled = true;


  for(int i = 0; i < loopLimit; i++){
    calculateInterests( random(amount[0], amount[1], 1000), random(year[0], year[1], 1), random(intRate[0], intRate[1], 1), compoundInterest);
  }
}