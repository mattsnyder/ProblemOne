ProblemOne
==========
Write a program using regular expressions to parse a file where each line is of the following format:

$4.99 TXT MESSAGING - 250 09/29 - 10/28 4.99

For each line in the input file, the program should output three pieces of information parsed from the line  in the following JSON format.

{
  "feature" : "TXT MESSAGING - 250",
  "date_range" : "09/29 - 10/28",
  "price" : 4.99
}


Solution
========
Execute the rake task problem_one:convert_bill_to_json and pass it the path to a file. For example:

rake problem_one:convert_bill_to_json[./sample_bill.txt]

All features in the file are grouped into an array in the output.

And yes the regexp could be compacted further, however I left it expanded for readability, which is typically the case when I use regexp. I've found it to be better when working in a team environment.