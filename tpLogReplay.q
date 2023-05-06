b:.z.x;
c:get hsym first `$b;
d:c@ where c[;1]=`trade;
e:d[where any  each d[;2;1]=`IBM.N];

indexes:where each `IBM.N=e[;2;1];
updates:e[;2];

IBMupdates:({(flip x[z;]) y[z]}[updates;indexes;] each til count indexes);
e[;2]:IBMupdates;
ibm:e

(hsym `$(raze[b,"IBM"])) set ibm
0N!raze[b,"IBM"," has been created"];
exit 0
