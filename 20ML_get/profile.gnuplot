reset
outfile='profiles20MLget'


set xlabel "s [$nm$]"
set ylabel "H\\\"ohe [$nm$]"

set size 1,0.6

set term epslatex standalone color 8
set out sprintf('%s.tex',outfile)

plot 	'm3_ori-profile1.txt' using ($1*1E9):($2*1E9) with lines title "Profil 1", \
	'm3_ori-profile2.txt' using ($1*1E9):($2*1E9) with lines title "Profil 2", \
	'm3_ori-profile3.txt' using ($1*1E9):($2*1E9) with lines title "Profil 3"

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