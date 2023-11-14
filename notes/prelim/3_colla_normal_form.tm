<TeXmacs|2.1.2>

<project|main.tm>

<style|book>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <chapter|Collaborating With Bounded-Rational Partner in Normal-Form Game>

  The purpose of this chapter is to introduce a learning algorithm for the AI
  agent to achieve a suboptimal reward when collaborating with a
  bounded-rational partner in a two-player normal-form game (see Definition
  <reference|def:normal>). We index the AI agent we want to control as player
  <math|1> and the ad hoc partner as player <math|2>. Also, we adopt cost
  functions defined as <math|f<rsub|1>\<triangleq\>-r<rsub|1>> and
  <math|f<rsub|2>\<triangleq\>-r<rsub|2>> instead of reward functions to
  match the notation used in bilevel optimization.\ 

  <\definition>
    \;

    <\equation*>
      <around*|(|2,A<rsub|joint>,r<rsub|joint>|)>
    </equation*>
  </definition>

  <section|Modeling Bounded-Rational Partner>

  For clarity, we denote <math|x> as the leader's action and <math|y> as the
  follower's action. Also, we consider continuous action spaces for both
  players, more specifically, <math|x\<in\>\<bbb-R\><rsup|n>> and
  <math|y\<in\>\<bbb-R\><rsup|m>>. Thus, the normal-form game is defined as
  <math|<around*|(|2,\<bbb-R\><rsup|n>\<times\>\<bbb-R\><rsup|m>,<around*|(|-f<rsub|1>,-f<rsub|2>|)>|)>>.\ 

  <\ass>
    <em|(Unique Best Response)> The best response of the follower is unique,
    i.e., the solution of

    <\equation*>
      <below|min|x\<in\>\<bbb-R\><rsup|n>>.
      <space|1em>f<rsub|2><around*|(|x,y|)>
    </equation*>

    is unique.
  </ass>

  We denote <math|D<rsub|j> f<rsub|i> (\<cdot\>,\<cdot\>)> as the derivative
  mapping of <math|f<rsub|i>> on the <math|j>-th argument, where <math|i =
  1,2> and <math|j = 1,2>. The derivative mapping of the best response
  <math|r> is denoted as <math|D r>. The optimal solution of
  <eqref|eq:bilevel> is denoted as <math|x<rsup|\<ast\>>> and the optimal
  value is denoted as <math|f<rsup|\<ast\>>>.\ 

  A same-interest, fully-rational partner must satisfy:

  <\itemize>
    <item><math|f<rsub|1>=f<rsub|2>> (same-interest).

    <item>The follower always takes the best response of the leader's action
    (fully-rational).
  </itemize>

  The goal of the leader is to minimize her cost <math|f> assuming that the
  follower will take the best response. <with|color|red|YL: add some comments
  on here: why the goal of the leader assuming fully-rational while the true
  follower is not.> Mathematically, the leader attempts to solve the
  following bilevel optimization problem:

  <\equation>
    min<rsub|x\<in\>\<bbb-R\><rsup|n>>. <space|1em>f<around*|(|x|)>\<triangleq\>f<rsub|1><around*|(|x,r<around*|(|x|)>|)><label|eq:bilevel>i
  </equation>

  where <math|r<around*|(|x|)>=arg min<rsub|y\<in\>\<bbb-R\><rsup|m>>f<rsub|2><around*|(|x,y|)>>
  is the unique best response of the follower. The games the leader assuming
  followers take best responses are also called <em|Stackelberg Games>. The
  formulation of Stackelberg games provides us a structure of the gradient,
  since

  <\equation*>
    \<nabla\>f(x) = D<rsub|1>f<rsub|1>(x, r(x)) + D<rsub|2>f<rsub|1>(x,
    r(x))D r(x).
  </equation*>

  We can further modify the gradient estimation based on the true response
  that the follower takes. Before introducing the method to estimate
  <math|\<nabla\>f<around*|(|x|)>>, we make a restriction on the follower's
  actions:

  <\definition>
    A follower's action <math|y> is called an <math|\<varepsilon\>>-inexact
    best response (<math|\<varepsilon\>>-IBR) to a leader's action <math|x>
    if <math|\<parallel\>y \<minus\> r(x)\<parallel\> \<leq\>
    \<varepsilon\>>.
  </definition>

  If the follower uses gradient descent to compute an <math|\<varepsilon\>>-
  IBR when the leader's action <math|x> is fixed, i.e., <math|y<rsub|t+1 >=
  y<rsub|t> \<minus\> \<beta\>D<rsub|2>f<rsub|2>(x,y<rsub|t>)>, where
  <math|\<beta\>> is a stepsize, then condition <math|\<parallel\>y<rsub|t
  >\<minus\> r(x)\<parallel\> \<less\> \<varepsilon\>> can be verified by the
  quantity <math|\<parallel\>y<rsub|t> \<minus\> y<rsub|t-1>\<parallel\>> if
  <math|f<rsub|2>(x,\<cdot\>)> is strongly convex for any <math|y>.

  We choose to avoid defining the inexact best response as a function
  <math|y: \<bbb-R\><rsup|n> \<rightarrow\> \<bbb-R\><rsup|m>> such that for
  some constant <math|\<varepsilon\> \<gtr\> 0>, the function <math|y>
  satisfies <math|\<parallel\>y(x) \<minus\> r(x)\<parallel\>\<leq\>
  \<varepsilon\>> for any <math|x>. For tasks in HRI, this would imply that
  the human's actions follow a function of the robot's actions. In other
  words, each robot's action would correspond to a specific and deterministic
  action of the human, thus imposing a strong assumption on the human's
  behavior.

  <\theorem>
    \;

    <\equation*>
      <below|lim sup|k\<rightarrow\>\<infty\>><space|1em>f<around*|(|x<rsub|k>|)>-f<rsup|\<ast\>>\<leq\>\<cdots\>\<leq\>
    </equation*>

    -
  </theorem>

  <section|Gradient of the bounded>

  Our gradient-based algorithm is given by

  <\equation>
    x<rsup|k+1>=x<rsup|k> \<minus\>\<alpha\>g<rsub|x<rsup|k>>,<label|eq:grad-desc>
  </equation>

  where<math| k = 1, 2, . . .> is the index of iteration. The stepsize
  <math|\<alpha\>> is a fixed constant that should be chosen small enough;

  The term <math|g<rsub|x<rsup|k>>> is an inexact gradient at
  <math|x<rsup|k>>. From the decomposition of the exact gradient mapping, an
  estimation <math|g<rsup|x>> is given by

  <\equation*>
    g<rsub|x> =D<rsub|1>f<rsub|1>(x,y)+D<wide|\<psi\>|^><rsub|x>,
  </equation*>

  where <math|D<rsub|1>f<rsub|1><around*|(|x,y|)>> approximates
  <math|D<rsub|1>f<rsub|1><around*|(|x,r<around*|(|x|)>|)>>, and
  <math|D<wide|\<psi\>|^><rsub|x>> approximates
  <math|D<rsub|2>f<rsub|1><around*|(|x,r<around*|(|x|)>|)>D
  r<around*|(|x|)>>.

  <section|>

  <\ass>
    <em|(Bounded Sensitivity)>. There exists a constant
    <math|\<kappa\>\<gtr\>0> \ such that <math|\<parallel\>D<rsub|2>f<rsub|1>(x,
    r(x))\<parallel\> \<leq\> \<kappa\>\<parallel\>\<nabla\>f(x)\<parallel\>>
    for any <math|x>.
  </ass>

  \;
</body>

<\initial>
  <\collection>
    <associate|chapter-nr|2>
    <associate|page-first|11>
    <associate|page-medium|paper>
    <associate|section-nr|3>
    <associate|subsection-nr|0>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|3|11>>
    <associate|auto-2|<tuple|3.1|11>>
    <associate|auto-3|<tuple|3.2|12>>
    <associate|auto-4|<tuple|3.3|12>>
    <associate|eq:bilevel|<tuple|3.1|11>>
    <associate|eq:grad-desc|<tuple|3.2|12>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Collaborating
      With Bounded-Rational Partner in Normal-Form Game>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      3.1<space|2spc>Modeling Bounded-Rational Partner
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>

      3.2<space|2spc>Gradient of the bounded
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>

      3.3<space|2spc> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>
    </associate>
  </collection>
</auxiliary>