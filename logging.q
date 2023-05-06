//Logging Script

\d .log

.log.out: {-1 x};
.log.err: {-2 x};

.z.po:{.log.out[raze[("Connection opened! \nUsername:\n",string[.z.u],"\nMemory details:\n",string[.Q.s[.Q.w[]]])]]};

.z.pc:{if[x<>0;.u.del[;x]each .u.t;.log.out[raze[("Connection closed!\n",string[x]," \nUsername:\n",string[.z.u],"\nMemory details:\n",string[.Q.s[.Q.w[]]])]]]};
