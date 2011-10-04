beginfig(1);
  outputformat:="svg";
  outputtemplate:="%j.svg";
  numeric ux, uy;
  ux = 1cm; uy = 1cm;
  draw (0,5uy)--(0,0)--(10ux,0) withcolor red;
  pickup pencircle scaled 1pt;
  for ix=0 upto 98:
    draw (ix*ux / 10, (ix * ux / 10) / (10uy - ix * uy / 10))..((1+ix)*ux / 10, ((1+ix) * ux / 10) / (10uy - (1+ix) * uy / 10))
      withcolor green;
  endfor;
  
  label.bot(btex $x$ axis etex, (8ux,0));
  label.lft(btex $y$ axis etex rotated 90,
      (0,2uy));
  label.lft(
      btex $\displaystyle y={p\over1-p}$ etex,
      (10ux, 4uy));
endfig;
end;
