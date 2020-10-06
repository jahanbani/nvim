" better define snippets for these commands
augroup latexcommands
    autocmd!
    autocmd FileType tex call s:texmappings()
    autocmd FileType bib call s:bibmappings()
augroup END
if !exists('*s:texmappings')
    function! s:texmappings()
        set spell!
        set spelllang=en
        set dict+=$HOME\AppData\Local\nvim\words.txt
        
        " temporary bindings for editing papers
        " inoremap ;f \ali{}<Space><Esc>ba
        " nnoremap ;af :normal saiw{bi\ali<Esc>
        " doesn't work
        " xnoremap ;af :normal saiw{bi\ali<Esc> 
        " nnoremap ;s :normal saiw{bi\sout<Esc>ww
        " xnoremap ;s :normal saiw{bi\sout<Esc>
        " end of temporary bindings for editing papers
        
    " starting documents
        inoremap ;dc \documentclass{}<Enter><++><Esc>k$i
        inoremap ;bd \begin{document}<Enter><Enter>\end{document}<Esc>ki
        inoremap ;up \usepackage{}<Esc>i
        inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter>\framesubtitle{}<Enter><++><Enter>\end{frame}<Enter><++><Esc>4kf}i

    "text modification commands
        inoremap ;em \emph{}<Space><++><Esc>T{i
        inoremap ;bf \textbf{}<Space><++><Esc>T{i
        inoremap ;it \textit{}<Space><++><Esc>T{i
        inoremap ;ct \citet{}<Space><++><Esc>T{i
        inoremap ;rf \ref{}<Space><++><Esc>T{i
        inoremap ;t \begin{table}<Enter>\centering<Enter>\begin{tabular}<Enter><+rows here+><Enter>\end{tabular}<Enter>\caption{<+caption+>}<Enter>\label{<+label+>}<Enter>\end{table}<Enter><Enter><+coninue+><Esc>7kA{}<Esc>i
        inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
        inoremap ;sc \textsc{}<Space><++><Esc>T{i
        inoremap ;ttt \texttt{}<Space><++><Esc>T{i
        inoremap ;l \label{}<Esc>i
        inoremap ;q \(<++>\)<++><Esc>b
        inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
        inoremap ;tq \quad
        inoremap ;tt \text{<++>} <++><Esc>gg/<++><Enter>"_c4l
        inoremap ;te \textbf{<++>} <++><Esc>gg/<++><Enter>"_c4l
        inoremap ;ti \textit{<++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tu \underline{<++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ts {\small <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tt {\tiny <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tl {\large <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;th {\huge <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tL {\Large <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tH {\Huge <++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;tn \newline <Esc>o

    " equations
        " IEEE equation array
        inoremap ;ie \begin{IEEEeqnarray}{lCr}<Enter><++>\label{eq:<++>}<Enter>\end{IEEEeqnarray}<Esc>kk/<++><Enter>"_c4l
        " in line
        inoremap ;ma $<++>$ <++><Esc>bb/<++><Enter>"_c4l

    " memoir document 
        inoremap ;mem \documentclass{memoir}<CR>\usepackage{tikz}<CR>\begin{document}<CR><CR>\end{document}<Esc>k

    " fast navigation in latex file <++>
        inoremap <Space>] <Esc>/<+.*+><Enter>ca<
        noremap  <Space>] <Esc>/<+.*+><Enter>ca<
        inoremap ;fg \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\linewidth]{<++>}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>4k/<++><Enter>"_c4l

    " list commands
        inoremap ;lb \begin{itemize}<Enter>\item <++><Enter>\end{itemize}<Enter><++><Esc>3k/<++><Enter>"_c4l
        inoremap ;le \begin{enumerate}<Enter>\item <++><Enter>\end{enumerate}<Enter><++><Esc>3k/<++><Enter>"_c4l
        inoremap ;ls \begin{itemize}[label={}]<Enter>\item <++><Enter>\end{itemize}<Enter><++><Esc>3k/<++><Enter>"_c4l
        inoremap ;li <Enter>\item 

    "equation
        " inoremap ;en \begin{equation}<Enter><++><Enter>\end{equation}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;el \begin{equation}<Enter>\label{eq:<++>}<Enter><++><Enter>\end{equation}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ec \begin{figure}[H]<Enter>\begin{equation}<Enter>\label{eq:<++>}<Enter><++><Enter>\end{equation}<Enter>\caption*{<++>}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ed \begin{figure}[H]<Enter>\begin{equation}<Enter>\label{eq:<++>}<Enter><++><Enter>\end{equation}<Enter>\caption*{<++>}<Enter>\emph{where:}<Enter>\begin{itemize}[label={}]<Enter>\item <++><Enter>\end{itemize}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;es \begin{equation*}<Enter><++><Enter>\end{equation*}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;an \begin{align}<Enter><++> &= <++><Enter>\end{align}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;al \begin{align}<Enter>\label{eq:<++>}<Enter><++> &= <++><Enter>\end{align}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ac \begin{figure}[H]<Enter>\begin{align}<Enter>\label{eq:<++>}<Enter><++> &= <++><Enter>\end{align}<Enter>\caption*{<++>}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ad \begin{figure}[H]<Enter>\begin{align}<Enter>\label{eq:<++>}<Enter><++> &= <++><Enter>\end{align}<Enter>\caption*{<++>}<Enter>\emph{where:}<Enter>\begin{itemize}[label={}]<Enter>\item <++><Enter>\end{itemize}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;as \begin{align*}<Enter><++> &= <++><Enter>\end{align*}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;st \begin{split}<Enter><++> &= <++><Enter>\end{split}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;eu \\<Enter><++> &= <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;er _{<++>} <++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;ef ^{<++>} <++><Esc>gg/<++><Enter>"_c4l
    "Full equation definition
        " inoremap ;aa \subsubsection{<++>}<Enter>\begin{figure}[H]<Enter>\begin{align*}<Enter><++> &= <++><Enter>\end{align*}<Enter>\emph{where:}<Enter>\begin{table}[H]<Enter>\begin{tabular}{l l l}<Enter>$<++>$ &=& <++> \\ <++><Enter>$<++>$ &=& <++> \\<++><Enter>\end{tabular}<Enter>\end{table}\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;au <Esc>o$<++>$ &=& <++> \\ <++><Esc>gg/<++><Enter>"_c4l

    "sectioning
        inoremap ;sj \section{<++>}<Enter><++><Esc>2k/<++><Enter>"_c4l
        inoremap ;sk \subsection{<++>}<Enter><++><Esc>2k/<++><Enter>"_c4l
        inoremap ;sm \subsubsection{<++>}<Enter><++><Esc>2k/<++><Enter>"_c4l
    "tables
        inoremap ;2t \begin{table}[H]<Enter>\centering<Enter>\begin{tabular}{l l}<Enter>\midrule<Enter><++> & <++> \\<Enter>\midrule<Enter><++> & <++> \\<Enter>\midrule<Enter>\end{tabular}<Enter>\caption{<++>}<Enter>\label{tab:<++>}<Enter>\end{table}<Enter><++><Esc>12k/<++><Enter>"_c4l
        inoremap ;2n <Esc>o<++> & <++> \\<Esc>3k/<++><Enter>"_c4l
        inoremap ;3t \begin{table}[H]<Enter>\centering<Enter>\begin{tabular}{l l l}<Enter>\midrule<Enter><++> & <++> & <++> \\<Enter>\midrule<Enter><++> & <++> & <++> \\<Enter>\midrule<Enter>\end{tabular}<Enter><\caption{<++>}<Enter>\label{tab:<++>}<Enter>\end{table}<Enter><++><Esc>12k/<++><Enter>"_c4l
        inoremap ;3n <Esc>o<++> & <++> & <++> \\<Esc>3k/<++><Enter>"_c4l
        inoremap ;4t \begin{table}[H]<Enter>\centering<Enter>\begin{tabular}{l l l l}<Enter>\midrule<Enter><++> & <++> & <++> & <++> \\<Enter>\midrule<Enter><++> & <++> & <++> & <++> \\<Enter>\midrule<Enter>\end{tabular}<Enter><\caption{<++>}<Enter>\label{tab:<++>}<Enter>\end{table}<Enter><++><Esc>12k/<++><Enter>"_c4l
        inoremap ;4n <Esc>o<++> & <++> & <++> &<++> \\<Esc>3k/<++><Enter>"_c4l
        inoremap ;5t \begin{table}[H]<Enter>\centering<Enter>\begin{tabular}{l l l l l}<Enter>\midrule<Enter><++> & <++> & <++> & <++> & <++> \\<Enter>\midrule<Enter><++> & <++> & <++> & <++> & <++> \\<Enter>\midrule<Enter>\end{tabular}<Enter><\caption{<++>}<Enter>\label{tab:<++>}<Enter>\end{table}<Enter><++><Esc>12k/<++><Enter>"_c4l
        inoremap ;5n <Esc>o<++> & <++> & <++> &<++> & <++> \\<Esc>3k/<++><Enter>"_c4l
        inoremap ;6t \begin{table}[H]<Enter>\centering<Enter>\begin{tabular}{l l l l l l}<Enter>\midrule<Enter><++> & <++> & <++> & <++> & <++> & <++> \\<Enter>\midrule<Enter><++> & <++> & <++> & <++> & <++> & <++> \\<Enter>\midrule<Enter>\end{tabular}<Enter><\caption{<++>}<Enter>\label{tab:<++>}<Enter>\end{table}<Enter><++><Esc>12k/<++><Enter>"_c4l
        inoremap ;6n <Esc>o<++> & <++> & <++> & <++> &<++> & <++> \\<Esc>3k/<++><Enter>"_c4l
    "formulas
        inoremap ;ff \frac{<++>}{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fi \int_{<++>}^{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fe e^{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fs \sum_{<++>}^{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fa <Enter>\left\{\begin{array}{ll}<Enter><++> , & \quad <++> \\<Enter>\end{array}\right.<Esc>k/<++><Enter>"_c4l
        inoremap ;fp <Esc>$o<++> , & \quad <++> \\<Esc>k/<++><Enter>"_c4l
        inoremap ;sq \sqrt{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fb \bar{<++>} <++><Esc>k/<++><Enter>"_c4l
        inoremap ;fl \lim_{<++>} <++><Esc>k/<++><Enter>"_c4l
    "greek letters
        inoremap ;ga \alpha
        inoremap ;gb \beta
        inoremap ;gg \gamma
        inoremap ;gG \Gamma
        inoremap ;gd \delta
        inoremap ;gD \Delta
        inoremap ;ge \epsilon
        inoremap ;gn \eta
        inoremap ;gl \lambda
        inoremap ;gm \mu
        inoremap ;gp \pi
        inoremap ;gr \rho
        inoremap ;gs \sigma
        inoremap ;gt \tau
        inoremap ;gx \chi
        inoremap ;gw \omega
        inoremap ;gO \Omega
        inoremap ;go \theta
        inoremap ;gz \zeta
    "symbols
        inoremap ;si \infty
        inoremap ;sp \partial
        inoremap ;sal \leftarrow
        inoremap ;sar \rightarrow
        inoremap ;sl \leq
        inoremap ;sg \geq
        inoremap ;se \equiv
        inoremap ;sn \neq
        inoremap ;sap \approx
        inoremap ;sd ^{\circ}
    "code
        " inoremap ;cn \begin{figure}[H]<Enter>\lstset{frame=L,basicstyle={\small\ttfamily},numbers=left,tabsize=1,breaklines=true,showstringspaces=false}<Enter>\begin{lstlisting}<Enter><++><Enter>\end{lstlisting}<Enter>\label{cd:<++>}<Enter><++>%\caption{<++>}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;cb \lstset{frame=N,basicstyle={\small\ttfamily},numbers=none,tabsize=1,breaklines=true,showstringspaces=false}<Enter>\begin{lstlisting}<Enter><++><Enter>\end{lstlisting}<Enter><++><Esc>gg/<++><Enter>"_c4l
    "figures
        " inoremap ;bfe \begin{figure}[H]<Enter>\centering<Enter>\captionsetup{justification=centering}<Enter>\includegraphics[width=<++>\linewidth]{<++>}<Enter><\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        " inoremap ;bfn \begin{figure}[H]<Enter>\centering<Enter>\captionsetup{justification=centering}<Enter><++><Enter><\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
    "minipages
        inoremap ;2em \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.5\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.5\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;3em \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.33\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.33\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.33\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;4em \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.25\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.25\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.25\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.25\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;2sm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.48\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.04\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.48\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;3sm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.31\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.03\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.31\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.03\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.31\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;4sm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{0.22\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.04\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.22\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.04\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.22\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{0.04\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{0.22\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;2cm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;3cm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
        inoremap ;4cm \begin{figure}[H]<Enter>\centering<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\hfill<Enter>\end{minipage}%<Enter>\begin{minipage}{<++>\textwidth}<Enter>\centering<Enter><++><Enter>\end{minipage}<Enter>\end{figure}<Enter><++><Esc>gg/<++><Enter>"_c4l
    "columns
        " inoremap ;mc \begin{multicols}{<++>}<Enter><++><Enter>\end{multicols}<Esc>gg/<++><Enter>"_c4l
    "referencing
        inoremap ;re \eqref{eq:<++>} <++><Esc>gg/<++><Enter>"_c4l
        inoremap ;rt \ref{<++>} <++><Esc>gg/<++><Enter>"_c4l
        inoremap ;rr \cite{<++>} <++><Esc>gg/<++><Enter>"_c4l
    endfunction
endif
if !exists('*s:bibmapping')
    function! s:bibmappings()
        set dict+=$HOME\AppData\Local\nvim\words\words.txt
        inoremap ;a @article{,<Esc>mma<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>}, <Enter>journal<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>month<Space>=<Space>{<++>},<Enter>note<Space>=<Space>{<++>},<Enter>}<Enter>(++)<Esc>`mi
        inoremap ;b @book{,<Esc>mma<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>}, <Enter>publisher<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>series<Space>=<Space>{<++>},<Enter>address<Space>=<Space>{<++>},<Enter>edition<Space>=<Space>{<++>},<Enter>month<Space>=<Space>{<++>},<Enter>note<Space>=<Space>{<++>},<Enter>}<Enter>(++)<Esc>`mi
        inoremap ;c @conference{,<Esc>mma<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>}, <Enter>booktitle<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>number<Space>=<Space>{<++>},<Enter>series<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>address<Space>=<Space>{<++>},<Enter>month<Space>=<Space>{<++>},<Enter>organization<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>note<Space>=<Space>{<++>},<Enter>}<Enter>(++)<Esc>`mi
    endfunction
endif
