/q tick/r.q localhost:5011
/2008.09.09 .k ->.q
h:neg hopen hsym `$(raze[("localhost:",getenv[`tpPort])])

system raze["l ",getenv[`advancedKDB],"/logging.q"]

if[not "w"=first string .z.o;system "sleep 1"];

upd:insert;

/ get the ticker plant and history ports, defaults are 5010,5012
.u.x:.z.x,(count .z.x)_(":5010";":5012");

/ init schema and sync up from log file;cd to hdb(so client save can run)
.u.rep:{(.[;();:;].)each x;if[null first y;:()];};
/.u.rep:{(.[;();:;].)each x};
/ HARDCODE \cd if other than logdir/db

/ connect to ticker plant for (schema;(logcount;log))
.u.rep .(hopen `$":",.u.x 0)"((.u.sub[`trade;`];.u.sub[`quote;`]);`.u `i`L)";

.z.ts:{aggList:`time xcols 0!(select time:.z.N ,maxPrice:max price,minPrice:min price,volume:sum size by sym from trade) uj select maxBid:max bid,minAsk:min ask by sym from quote;@[h;(".u.upd";`aggregation;value flip aggList);h"::"]}

/.z.ts:{
/aggList:0!(select time:.z.N,maxPrice:max price, minPrice:min price, volume: sum size by sym from trade) lj (select maxBid:max bid, minAsk:min ask by sym from quote);
/0N!aggList;
/h(insert;`aggregation;value flip aggList));
/}

\t 2000
