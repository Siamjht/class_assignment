import 'dart:math';

int called = 0;

// To do round/ short  a double data
double roundDouble(double value, int places){
  double mod = pow(10.0, places).toDouble();
  return ((value * mod).round().toDouble() / mod);
}

// to call simple/ compound interest method
void calculateInterests(double principle, int time, double intRate, Function fn){
  fn(principle, time, intRate);
}

// to generate simple interest from input data
var simpleInterest = (double principle, int time, double intRate){
  double totalInterest = roundDouble(principle * time * (intRate / 100), 2);
  double totalAmount = principle + totalInterest;

  if(called == 0){print('Simple Interest: Principle Amount   Duration   Interest Rate     Total Interest      Total Amount');}
  print('                  $principle TK          $time y          $intRate %         $totalInterest TK       $totalAmount TK');
  called++;
};
// to generate compound interest from input data
var compoundInterest = (double principle, int time, double intRate){
  double totalInterest = roundDouble(principle * (pow((1 + (intRate/100)), time) - 1), 2);
  double totalAmount = principle + totalInterest;

  if(called <= 5){print('Compound Interest: Principle Amount   Duration   Interest Rate     Total Interest     Total Amount');}
  print('                    $principle TK        $time y           $intRate %         $totalInterest TK      ${roundDouble(totalAmount, 2)} TK');
  called++;
};

void main(){
  calculateInterests( 900000, 5, 12, simpleInterest);
  calculateInterests( 800000, 7, 10, simpleInterest);
  calculateInterests( 500000, 12, 7, simpleInterest);
  calculateInterests( 200000, 6, 15, simpleInterest);
  calculateInterests( 350000, 10, 5, simpleInterest);

  print('');

  calculateInterests( 900000, 5, 12, compoundInterest);
  calculateInterests( 800000, 7, 10, compoundInterest);
  calculateInterests( 500000, 12, 7, compoundInterest);
  calculateInterests( 200000, 6, 15, compoundInterest);
  calculateInterests( 350000, 10, 5, compoundInterest);
}