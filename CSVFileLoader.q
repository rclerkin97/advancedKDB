table:.z.x 0
fp:.z.x 1
port:.z.x 2

/("NSJJ";enlist csv) 0: read0 hsym `$fp

//Choose which table to be loaded into
$[(`$table)=`trade;trade:("NSFF";enlist ",") 0: read0 hsym `$fp;trade:"notset"];
$[(`$table)=`quote;quote:("NSFFIF";enlist ",") 0: read0 hsym `$fp;quote:"notset"];

//Connect to process
h::hopen `$raze[(":localhost:",port)]

//Update the chosen table
if[(`$table)=`trade;h(`.u.upd;`trade;value flip trade)];
if[(`$table)=`quote;h(`.u.upd;`quote;value flip quote)];

0N!"CSV records have been added to the TP, Exiting the script";

//Exit once completed
exit 0
