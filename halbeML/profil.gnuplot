reset
outfile='profilhalbeML'


set xlabel "s [$nm$]"
set ylabel "H\\\"ohe [$nm$]"


set size 1,0.5

set term epslatex standalone color 8
set out sprintf('%s.tex',outfile)

plot 	'profil.txt' using ($1*1E9):($2*1E9) with lines title "Profil"

unset out
system sprintf('latex "%s.tex"',outfile)
system sprintf('dvips -o "%s.ps" "%s.dvi"',outfile,outfile)
system sprintf('ps2pdf "%s.ps"',outfile)

system sprintf('rm %s.log',outfile)
system sprintf('rm %s.aux',outfile)
system sprintf('rm %s.ps',outfile)
system sprintf('rm %s.dvi',outfile)
system sprintf('rm %s.tex',outfile)
system sprintf('rm %s-inc.eps',outfile)