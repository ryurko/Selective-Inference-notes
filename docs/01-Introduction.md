---
output:
  html_document: default
  pdf_document: default
---
# Introduction

## What is Multiple Testing

In various scientific applications we wish to test several hypotheses of interest
simultaneously or sequentially^[We'll come back to sequential testing later].
The popular example is Genome Wide Association Studies which focus on (amongst 
other things) the association of several genes with a known disease type.

This leads to the reproducibility crisis in science. Too many 
false discoveries published in papers due to not adjusting Type I 
error control for multiple tests.

\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Remark. </em></span>  \fi{}Is this is the only reason for the reproducibility crisis? Or is there
more to it i.e. not releasing data and code publicly for 
research publications? Check with Ron.</div>\EndKnitrBlock{remark}

## $\text{FWER}$ Control methods

### Bonferroni Correction - $\text{FWER}$ under dependence

Suppose we have that the tests i.e. the p-values are dependent. We can then
use the Bonferroni correction for each p-value

\BeginKnitrBlock{theorem}\iffalse{-91-66-111-110-102-101-114-114-111-110-105-32-67-111-114-114-101-99-116-105-111-110-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-2"><strong>(\#thm:unnamed-chunk-2)  \iffalse (Bonferroni Correction) \fi{} </strong></span>For $d$ tests, reject any test if the p-value is smaller than $\frac{\alpha}{d}$.</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}$$\begin{align*}
\text{FWER} &= \mathbb{P}\left(\cup_{i = 1}^{d} \text{Falsely reject } H_{0, i} \right) \\
&\le \sum_{i = 1}^{d} \mathbb{P}\left(\text{Falsely reject } H_{0, i}\right) \\
&\le \sum_{i = 1}^{d} \frac{\alpha}{d} \\
&= d \left(\frac{\alpha}{d} \right) \\
&= \alpha
\end{align*}$$
as required.</div>\EndKnitrBlock{proof}


\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Remark. </em></span>  \fi{}This works under any form of dependence of the tests i.e. p-values since
the proof uses Union Bound. This may be quite crude a threshold as a result.</div>\EndKnitrBlock{remark}

### Sidak Correction - $\text{FWER}$ under independence

Suppose we have that the tests i.e. the p-values are now __independent__. We we can then use the Sidak correction to set the p-value threshold to control
the $\text{FWER}$ at level $\alpha$.

\BeginKnitrBlock{theorem}\iffalse{-91-83-105-100-97-107-32-67-111-114-114-101-99-116-105-111-110-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-5"><strong>(\#thm:unnamed-chunk-5)  \iffalse (Sidak Correction) \fi{} </strong></span>For $d$ tests, reject any test if the p-value is smaller than $\frac{\alpha}{d}$.</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}$$\begin{align*}
\text{FWER} &= \mathbb{P}\left(\cup_{i = 1}^{d} \text{Falsely reject } H_{0, i} \right) \\
&= 1 - \mathbb{P}\left(\cap_{i = 1}^{d} \{\text{Falsely reject } H_{0, i}\}^{c} \right) \\
&= 1 - \prod_{i=1}^{d}{\mathbb{P}\left(\{\text{Falsely reject } H_{0, i}\}^{c} \right)} \\
&= 1 - \prod_{i=1}^{d}(1 - \mathbb{P}\left(\text{Falsely reject } H_{0, i} \right)) \\
&= 1 - \prod_{i=1}^{d}(1 - (1 - (1 - \alpha)^{\frac{1}{d}})) \\
&= 1 - \prod_{i=1}^{d}(1 - \alpha)^{\frac{1}{d}} \\
&= 1 - (1 - \alpha) \\
&= \alpha
\end{align*}$$
as required.</div>\EndKnitrBlock{proof}


\BeginKnitrBlock{remark}<div class="remark">\iffalse{} <span class="remark"><em>Remark. </em></span>  \fi{}This procedure specifically requires independence of the tests i.e. p-values since. The gain from the indepedence strucuture here results in a more powerful test than Bonferroni (prove this!).</div>\EndKnitrBlock{remark}

### Holm's Procedure - Improving on Bonferroni

## Correcting for Multiple Testing

There are several ways to correct for false discovery in the case of
multiple testing procedures. Once again in the spirit of the Neyman Pearson
framework we want to ensure that we first control for the Type I error i.e.
the probability of False Discovery. Specifically in single hypothesis testing
we want to ensure that 

One way is to control the Familywise Error Rate i.e. $\text{FWER}$. This is the probability of making atleast one false
discovery (i.e. rejecting the null when the null is true) amongst all tested
hypotheses. This is a quite conservative approach to FD control.




## Relationships between $\text{FDR}$ and $\text{FWER}$

We note the following 2 key theorems which link $\text{FDR}$ and $\text{FWER}$.

\BeginKnitrBlock{theorem}\iffalse{-91-70-68-82-32-61-32-70-87-69-82-32-117-110-100-101-114-32-71-108-111-98-97-108-32-78-117-108-108-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-8"><strong>(\#thm:unnamed-chunk-8)  \iffalse (FDR = FWER under Global Null) \fi{} </strong></span>Under the Global Null we have that FDR control is equivalent to FWER control</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Under the global null ^[i.e. all null hypotheses are assumed to be true] we have
that all rejections are false rejections i.e. $V = R$. We first consider two 
cases namely that there are no false rejections $V = 0$ and 
secondly if there are any false rejections at all i.e. $V \ge 1$.

When $V = 0$ then we have that $\text{FDP} = 0$ else if $V \ge 1$ we have 
that $\text{FDP} = 1$.

So we have that:
    
$$\begin{align}\text{FDR} = \mathbb{E}\left(\text{FDP} \right) 
                          &= (0) \times \mathbb{P}(V = 0) + 
                             (1) \times \mathbb{P}(V \ge 1) \\
&= \mathbb{P}(V \ge 1) \\
&= \text{FWER}
\end{align}$$
as required.    </div>\EndKnitrBlock{proof}

This now brings us to the following important theorem^[In other words 
$\text{FWER}$ control is a more conservative method of controlling False 
Discovery in multiple testing than $\text{FDR}$ control.]:

\BeginKnitrBlock{theorem}\iffalse{-91-70-87-69-82-32-99-111-110-116-114-111-108-32-97-108-119-97-121-115-32-105-109-112-108-105-101-115-32-70-68-82-32-99-111-110-116-114-111-108-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-10"><strong>(\#thm:unnamed-chunk-10)  \iffalse (FWER control always implies FDR control) \fi{} </strong></span>We always have that $\text{FWER}$ control implies $\text{FDR}$
control.</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}We begin with the simple observation that $FDP = \frac{V}{R} \mathbb{I}(R > 0)$.
So we always have $FDP \le 1$ and more specifically we have that $FDP \le \mathbb{I}(V > 0)$.
Since if $V = 0 \implies FDP = 0 \le 1$ and $V \ge 1 \implies FDP = \frac{V}{R} \le 1$.

Taking expectations we have that:
    
$$\begin{align*}\text{FDR} = \mathbb{E}\left(\text{FDP} \right) &\le 
                             \mathbb{E}\left(\mathbb{I}(V > 0) \right) \\
                            &= \mathbb{P}(V \ge 1) \\                                                            
                            &= \text{FWER}
\end{align*}$$
as required.    </div>\EndKnitrBlock{proof}
