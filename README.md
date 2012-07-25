ProblemOne
==========
Write a program using regular expressions to parse a file where each line is of the following format:

$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99

For each line in the input file, the program should output three pieces of information parsed from the line  in the following JSON format.

{
  "feature" : "TXT MESSAGING - 250",
  "date_brange" : "09/29 - 10/28",
  "price" : 4.99
}