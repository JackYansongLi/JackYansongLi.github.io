<TeXmacs|2.1.2>

<project|main.tm>

<style|<tuple|book|algorithm-2e>>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Collaborating With Unknown Agent Using Reinforcement
  Learning>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<author-email|yli340@uic.edu>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  <include|0_abs.tm>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Abstract>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1<space|2spc>Introduction>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2<space|2spc>Collaborating
    With Unknown Agents: Mathematical Formulation>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3><vspace|0.5fn>

    2.1<space|2spc>Ad Hoc Teamworks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-4>

    2.2<space|2spc>Game Theoretical Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5>

    2.3<space|2spc>Markov Decision Process Formulation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3<space|2spc>Collaborating
    With Bounded-Rational Partner in Normal-Form Game>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-7><vspace|0.5fn>

    3.1<space|2spc>Modeling Bounded-Rational Partner
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4<space|2spc>Collaborating
    With Fixed Partners in Markov Decision Process>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>
  </table-of-contents>

  <include|1_intro.tm>

  <include|2_math_form.tm>

  <include|3_colla_normal_form.tm>

  <include|4_colla_mdp_fixed.tm>

  <\bibliography|bib|tm-plain|GC_L4DC>
    <\bib-list|0>
      \;
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|project-flag|true>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|5|0_abs.tm>>
    <associate|auto-10|<tuple|<with|mode|<quote|math>|\<bullet\>>|17>>
    <associate|auto-2|<tuple|1|9|1_intro.tm>>
    <associate|auto-3|<tuple|2|11|2_math_form.tm>>
    <associate|auto-4|<tuple|2.1|11|2_math_form.tm>>
    <associate|auto-5|<tuple|2.2|11|2_math_form.tm>>
    <associate|auto-6|<tuple|2.3|11|2_math_form.tm>>
    <associate|auto-7|<tuple|3|13|3_colla_normal_form.tm>>
    <associate|auto-8|<tuple|3.1|13|3_colla_normal_form.tm>>
    <associate|auto-9|<tuple|4|15|4_colla_mdp_fixed.tm>>
    <associate|def:normal|<tuple|2.1|11|2_math_form.tm>>
    <associate|eq:bilevel|<tuple|3.1|13|3_colla_normal_form.tm>>
    <associate|part:0_abs.tm|<tuple|1|5>>
    <associate|part:1_intro.tm|<tuple|1|9>>
    <associate|part:2_math_form.tm|<tuple|1|11>>
    <associate|part:3_colla_normal_form.tm|<tuple|2.5|11>>
    <associate|part:4_colla_mdp_fixed.tm|<tuple|3.1|15>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|parts>
      <tuple|0_abs.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|1_intro.tm|chapter-nr|0|section-nr|0|subsection-nr|0>

      <tuple|2_math_form.tm|chapter-nr|1|section-nr|0|subsection-nr|0>

      <tuple|3_colla_normal_form.tm|chapter-nr|2|section-nr|3|subsection-nr|0>

      <tuple|4_colla_mdp_fixed.tm|chapter-nr|3|section-nr|1|subsection-nr|0>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Abstract>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Collaborating
      With Unknown Agents: Mathematical Formulation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      2.1<space|2spc>Ad Hoc Teamworks <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>

      2.2<space|2spc>Game Theoretical Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>

      2.3<space|2spc>Markov Decision Process Formulation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Collaborating
      With Bounded-Rational Partner in Normal-Form Game>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>

      3.1<space|2spc>Modeling Bounded-Rational Partner
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Collaborating
      With Fixed Partners in Markov Decision Process>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>