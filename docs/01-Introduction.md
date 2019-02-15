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

## Relationships between $\text{FDR}$ and $\text{FWER}$

We note the following 2 key theorems which link $\text{FDR}$ and $\text{FWER}$.

\BeginKnitrBlock{theorem}\iffalse{-91-70-68-82-32-61-32-70-87-69-82-32-117-110-100-101-114-32-71-108-111-98-97-108-32-78-117-108-108-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-1"><strong>(\#thm:unnamed-chunk-1)  \iffalse (FDR = FWER under Global Null) \fi{} </strong></span>Under the Global Null we have that FDR control is equivalent to FWER control</div>\EndKnitrBlock{theorem}

\BeginKnitrBlock{proof}<div class="proof">\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Under the global null ^[i.e. all null hypotheses are assumed to be true] we have
that all rejections are false rejections i.e. $V = R$. We first consider two 
cases namely that there are no false rejections $V = 0$ and 
secondly if there are any false rejections at all i.e. $V \ge 1$.

When $V = 0$ then we have that $\text{FDP} = 0$ else if $V \ge 1$ we have 
that $\text{FDP} = 1$.

So we have that:
    
$$\begin{align}\text{FDR} = \mathbb{E}\left(\text{FDP} \right) &= (0) \times 
                            \mathbb{P}(V = 0) + (1) \times \mathbb{P}(V \ge 1) \\
&= \mathbb{P}(V \ge 1) \\
&= \text{FWER}
\end{align}$$
as required.    </div>\EndKnitrBlock{proof}

This now brings us to the following important theorem^[In other words 
$\text{FWER}$ control is a more conservative method of controlling False 
Discovery in multiple testing than $\text{FDR}$ control.]:

\BeginKnitrBlock{theorem}\iffalse{-91-70-87-69-82-32-99-111-110-116-114-111-108-32-97-108-119-97-121-115-32-105-109-112-108-105-101-115-32-70-68-82-32-99-111-110-116-114-111-108-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:unnamed-chunk-3"><strong>(\#thm:unnamed-chunk-3)  \iffalse (FWER control always implies FDR control) \fi{} </strong></span>We always have that $\text{FWER}$ control implies $\text{FDR}$
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
