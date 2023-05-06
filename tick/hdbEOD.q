// load schema
\l sym.q

// define upd
upd:insert

//get log file
lf:first hsym `$(.z.x)

// replay log file
-11!lf;

//get date in question
date:value (-10#string[lf])

// save
a:.Q.hdpf[`.;`:hdb;date;`sym] each tables`.

//get hdb dir
hdbdir:`$raze[(system"pwd"),"/hdb"];

//get things to compress
c:splay:` sv/:' ((hsym hdbdir),'(`$string[date]),/:a),/:' ((cols each a) except\:`time`sym)

//compress those things
{-19!(x;x;17;2;6)} each/: c

//message
0N!"The HDB has been created";

//job done
exit 0
