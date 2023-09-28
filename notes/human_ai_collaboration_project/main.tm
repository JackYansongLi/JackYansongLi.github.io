<TeXmacs|2.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Human-AI Collaboration
  Project>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<author-email|yli340@uic.edu>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  <section|Introduction (revised, please read)>

  Training an AI agent capable of cooperating with various types of humans
  stands as a central challenge in human-AI Interaction (HAI). This problem
  proves to be difficult because different humans can create varied
  environments for the AI agent to navigate. Additionally, the AI agent
  cannot presume rational behavior from humans within the collaboration
  setting <with|color|blue|YL: add citations here>. While a significant
  number of studies in the field of multi-agent reinforcement learning have
  explored centralized settings <cite|zhang_multi-agent_2021><cite|yao_smixlambda_2020><cite|foerster_counterfactual_2017>,
  this approach can present challenges in situations where a central control
  for individual agents is neither practical nor feasible. It's critical to
  acknowledge that a significant body of work also explores decentralized
  settings. However, most of these studies necessitate some form of
  predetermined communication or coordination guidelines to address the
  constraints inherent in centralized frameworks. <with|color|blue|YL: add
  some citations of decentralized MARL here>.

  Consequently, collaborating with unknown humans without predetermined
  communication or coordination guidelines becomes important, giving rise to
  a research area named ad-hoc teamwork <cite|baumeister_survey_2022><cite|albrecht_autonomous_2018><cite|stone_ad_2010>.
  A pivotal subtask within the domain of ad-hoc teamwork is opponent modeling
  <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|barrett_making_2017><cite|xie_learning_2020><cite|he_opponent_2016>,
  a concept that, in the context of Human-AI (HAI) interactions, primarily
  entails modeling human behaviors and policies.

  In this paper, we tackle a problem in the Human-AI (HAI) interaction domain
  where there are two participants: a human agent and an AI agent. The AI
  agent does not know the human agent's policy. However, the AI starts with a
  few initial guesses about the human's possible policies. The main goal of
  the AI is to find the best policy that can collaborate with human. This
  approach as falling within several known frameworks such as latent Markov
  Decision Processes (MDP) <cite|kwon_rl_2021><cite|hallak_contextual_2015><cite|brunskill_sample_2013>
  and multi-task Reinforcement Learning (RL) <cite|liu_pac_2016>
  <cite|taylor_transfer_2009> <cite|brunskill_sample_2013>.

  To model the HAI problem, we use an episodic Markov decision process where
  the transitions and rewards are influenced by the policy that the human
  agent keeps secret. The AI agent begins with a set of initial guesses about
  the human's policy, grouped together in a finite hypothesis set
  <math|\<cal-H\>>. We discuss loosening the limitation of this finite set in
  a later Section <reference|sec:infi-hypo>.

  We used the Maximize to Explore (MEX) algorithm mentioned in
  <cite|liu_one_2023> to tackle the episodic MDP with an given hypothesis
  set. We confirm a sub-linear regret outcome in Section
  <reference|sec:fin-hypo>. Moreover, we found that the MEX algorithm can
  ignore human policies that are of the same type, allowing for a regret
  boundary that is smaller than the upper limit noted in <cite|liu_one_2023>.
  The definition for policies be of the same type is introduced in Section
  <reference|sec:type>. Furthermore, we applied the MEX algorithm with an
  infinite hypothesis set that encompasses the true policy. We demonstrated
  that utilizing MEX with a finite hypothesis set, which contains a policy
  nearly identical to the true policy in the infinite hypothesis set, can
  still achieve sub-linear regret that converges to a neighborhood of a
  optimal value. This aspect is elaborated in Section
  <reference|sec:infi-hypo>.

  In our experiment, we developed a simplified environment of the
  Overcooked-AI <cite|carroll_utility_2019>, where agents are required to
  engage in a series of actions such as cooking, waiting, and delivering
  food. The simplified version of Overcooked-AI, focusing exclusively on the
  food delivery task. <with|color|blue|This simplification is essential as it
  enables us to focus clearly on the main challenges posed by the original
  environment but significantly reduce the size of both state and action
  spaces, leading to a considerable decrease in computational complexity.>

  We created the set of possible human policies using the best response
  dynamics method <cite|strouse_collaborating_2022>, where agents constantly
  modify their policies to best respond to the policies observed from other
  agents. The best response dynamics is guaranteed to converge to a Nash
  equilibrium policy, which equilibrium it reaches depends on the initial
  policy <cite|monderer_potential_1996>. To increase the diversity of human
  policies, we hand-coded some policies as initial policies. Also, inspired
  by IPOMDP <cite|gmytrasiewicz_framework_2005>, we varied the total number
  of iterations in the best response dynamics to simulate humans exhibiting
  different levels of intelligence.

  We compared our algorithm with <math|Q>-learning with UCB exploration
  <cite|jin_is_2018><cite|dong_q-learning_2019>, Upper confidence bound
  <cite|lai_asymptotically_1985>, optimistic posterior sampling
  <cite|zhong_gec_2023>, and UCRL2 <cite|auer_near-optimal_2008> algorithms.
  Our results shows that <with|color|blue|(added experiment)>

  <section|Related Work (haven't revise, do not read)>

  Previous research in the Human-AI (HAI) field tends to model human policy
  as a policy that closely aligns with the AI agent, with efforts to
  parameterize this closeness [42]. \ To evaluate these algorithms, several
  benchmark environments are available that aid in analyzing cooperative
  human-AI interaction tasks, including platforms like the two-player
  cooperative Atari game [57], bridge card game [40], and Overcooked-AI
  [16][54].

  <with|font-series|bold|Human-AI Interaction>: Previous research in the
  Human-AI (HAI) field model human policy as a policy that closely aligns
  with the AI agent, with efforts to parameterize this closeness
  <cite|nikolaidis_human-robot_2017>. Additionally, there are studies in Meta
  Reinforcement Learning (Meta RL) that work on deciphering the MDP the AI
  agent encounters, inherently learning the human agent's policy, since the
  structure of this MDP is influenced by the human agent's choices. To
  evaluate these algorithms, several benchmark environments are available
  that aid in analyzing cooperative human-AI interaction tasks, including
  platforms like the two-player cooperative Atari game
  <cite|tylkin_learning_2021>, bridge card <cite|lockhart_human-agent_2020>,
  and Overcooked-AI <cite|carroll_utility_2019><cite|strouse_collaborating_2022>.\ 

  <with|font-series|bold|Human agent generation:> Collecting human policies
  can be notably costly. Previous studies have developed methods for more
  efficient human policies generation. One such method utilizes an algorithm
  that identifies and selects policies based on a measure defined by the
  diversity of the best responses these policies can offer. The algorithm
  then maximizes this measure to find the policies that provide a diverse set
  of best responses <cite|rahman_generating_2023>. Another strategy
  formulates human policies by running best response dynamics
  <cite|strouse_collaborating_2022>.

  <with|font-series|bold|Ad-Hoc teamworks:> Our work is closely related to
  ad-hoc teamworks <cite|baumeister_survey_2022><cite|albrecht_autonomous_2018><cite|stone_ad_2010>
  , especially the opponent modeling subtask. Barrett et. al.
  <cite|barrett_making_2017> introduces PLASTIC-Model and PLASTIC-Policy
  algorithms, the formal algorithm models the team-member by its transition
  dynamics and the latter models team-member by its policy. He et.al.
  <cite|he_opponent_2016> models the human agent's policy as a deep neural
  network.

  <with|color|blue|YL: needs more time to read
  <cite|albrecht_game-theoretic_2015><cite|albrecht_belief_2016><cite|xie_learning_2020>
  >

  <with|font-series|bold|Partially observable Markov decision process
  (POMDP):> The foundation of our problem is closely related to the partially
  observable Markov decision process <cite|astrom_optimal_1965><cite|smallwood_optimal_1973>,
  since each human policy in the hypothesis set can be viewed as a latent
  variable of the POMDP. The POMDP problem where we have latent variables are
  called latent MDPs (LMDP) <cite|kwon_rl_2021>. LMDP has few different
  names, such as contextual decision process <cite|hallak_contextual_2015>,
  multi-model MDP <cite|steimle_multi-model_2021>, multi-task RL
  <cite|liu_pac_2016><cite|taylor_transfer_2009><cite|brunskill_sample_2013>,
  MOMDP/hidden model MDP <cite|ong_planning_2010><cite|chades_momdps_2012><cite|doshi-velez_hidden_2013><cite|fern_decision-theoretic_2014>,
  and concurrent MDP <cite|buchholz_computation_2019>. Beyond original POMDP,
  there are also some other settings that can cover our problem, such as
  interactive-POMDP <cite|han_learning_2018><cite|gmytrasiewicz_framework_2005>,
  Augmented Bayes-Adaptive MDP (BAMDP) <cite|white_bayesian_1969><cite|duff_optimal_2002><cite|guez_efficient_2012>.
  The model-based RL with UCB exploration algorithms
  <cite|strehl_analysis_2008><cite|azar_minimax_2017> is also related to our
  setting.

  <with|font-series|bold|MEX related algorithms:> Our algorithm is based on
  MEX <cite|liu_one_2023>, in each episode, the algorithm chooses a human
  policy from the hypothesis set. On the other hand, the posterior sampling
  algorithms <cite|thompson_likelihood_1933><cite|russo_learning_2014><cite|zhong_gec_2023><cite|agarwal_model-based_2022><cite|zhang_feel-good_2021><cite|agarwal_non-linear_2022><cite|agrawal_posterior_2020>
  updates a belief over the hypothesis set in each episode and draws a policy
  based on the current belief. Some methods like OLIVE
  <cite|jiang_contextual_2016> eliminates policy from current hypothesis set
  in each episode. Additionally, there is a method that trains one policy
  that is robust for all possible human policies in the hypothesis set
  <cite|bertuccelli_robust_2012>.

  <with|font-series|bold|MDP structure assumptions:> Our regret analysis is
  based on the low generalized eluder coefficient assumption
  <cite|zhong_gec_2023>, which is a weaker assumption than low Eluder
  dimension/Bellman eluder dimension <cite|osband_model-based_2014><cite|jin_bellman_2021>,
  low Bellman rank <cite|jiang_contextual_2016>, Bellman completeness
  <cite|zanette_learning_2020>, Bilinear classes <cite|du_bilinear_2021>, and
  linear MDP structure <cite|yang_sample-optimal_2019><cite|jin_provably_2020>.
  The environment we used in the experiment is a tabular MDP which satisfies
  the low Bellman eluder dimension assumption <cite|jin_bellman_2021>. Also,
  the regret analysis of infinite hypothesis set are related to agnostic
  online learning <cite|ben-davidAgnosticOnlineLearning2009><cite|ross_agnostic_2012>.

  <section|Prerequisite>

  In this work, we use an two-player episodic finite horizon MDP as the
  setting for human-AI collaboration, where the player <math|1> is the AI
  agent and the player <math|2> is the human agent. We assume that the
  different human types are captured by different policies and the human
  agent's real policy is fixed but unknown. We revised the MEX algorithm
  introduced in <cite|liu_one_2023> so it can be used in our setting.

  <subsection|Episodic Finite Horizon MDP>

  We consider a two-player episodic finite horizon Markov game defined as
  <math|<around*|(|S,A,\<bbb-P\>,T,K,r,\<gamma\>|)>>, where <math|S> is the
  joint state space and <math|A> is the action space for both players. In
  this paper, we only consider the tabular setting, i.e.,
  <math|<around*|\||S|\|>\<less\>\<infty\>> and
  <math|<around*|\||A|\|>\<less\>\<infty\>>. The transition kernel
  <math|\<bbb-P\>> and the expected reward <math|r> are defined as:

  <\equation*>
    \<bbb-P\>:S\<times\>A\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>,<space|1em>r:S\<times\>A\<times\>A\<rightarrow\><around*|[|0,1|]>,
  </equation*>

  where <math|\<Delta\><around*|(|S|)>> is the probability simplex on joint
  state space. The time horizon and the total number of episodes are denoted
  by <math|T> and <math|K>. Also, we consider a discounted setting with a
  discount factor <math|\<gamma\>\<less\>1>. We use <math|s<rsup|k><rsub|t>>
  to denote the joint state of episode <math|k> in time <math|t> and we use
  <math|a<rsup|k><rsub|t>> and <math|b<rsup|k><rsub|t>> to denote the action
  of episode <math|k> in time <math|t> for player <math|1> and player
  <math|2> respectively. The initial state is fixed for all episodes and
  denoted as <math|s<rsub|1>>, i.e., <math|s<rsup|k><rsub|0>=s<rsub|0>>. The
  policy for player <math|1> is denoted as <math|\<mu\>> and defined as

  <\equation*>
    \<mu\>:S\<times\><around*|[|T|]>\<rightarrow\>\<Delta\><around*|(|A|)>,
  </equation*>

  where <math|<around*|[|T|]>=<around*|{|0,1,\<ldots\>,T-1|}>>. The policy
  for player <math|2> is denoted as <math|\<pi\>> and defined as\ 

  <\equation*>
    \<pi\>:S\<times\><around*|[|T|]>\<rightarrow\>\<Delta\><around*|(|A|)>.
  </equation*>

  The set of all policies available to player 1 is denoted by
  <math|\<cal-U\>> and the set for player 2 is represented by <math|\<Pi\>>.
  Now, we define the cumulative reward given policies
  <math|<around*|(|\<mu\>,\<pi\>|)>> as

  <\equation*>
    V<around*|(|\<mu\>,\<pi\>|)>=\<bbb-E\><rsub|a<rsub|t>\<sim\>\<mu\><around*|(|s<rsub|t>,t|)>,b<rsub|t>\<sim\>\<pi\><around*|(|s<rsub|t>,t|)>><around*|[|<big|sum><rsub|t=0><rsup|T-1>\<gamma\><rsup|t>r<around*|(|s<rsub|t>,a<rsub|t>,b<rsub|t>|)>\<mid\>s<rsub|0>=s<rsub|0>,s<rsub|t+1>\<sim\>\<bbb-P\><around*|(|s<rsub|t>,a<rsub|t>,b<rsub|t>|)>|]>.
  </equation*>

  In this study, we explore a scenario where player <math|2> adopts a fixed
  but unknown policy through all episodes. The true policy adopted for player
  <math|2> is denoted as <math|\<pi\><rsup|\<ast\>>>. The primary objective
  is to develop a series of policies <math|<around*|{|\<mu\><rsup|k>|}><rsub|k\<in\><around*|[|K|]>>>
  for player <math|1><math|>, which aim to reduce the regret defined by the
  equation

  <\equation*>
    Reg<around*|(|K|)>=<big|sum><rsub|k=1><rsup|K>max<rsub|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>.
  </equation*>

  <subsection|Maximize to Explore Algorithm>

  <with|color|blue|TODO: introduce MEX in here, compare the original
  implementation and our implementation.>

  Here, <math|\<pi\><rsup|k>> is the guessed policy of player <math|2> in
  episode <math|k> (guessed by player <math|1>). The guessed policies are
  selected from a pre-trained hypothesis set <math|\<cal-H\>>. This set
  contains potential behaviors of player <math|2>. Some methods such as best
  response dynamics <cite|monderer_potential_1996> can be employed to create
  <math|\<cal-H\>>. The detailed way to generate a hypothesis set will be
  discussed in Section (Experiment).

  A significant challenge encountered in human-AI collaboration is the
  necessity for the AI agent to anticipate the actions of the human agent. In
  the context of our framework, the hypothesis set <math|\<cal-H\>> embodies
  various potential human behaviors identified prior to the training phase,
  with the true policy, <math|\<pi\><rsup|\<ast\>>>, representing the actual
  behavior demonstrated by the human agent during the interaction with the AI
  agent.

  <section|Classifying Different Types of Agents by Policies><label|sec:type>

  In our previous discussion, we explained how the hypothesis set
  <math|\<cal-H\>> captures the potential behaviors of player 2. However,
  <math|\<cal-H\>> might include policies that result in similar optimal
  cumulative rewards. In instances like these, we should consider these
  policies as belonging to the same type. In this subsection, we will present
  a clear definition to classify the various types of policies. Building on
  these classifications, we will then develop a metric to assess the size of
  the hypothesis set <math|\<cal-H\>>, which will be smaller than the
  numerical count of <math|\|\<cal-H\>\|>.

  <subsection|Best Response Oracle>

  For each player <math|2>'s policy <math|\<pi\>>, the set of all best
  response policies is denoted as <math|BR<around*|(|\<pi\>|)>>, i.e.,

  <\equation*>
    BR<around*|(|\<pi\>|)>=<below|argmax|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\>|)>.
  </equation*>

  For any player <math|2>'s policy <math|\<pi\>>, we assume the existence of
  an oracle that can return a best response from
  <math|BR<around*|(|\<pi\>|)>>.\ 

  <\definition>
    <with|font-series|bold|(Oracle)> A best response oracle <math|\<psi\>>
    refers to a function that, upon receiving policies as input, yields a
    best response as its output, i.e., <math|\<psi\>> is a function
    <math|\<psi\>:\<cal-H\>\<rightarrow\>\<cal-U\>> such that

    <\equation*>
      \<psi\><around*|(|\<pi\>|)>\<in\>BR<around*|(|\<pi\>|)>.
    </equation*>
  </definition>

  With the definition of an oracle, we can categorize policies within a
  hypothesis set into various types.

  <subsection|Type Number>

  <\definition>
    <with|font-series|bold|(<math|\<psi\>>-type)> We call two policies
    <math|\<pi\>> and <math|\<pi\><rprime|'>> to be of the same
    <with|font-shape|italic|type> under oracle <math|\<psi\>> if we have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rprime|'>|)>,\<pi\><rprime|'>|)>.
    </equation*>

    The relationship is denoted as <math|\<pi\><above|\<sim\>|\<psi\>>\<pi\><rprime|'>>.
    On the contrary, two policies <math|\<pi\>> and <math|\<pi\><rprime|'>>
    not of the same <with|font-shape|italic|type> under oracle <math|\<psi\>>
    is denoted as <math|\<pi\><above|\<nsim\>|\<psi\>>\<pi\><rprime|'>>.
  </definition>

  <\definition>
    We call a set of policies <math|\<Pi\>> be type-independent under oracle
    <math|\<psi\>> if for all <math|\<pi\>\<in\>\<Pi\>> and
    <math|\<pi\><rprime|'>\<in\>\<Pi\>> such that
    <math|\<pi\>\<neq\>\<pi\><rprime|'>>, we have
    <math|\<pi\><above|\<nsim\>|\<psi\>>\<pi\><rprime|'>>.\ 
  </definition>

  The <math|\<psi\>>-type characterization gives rise to a measurement of
  quantity for the set of policies <math|\<cal-H\>>, denoted by
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>>.\ 

  <\definition>
    Given a hypothesis set <math|\<cal-H\>>, the type number
    <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>> under oracle <math|\<psi\>>
    is defined as the size of a largest type-independent subset of
    <math|\<cal-H\>>, i.e.,

    <\equation*>
      n<rsup|\<psi\>><around*|(|\<cal-H\>|)>=max<around*|{|<around*|\||\<Pi\>|\|>:\<Pi\>\<subset\>\<cal-H\>,<text|<math|\<Pi\>>
      is type-independent under oracle <math|\<psi\>>>|}>.
    </equation*>
  </definition>

  It is easy to verify that <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\><around*|\||\<cal-H\>|\|>>.
  In the next section, we will show that the regret of the MEX algorithm
  depends on <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>> instead of
  <math|<around*|\||\<cal-H\>|\|>>.

  <section|Regret Analysis for Finite Hypothesis Set><label|sec:fin-hypo>

  In this section, we restrict our discussion to cases where the cardinality
  of the hypothesis set is finite, i.e., <math|<around*|\||\<cal-H\>|\|>\<less\>\<infty\>>.
  This condition is emphasized through the notation
  <math|\<cal-H\><rsub|fin>>. We also assume that the realization assumption
  holds, i.e., <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|fin>>.

  <subsection|Generalized Eluder Coefficient>

  Our sub-linear regret result based on the following assumption.

  <\ass>
    <with|font-shape|italic|(Low generalized eluder coefficient
    <cite|liu_one_2023><cite|zhong_gec_2023>)> Given
    <math|\<varepsilon\>\<gtr\>0>, there exists
    <math|d<around*|(|\<varepsilon\>|)>\<gtr\>0>, such that for any
    <math|<around*|{|\<pi\><rsup|k>|}><rsub|k\<in\><around*|[|K|]>>\<subset\>\<cal-H\>>,
    <math|<around*|{|\<psi\><around*|(|\<pi\><rsup|k>|)>|}><rsub|k\<in\><around*|[|K|]>>\<subset\>\<cal-U\>>,

    <\equation>
      <big|sum><rsub|k=1><rsup|K>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>\<leq\>inf<rsub|\<mu\>\<gtr\>0><around*|{|<frac|\<mu\>|2><big|sum><rsub|k=1,h=1><rsup|K,H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>+\<varphi\><around*|(|\<mu\>,\<varepsilon\>,H,K|)>|}><label|eq:gec-condition>,
    </equation>

    where <math|\<varphi\><around*|(|\<mu\>,\<varepsilon\>,H,K|)>=d<around*|(|\<varepsilon\>|)>/<around*|(|2\<mu\>|)>+<sqrt|d<around*|(|\<varepsilon\>|)>H
    K>+\<varepsilon\>H K>. The player <math|1>'s policy in episode <math|s>
    is given by <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>.
    The discrepancy function <math|\<ell\><rsub|\<pi\><rsup|s>>> is the
    <with|font-shape|italic|Hellinger distance>. Given data
    <math|\<xi\><rsub|h>=<around*|(|s<rsub|h>,a<rsub|h>,r<rsub|h>,s<rsub|h+1>|)>>,
    we define

    <\equation*>
      \<ell\><around*|(|\<pi\><rsup|k>,\<xi\><rsub|h>|)>=D<rsub|H><around*|(|\<bbb-P\><around*|(|\<cdot\>\<mid\>s<rsub|h>,a<rsub|h>,\<pi\><rsup|k><around*|(|s<rsub|h>|)>|)>\<mid\>\<mid\>\<bbb-P\><around*|(|\<cdot\>\<mid\>s<rsub|h>,a<rsub|h>,\<pi\><rsup|\<ast\>><around*|(|s<rsub|h>|)>|)>|)>,
    </equation*>

    where <math|D<rsub|H><around*|(|\<cdot\>\<mid\>\<mid\>\<cdot\>|)>>
    denotes the Hellinger distance. We denote the smallest number
    <math|d<around*|(|\<varepsilon\>|)>\<gtr\>0> satisfying condition
    <eqref|eq:gec-condition> as <math|d<rsub|GEC><around*|(|\<varepsilon\>|)>>.
  </ass>

  Intuitively, the low generalized eluder coefficient assumption states that,
  in the long run, if the hypothesis <math|<around*|{|\<pi\><rsup|k>|}><rsub|k\<in\><around*|[|K|]>>>
  has a small in-sample training error, i.e., the term

  <\equation*>
    \<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>
  </equation*>

  is small, then, the prediction error <math|V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|\<ast\>>|)>>
  will also be small. In <cite|jiang_contextual_2016>, they showed that a
  tabular MDP has a low Bellman rank, which implies a low Bellman eluder
  dimension <cite|jin_bellman_2021>. In <cite|zhong_gec_2023>, they showed
  that any MDP that satisfies the low Bellman eluder dimension condition will
  have a low GEC condition, which implies that our setting satisfies
  condition <eqref|eq:gec-condition>.

  <subsection|Main Theorem: Finite Hypothesis Set>

  <\theorem>
    <label|thm:fin>Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and a finite hypothesis class
    <math|\<cal-H\><rsub|fin><rsup|>> with
    <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|fin>>, by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    the regret of the MEX algorithm applying on <math|\<cal-H\><rsub|fin>>
    with oracle <math|\<psi\>> after <math|K> episodes is upper bounded by,
    with probability at least <math|1-\<delta\>>,

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

  <\proof>
    See Appendix <reference|app:thm-fin>
  </proof>

  The sole term related to the size of the hypothesis set is
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>. Consequently, the
  magnitude of regret is solely influenced by the type number associated with
  a hypothesis set, as opposed to the cardinality of the hypothesis set. This
  phenomenon occurs because policies that are categorized under the same type
  by policy <math|\<psi\>> yield identical rewards when implemented in the
  MEX algorithm.

  The type number <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>
  depends on the choice of the oracle <math|\<psi\>>, which makes it hard to
  verify when the explicit form of <math|\<psi\>> is not given. However, we
  can introduce a stronger notion of type and verify the upper bound of
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>>. This stronger
  notion of type does not depends on the choice of oracle <math|\<psi\>>.

  <\definition>
    <with|font-shape|italic|(Strong)> We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same <with|font-shape|italic|s-type>
    if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)><label|eq:st-condition>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>. The
    relationship are denoted as <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>>.
  </definition>

  Similar to the definition of type number under oracle <math|\<psi\>>, we
  can define strong type number <math|n<rsub|stype><around*|(|\<cal-H\>|)>>.

  <\lemma>
    <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>\<leq\>n<rsub|stype><around*|(|\<cal-H\>|)>>
    for all <math|\<psi\>> be a best response oracle.
  </lemma>

  <\proof>
    By definition.
  </proof>

  <\example>
    For any two distinct policies, <math|\<pi\>> and <math|\<pi\><rprime|'>>,
    if they both have the same unique best response <math|\<mu\>>, we can
    deduct that <math|\<pi\><above|\<sim\>|s>\<pi\><rprime|'>> by definition.
    To illustrate this in a real-world context, let's consider a scenario
    involving two cars traveling on a road with three lanes. The AI-operated
    car is in the left lane, while the human-driven car occupies the middle
    lane. Suppose the AI car intends to accelerate to move ahead of the human
    car. In response, the human has three options: move to the right, shift
    to the left, or maintain their current position. If the human's policy
    tends towards moving right or staying put, the AI car will consistently
    choose to speed up, given that both these responses from the human elicit
    the same best response from the AI. Consequently, these two human
    policies can be considered to be of the same strong type, or s-type.
  </example>

  In the next section, we will generalize the regret analysis to an infinite
  hypothesis set.

  <section|Regret Analysis for Infinite Hypothesis Set><label|sec:infi-hypo>

  In this subsection, we discuss the cases where the cardinality of the
  hypothesis set is infinite, i.e., <math|<around*|\||\<cal-H\>|\|>=\<infty\>>.
  This condition is emphasized through the notation
  <math|\<cal-H\><rsub|inf>>. We keep assume that the realization assumption
  holds, i.e., <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|inf>>.

  <subsection|Approximate an Infinite Hypothesis Set by a Finite Hypothesis
  Set>

  A direct approach to handling an infinite hypothesis set is to approximate
  it by a finite hypothesis set. First, we outline what makes a good
  approximation. Let's first define the following quantity,

  <\equation*>
    V<rsup|\<ast\>><around*|(|\<pi\>|)>\<triangleq\>max<rsub|\<mu\>\<in\>\<cal-U\>>
    V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>
  </equation*>

  The quantity <math|V<rsup|\<ast\>>> serves as a value function for player
  <math|2>'s policy given player <math|2> will return a best response. In the
  tabular case, we can regard each policy <math|\<pi\>> as a vector in
  <math|\<bbb-R\><rsup|<around*|\||S|\|> <around*|\||A|\|>T>>. Now given a
  norm <math|<around*|\<\|\|\>|\<cdot\>|\<\|\|\>>> such as
  <math|L<rsub|2>>-norm defined on <math|\<Pi\>>, we have the following
  definition,

  <\definition>
    <label|def:fin-cover>(<math|\<varepsilon\>>-approximation) A finite
    hypothesis set <math|\<cal-H\><rsub|fin>> is called an
    <math|\<varepsilon\>>-optimal approximation of <math|\<cal-H\><rsub|inf>>
    if there exist a <math|\<pi\>\<in\>\<cal-H\><rsub|fin>> such that
    <math|<around*|\<\|\|\>|\<pi\>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>.
  </definition>

  Based on this definition, we make the following Assumption.

  <\ass>
    The value function for player <math|2>'s policy
    <math|V<rsup|\<ast\>><around*|(|\<pi\>|)>> is Lipschitz continuous, i.e.,
    if <math|<around*|\<\|\|\>|\<pi\>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>,
    we have

    <\equation*>
      <around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>|\|>\<leq\>L<rsub|V><around*|(|\<pi\><rsup|\<ast\>>|)>\<varepsilon\>,
    </equation*>

    for some constant <math|L<rsub|V><around*|(|\<pi\><rsup|\<ast\>>|)>\<gtr\>0>.
  </ass>

  Define <math|\<bbb-P\><rsub|\<mu\>><around*|(|s,a|)>\<triangleq\>\<bbb-P\><around*|(|\<cdot\>\<mid\>s,\<mu\><around*|(|s|)>,a|)>>
  and <math|r<rsub|\<mu\>><around*|(|s,a|)>\<triangleq\>r<around*|(|s,\<mu\><around*|(|s|)>,a|)>>.
  <math|d<rsub|S A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>\<triangleq\>d<rsub|S><around*|(|s,s<rprime|'>|)>+d<rsub|A><around*|(|a,a<rprime|'>|)>>,
  where <math|<with|color|blue|d<rsub|S>\<triangleq\><around*|\<\|\|\>|s-s<rprime|'>|\<\|\|\>><rsub|\<infty\>>,state
  is not a vector>> and\ 

  The assumption holds for MDPs where the transition kernel and the reward
  function satisfies,

  <\equation*>
    \<forall\><around*|(|s,s<rprime|'>,a,a<rprime|'>|)>\<in\>S<rsup|2>\<times\>A<rsup|2>,<space|2em>\<cal-K\><around*|(|\<bbb-P\><rsub|\<mu\>><around*|(|\<cdot\>\<mid\>s,a|)>,\<bbb-P\><rsub|\<mu\>><around*|(|\<cdot\>\<mid\>s<rprime|'>,a<rprime|'>|)>|)>\<leq\>L<rsub|\<bbb-P\><rsub|\<mu\>>>d<rsub|S
    A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>
  </equation*>

  and

  <\equation*>
    \<forall\><around*|(|s,<wide|s|^>,a,<wide|a|^>|)>\<in\>S<rsup|2>\<times\>A<rsup|2>,<space|2em><around*|\||r<rsub|\<mu\>><around*|(|s,a|)>-r<rsub|\<mu\>><around*|(|s<rprime|'>,a<rprime|'>|)>|\|>\<leq\>L<rsub|r<rsub|\<mu\>>>d<rsub|S
    A><around*|(|<around*|(|s,a|)>,<around*|(|s<rprime|'>,a<rprime|'>|)>|)>.
  </equation*>

  see Theorem 1 in <cite|sutton_policy_1999>. Similar results can also be
  found in <cite|asadi_lipschitz_2018><cite|karimi_non-asymptotic_2019><cite|zhang_global_2020><cite|xu_sample_2021><cite|agarwal_optimality_2020>

  <\example>
    Many works <with|color|blue|(TODO: add citations)> in ad-hoc teamworks
    assumes an finite hypothesis set <math|\<cal-H\><rsub|fin>> to capture
    all potential policies adopted by teammates. However, the real policy the
    teammates adopts might deviate from the given hypothesis set
    <math|\<cal-H\><rsub|fin>> due to reasons like bounded rationality. Thus,
    the real hypothesis set that captures the deviation is defined as

    <\equation*>
      \<cal-H\><rsub|inf>=<around*|{|\<pi\>\<mid\><around*|\<\|\|\>|\<pi\>-\<pi\><rprime|'>|\<\|\|\>>\<leq\>\<varepsilon\>,\<pi\><rprime|'>\<in\>\<cal-H\><rsub|fin>|}>.
    </equation*>

    Thus, the given hypothesis set <math|\<cal-H\><rsub|fin>> serves as an
    <math|\<varepsilon\>>-optimal approximation of the real hypothesis set
    <math|\<cal-H\><rsub|inf>>
  </example>

  <\example>
    Given a<strong|> parameterization <math|\<cal-N\>>, we define
    <math|\<cal-H\><rsub|inf>> as the set comprising all policies
    characterized by the set all possible parameters <math|\<Theta\>> that is
    in accordance with the specified structure, formally represented as,

    <\equation*>
      \<cal-H\><rsub|inf>=<around*|{|\<pi\>\<mid\>\<pi\>\<in\>\<cal-N\><around*|(|\<theta\>|)>,\<theta\>\<in\>\<Theta\>|}>.
    </equation*>

    We proceed to create a discretization of <math|\<Theta\>>, denoted as
    <math|<wide|\<Theta\>|^>>. The finite approximation set
    <math|\<cal-H\><rsub|fin>> is defined as

    <\equation*>
      \<cal-H\><rsub|fin>=<around*|{|\<pi\>\<mid\>\<pi\>\<in\>\<cal-N\><around*|(|\<theta\>|)>,\<theta\>\<in\><wide|\<Theta\>|^>|}>.
    </equation*>

    By the choice of discretization interval, we can ensure that
    <math|<around*|\<\|\|\>|\<pi\>-\<pi\><rsup|\<ast\>>|\<\|\|\>>\<leq\>\<varepsilon\>>.
  </example>

  <subsection|Main Theorem: Infinite Hypothesis Set>

  Now, given an infinite hypothesis set <math|\<cal-H\><rsub|inf>> with an
  <math|\<varepsilon\>>-optimal approximation set <math|\<cal-H\><rsub|fin>>,
  we are prepared to execute the MEX algorithm within the confines of
  <math|\<cal-H\><rsub|fin>>. The regret analysis is given in the following
  Theorem. Before proof the theorem, we denote
  <math|\<pi\><rsup|\<ast\>><rsub|det>> as <math|\<varepsilon\>>-approximate
  policy w.r.t. <math|\<pi\><rsup|\<ast\>>> defined as

  <\equation*>
    \<pi\><rsup|\<ast\>><rsub|det>\<triangleq\><below|argmin|\<pi\>\<in\>\<cal-H\>>
    <around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>|\|>.
  </equation*>

  <\theorem>
    <label|thm:inf>Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and an infinite hypothesis class
    <math|\<cal-H\><rsub|inf><rsup|>> with
    <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsub|inf>>. For any
    <math|\<varepsilon\>>-optimal approximation
    <math|\<cal-H\><rsub|fin><rsup|>> of <math|\<cal-H\><rsub|inf><rsup|>>,
    by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    the regret of the MEX algorithm applying on <math|\<cal-H\><rsub|fin>>
    with oracle <math|\<psi\>> after <math|K> episodes is upper bounded by,
    with probability at least <math|1-\<delta\>>,

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>+<with|color|blue|K L<rsub|V> \<varepsilon\>>.
    </equation*>
  </theorem>

  <\proof>
    By the choice of <math|\<pi\><rsup|k>>, we have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. By Definition
    <reference|def:fin-cover>,

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>\<geq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-L<rsub|V>
      \<varepsilon\>.
    </equation*>

    Thus,

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>+L<rsub|V>
      \<varepsilon\>.
    </equation*>

    Follow the same procedure in the proof of Theorem <reference|thm:fin>
    leads to the proof.
  </proof>

  <\remark>
    The linear term <math|K L<rsub|V> \<varepsilon\>> cannot be eliminated.
    Consider the best case where <math|\<pi\><rsup|k>=\<pi\><rsup|\<ast\>><rsub|det>>
    for all <math|k\<in\><around*|[|K|]>>. The regret is

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|K<around*|(|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>><rsub|det>|)>,\<pi\><rsup|\<ast\>><rsub|det>|)>-<around*|\<nobracket\>|V<around*|(|\<psi\><around*|(|\<pi\>|\<nobracket\>><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>|)>>>|<row|<cell|\<leq\>>|<cell|K
      L<rsub|V> \<varepsilon\>.>>>>
    </align>
  </remark>

  <section|Numerical Experiments><label|sec:num>

  In this section, we compare the MEX algorithm with Upper confidence bound
  algorithm (UCB) <cite|lai_asymptotically_1985>, <math|Q> learning with UCB
  exploration algorithm <cite|jin_is_2018><cite|dong_q-learning_2019> and
  optimistic posterior sampling algorithm <cite|zhong_gec_2023>.

  <subsection|Simplified Overcooked Environment>

  Our experiment employs a simplified version of Overcooked-AI
  <cite|carroll_utility_2019> within a <math|5\<times\>5> gridworld. Each
  block is indexed by <math|<around*|(|i,j|)>>, where
  <math|<around*|(|i,j|)>\<in\><around*|{|1,2,3,4,5|}><rsup|2>>, representing
  the block's row and column, respectively. The central block,
  <math|<around*|(|3,3|)>> contains an immovable table. In this <math|5> by
  <math|5> setting, the AI player (player 1) and the human player (player 2)
  collaborate to serve four dishes to corresponding guests. The action space
  for both players are <math|A=<around*|{|<with|font-family|tt|stay>,<with|font-family|tt|up>,<with|font-family|tt|down>,<with|font-family|tt|left>,<with|font-family|tt|right>,<with|font-family|tt|interact>|}>>.
  At the game's onset, the AI player occupies block <math|<around*|(|5,3|)>>
  while the human player is positioned at <math|<around*|(|1,3|)>>. The tasks
  for picking up and delivering food are as follows, and players can decide
  which to pursue first:

  <\itemize>
    <item>Pick from <math|(5,3)>, deliver to <math|<around*|(|1,3|)>>

    <item>Pick from <math|(1,3)>, deliver to <math|<around*|(|5,3|)>>

    <item>Pick from <math|(2,1)>, deliver to <math|<around*|(|4,5|)>>

    <item>Pick from <math|(4,1)>, deliver to <math|(2,5)>
  </itemize>

  Both players and the table can only hold one dish at any moment. Each
  successful delivery rewards both players with an immediate reward <math|1>.
  The game has a discount factor, <math|\<gamma\>=0.9>. The game ends either
  all dishes are delivered or after 50 timesteps have elapsed.

  Unlike the original overcooked-AI, our simplification occurs in the
  following three aspects:

  <\enumerate>
    <item>All dishes are ready to serve, negating the cooking process.

    <item>Foods can only be placed on the table or held by a player, whereas
    in the original Overcooked-AI, food could be set on the ground.\ 

    <item>Food at each location can be picked up only once, ensuring that
    there are just four foods available in this game.

    <item>Player orientation is absent in our version. For instance, if a
    player at <math|<around*|(|2,3|)>> holds a food, the ``interact'' action
    places it on the table. In contrast, the original Overcooked-AI would
    also require the player to face downwards towards the table.
  </enumerate>

  An instace of the state is

  <\python>
    state = {'player_positions': [(1,2), (3,2)], \ 'player_has_food': [0,2],
    'table_has_food': 3, 'kitchen_has_food': (False,False,False,True)}
  </python>

  The state represents that player <math|1> is in <math|<around*|(|1,2|)>>
  while player <math|2>'s position is <math|<around*|(|3,2|)>>. The player
  <math|1> has no food on his hand, player <math|2> has food <math|2> on her
  hand and food <math|3> is put on the table. The food <math|1>,<math|2> and
  <math|3> are picked while the food <math|4> is not picked. The total number
  of states are <math|5<rsup|4>\<times\>5<rsup|3>\<times\>2<rsup|4>=1250000>.
  However, some states are invalid. For example, consider the state

  <\python>
    state = {'player_positions': [(1,2), (3,2)], \ 'player_has_food': [1,2],
    'table_has_food': 3, 'kitchen_has_food': (True,False,False,True)}
  </python>

  This state is invalid because Player 1 possesses food 1, while the
  <python|'kitchen_has_food'> entry indicates that food 1 has not been picked
  up, which is a contradictory scenario. Following our simplification, the
  size of the state space <math|<around*|\||S|\|>> is now
  <math|<around*|\||S|\|>=174529>.\ 

  <subsection|Human Policy Generation Without Human Data>

  We derive human policies using best response dynamics applied to a diverse
  set of initial policies <cite|strouse_collaborating_2022>. To ensure a
  diverse set of initial policies, we introduced 16 handcrafted initial
  policies for training. These are polices for player 1 or player 2 to either
  initially deliver food <math|i> to guest <math|i>, followed by a random
  walk, or to initially take food <math|i> to the table and followed by a
  random walk. In total, this approach generates <math|16>
  (<math|4\<times\>2\<times\>2>) distinct initial policies. Besides these
  handcrafted initial policies, we also randomly generated 6 distinct initial
  policies. We use these 22 (<math|16+6>) initial policies as starting point
  to train using best response dynamics. In addition to the end results of
  best response dynamics, we also store the outcomes of the first three
  iterations that returns a player <math|2>'s policy as human policies. The
  genration method gives us a set of human policies <math|\<cal-H\>> with
  <math|<around*|\||\<cal-H\>|\|>=88> (<math|22\<times\>4>) and
  <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>=7>.

  Throughout our experiment, the best response oracle <math|\<psi\>> used in
  best response dynamics, optimistic posterier sampling and MEX algorithm is
  value iteration algorithm. The value iteration algorithm terminates when
  the Bellman residual is smaller than <math|10<rsup|-3>> and returns a
  greedy policy based on the trained value function.\ 

  \;

  \;

  <\section>
    Appendix
  </section>

  <subsection|Lemmas>

  <\lemma>
    <label|lem:loss-upperbound>With probability at least <math|1-\<delta\>>,
    for any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>>,
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>>, and
    <math|\<pi\>\<in\>\<Pi\>>

    <\equation*>
      L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\>|)>\<leq\>-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H<around*|\||\<Pi\>|\|>/\<delta\>|)>.
    </equation*>
  </lemma>

  <\proof>
    Given <math|\<pi\>\<in\>\<cal-H\>>, we denote the random variable
    <math|X<rsup|k><rsub|h,\<pi\>>> as

    <\equation*>
      X<rsup|k><rsub|h,\<pi\>>=log<around*|(|<frac|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>,a<rsub|h><rsup|k>|)>|\<bbb-P\><rsub|h,\<pi\>><around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>,a<rsub|h><rsup|k>|)>>|)>.
    </equation*>

    Now we define a filtration <math|<around*|{|\<cal-F\><rsub|h,k>|}><rsub|k=1><rsup|K>>
    as (B.25) in <cite|liu_one_2023>. Thus we have
    <math|X<rsub|h,\<pi\>><rsup|k>\<in\>\<cal-F\><rsub|h,k>>. Therefore, by
    applying Lemma D.1 in <cite|liu_one_2023>, we have that with probability
    at least <math|1-\<delta\>>, for any <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>>,
    and <math|\<pi\>\<in\>\<Pi\>>, we have

    <\equation>
      -<frac|1|2><big|sum><rsub|s=1><rsup|k-1>X<rsub|h,\<pi\>><rsup|s>\<leq\><big|sum><rsub|s=1><rsup|k-1>log\<bbb-E\><around*|[|exp<around*|{|-<frac|1|2>X<rsub|h,\<pi\>><rsup|s>|}>\<mid\>\<cal-F\><rsub|h,s-1>|]>+log<around*|(|H<around*|\||\<Pi\>|\|>/\<delta\>|)>.<label|eq:union-bound>
    </equation>

    Meanwhile, by (B.27) in <cite|liu_one_2023>, for any
    <math|\<mu\><rsup|s>\<in\>BR<around*|(|\<pi\><rsup|s>|)>>, the
    conditional expectation equals to

    <\equation>
      \<bbb-E\><around*|[|exp<around*|{|-<frac|1|2>X<rsub|h,\<pi\>><rsup|s>|}>\<mid\>\<cal-F\><rsub|h,s-1>|]>=1-\<bbb-E\><rsub|<around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>\<sim\>\<mu\><rsup|s>><around*|[|D<rsub|H><around*|(|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)><around*|\|||\|>\<bbb-P\><rsub|h,\<pi\>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>|)>|]>.<label|eq:cond-exp>
    </equation>

    Denote <math| \<bbb-E\><rsub|<around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>\<sim\>\<mu\><rsup|s>><around*|[|D<rsub|H><around*|(|\<bbb-P\><rsub|h,\<pi\><rsup|\<ast\>>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)><around*|\|||\|>\<bbb-P\><rsub|h,\<pi\><rsup|s>><around*|(|\<cdot\>\<mid\>s<rsub|h><rsup|s>,a<rsub|h><rsup|s>|)>|)>|]>>
    as <math|\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>>.
    Using the fact <math|log<around*|(|x|)>\<leq\>x-1> and substituting
    <eqref|eq:cond-exp> into <eqref|eq:union-bound> finishes the proof.
  </proof>

  <\lemma>
    If <math|a=argmax<rsub|x\<in\>\<cal-X\>>
    <around*|[|f<around*|(|x|)>+g<around*|(|x|)>|]>> and
    <math|b=argmax<rsub|x\<in\>\<cal-X\>> f<around*|(|x|)>>, then,
    <math|f<around*|(|b|)>\<geq\>f<around*|(|a|)>> and

    <\equation*>
      f<around*|(|b|)>-f<around*|(|a|)>\<geq\>g<around*|(|b|)>-g<around*|(|a|)>.
    </equation*>
  </lemma>

  <\proof>
    By definition,

    <\equation*>
      f<around*|(|a|)>+g<around*|(|a|)>\<geq\>f<around*|(|x|)>+g<around*|(|x|)>
    </equation*>

    for all <math|x\<in\>\<cal-X\>>. Let <math|x=b>, we have

    <\equation*>
      f<around*|(|a|)>+g<around*|(|a|)>\<geq\>f<around*|(|b|)>+g<around*|(|b|)>.
    </equation*>

    Rearranging the above formula gives us

    <\equation*>
      f<around*|(|b|)>-f<around*|(|a|)>\<geq\>g<around*|(|b|)>-g<around*|(|a|)>.
    </equation*>

    Similarly, by definition

    <\equation*>
      f<around*|(|b|)>\<geq\>f<around*|(|x|)>
    </equation*>

    for all <math|x\<in\>\<cal-X\>>. Let <math|x=a> gives
    <math|f<around*|(|b|)>\<geq\>f<around*|(|a|)>>
  </proof>

  <subsection|Proof of Theorem <reference|thm:fin>><label|app:thm-fin>

  <\proof>
    We decompose the regret into two terms,\ 

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>\<triangleq\>>|<cell|<big|sum><rsub|k=1><rsup|K><rsub|>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>>>|<row|<cell|=>|<cell|<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>|\<wide-underbrace\>><rsub|<text|Term
      (i)> >+<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<text|Term
      <around*|(|ii|)>>>.>>>>
    </align>

    <with|font-series|bold|Term (i).> By the choice of <math|\<pi\><rsup|k>>,
    we have

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
    </equation*>

    for all <math|k\<in\><around*|[|K|]>>. Thus,

    <\equation>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.<label|eq:gen-error>
    </equation>

    \;

    for any <math|\<pi\><rsup|k><above|\<sim\>|\<psi\>>\<pi\><rsup|k<rprime|'>>>,
    we have\ 

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>=V<around*|(|\<psi\><around*|(|\<pi\><rsup|k<rprime|'>>|)>,\<pi\><rsup|k><rprime|'>|)>.
    </equation*>

    Thus, an upper bound for <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>>
    is also an upper bound for <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>><rsup|*>|)>-V<around*|(|\<mu\><rsup|k<rprime|'>>,\<pi\><rsup|k<rprime|'>>|)>>.
    Applying Lemma <reference|lem:loss-upperbound>, we have that with
    probability at least <math|1-\<delta\>>, for any
    <math|<around*|(|h,k|)>\<in\><around*|[|H|]>\<times\><around*|[|K|]>><math|>,
    <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>> and
    <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|fin>>,

    <\align>
      <tformat|<table|<row|<cell|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>\<leq\>>|<cell|-2<big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2log<around*|(|H
      n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.>>>>
    </align>

    Substituting the above equation into <eqref|eq:gen-error> gives us that
    with probability at least <math|1-\<delta\>>, for any
    <math|k\<in\><around*|[|K|]>>, <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>
    and <math|\<pi\><rsup|k>\<in\>\<cal-H\><rsub|fin>>

    <\equation*>
      <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>>-V<around*|(|\<mu\><rsup|k>,\<pi\><rsup|k>|)>\<leq\>-2\<eta\><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2H\<eta\>log<around*|(|H
      n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.
    </equation*>

    Summing over <math|<around*|[|K|]>> gives us

    <\equation*>
      <text|Term (i)>\<leq\>-2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+2\<eta\>
      K H log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>.
    </equation*>

    <with|font-series|bold|Term (ii).> Follow the proof of Theorem 4.4 in
    <cite|liu_one_2023>, we have that for all
    <math|\<mu\><rsup|s>=\<psi\><around*|(|\<pi\><rsup|s>|)>>

    <\equation*>
      Term <around*|(|ii|)>\<leq\>2\<eta\><big|sum><rsub|k=1><rsup|K><big|sum><rsub|h=1><rsup|H><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><rsub|\<pi\><rsup|s>><around*|(|\<pi\>;\<xi\><rsub|h>|)>|]>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K.
    </equation*>

    <with|font-series|bold|Combining Term (i) and Term (ii).>

    <\align>
      <tformat|<table|<row|<cell|Regret<around*|(|K|)>=>|<cell|<text|Term
      (i)>+<text|Term (ii)>>>|<row|<cell|\<leq\>>|<cell|2\<eta\> K H
      log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>+<frac|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>|8\<eta\>>+<sqrt|d<rsub|GEC><around*|(|\<varepsilon\><rsub|conf>|)>H
      K>+\<varepsilon\><rsub|conf>H K.>>>>
    </align>

    Set <math|\<varepsilon\><rsub|conf>=1/<sqrt|H K>> and

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\><rsub|fin>|)>/\<delta\>|)>\<cdot\>H
      K>>
    </equation*>

    leads to the proof.
  </proof>

  <section|Do Not Read The Following>

  An optimal policy is denoted as <math|<around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>>
  and defined by

  <\equation*>
    <around*|(|\<mu\><rsup|\<ast\>>,\<pi\><rsup|\<ast\>>|)>\<in\><below|argmax|<around*|(|\<mu\>,\<pi\>|)>\<in\>\<cal-U\>\<times\>\<Pi\>>
    V<around*|(|\<mu\>,\<pi\>|)>.
  </equation*>

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|66>
      <bibitem*|1><label|bib-agarwal_optimality_2020>Alekh Agarwal,
      Sham<nbsp>M.<nbsp>Kakade, Jason<nbsp>D.<nbsp>Lee<localize|, and >Gaurav
      Mahajan. <newblock>Optimality and Approximation with Policy Gradient
      Methods in Markov Decision Processes. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of Thirty Third Conference on
      Learning Theory>, <localize|pages >64-66. PMLR, jul 2020.<newblock>

      <bibitem*|2><label|bib-agarwal_model-based_2022>Alekh Agarwal<localize|
      and >Tong Zhang. <newblock>Model-based RL with Optimistic Posterior
      Sampling: Structural Conditions and Sample Complexity. <newblock>oct
      2022.<newblock>

      <bibitem*|3><label|bib-agarwal_non-linear_2022>Alekh Agarwal<localize|
      and >Tong Zhang. <newblock>Non-Linear Reinforcement Learning in Large
      Action Spaces: Structural Conditions and Sample-efficiency of Posterior
      Sampling. <newblock><localize|In ><with|font-shape|italic|Proceedings
      of Thirty Fifth Conference on Learning Theory>, <localize|pages
      >2776-2814. PMLR, jun 2022.<newblock>

      <bibitem*|4><label|bib-agrawal_posterior_2020>Shipra Agrawal<localize|
      and >Randy Jia. <newblock>Posterior sampling for reinforcement
      learning: worst-case regret bounds. <newblock>mar 2020.<newblock>

      <bibitem*|5><label|bib-albrecht_belief_2016>Stefano<nbsp>V.<nbsp>Albrecht,
      Jacob<nbsp>W.<nbsp>Crandall<localize|, and >Subramanian Ramamoorthy.
      <newblock>Belief and Truth in Hypothesised Behaviours.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 235:63-94,
      jun 2016.<newblock>

      <bibitem*|6><label|bib-albrecht_game-theoretic_2015>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Subramanian Ramamoorthy. <newblock>A Game-Theoretic Model and
      Best-Response Learning Method for Ad Hoc Coordination in Multiagent
      Systems. <newblock>jun 2015.<newblock>

      <bibitem*|7><label|bib-albrecht_autonomous_2018>Stefano<nbsp>V.<nbsp>Albrecht<localize|
      and >Peter Stone. <newblock>Autonomous agents modelling other agents: A
      comprehensive survey and open problems.
      <newblock><with|font-shape|italic|Artificial Intelligence>, 258:66-95,
      may 2018.<newblock>

      <bibitem*|8><label|bib-asadi_lipschitz_2018>Kavosh Asadi, Dipendra
      Misra<localize|, and >Michael<nbsp>L.<nbsp>Littman. <newblock>Lipschitz
      Continuity in Model-based Reinforcement Learning. <newblock>jul
      2018.<newblock>

      <bibitem*|9><label|bib-astrom_optimal_1965>K.J �str�m.
      <newblock>Optimal control of Markov processes with incomplete state
      information. <newblock><with|font-shape|italic|Journal of Mathematical
      Analysis and Applications>, 10(1):174-205, feb 1965.<newblock>

      <bibitem*|10><label|bib-auer_near-optimal_2008>Peter Auer, Thomas
      Jaksch<localize|, and >Ronald Ortner. <newblock>Near-optimal Regret
      Bounds for Reinforcement Learning. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>21. Curran Associates, Inc.,
      2008.<newblock>

      <bibitem*|11><label|bib-azar_minimax_2017>Mohammad<nbsp>Gheshlaghi
      Azar, Ian Osband<localize|, and >R�mi Munos. <newblock>Minimax Regret
      Bounds for Reinforcement Learning. <newblock>jul 2017.<newblock>

      <bibitem*|12><label|bib-barrett_making_2017>Samuel Barrett, Avi
      Rosenfeld, Sarit Kraus<localize|, and >Peter Stone. <newblock>Making
      friends on the fly: Cooperating with new teammates.
      <newblock><with|font-shape|italic|Artificial Intelligence>,
      242:132-171, jan 2017.<newblock>

      <bibitem*|13><label|bib-ben-davidAgnosticOnlineLearning2009>Shai
      Ben-David, D.<nbsp>P�l<localize|, and >S.<nbsp>Shalev-Shwartz.
      <newblock>Agnostic Online Learning. <newblock><localize|In
      ><with|font-shape|italic|Annual Conference Computational Learning
      Theory>. 2009.<newblock>

      <bibitem*|14><label|bib-bertuccelli_robust_2012>Luca<nbsp>F.<nbsp>Bertuccelli,
      Albert Wu<localize|, and >Jonathan<nbsp>P.<nbsp>How. <newblock>Robust
      Adaptive Markov Decision Processes: Planning with Model Uncertainty.
      <newblock><with|font-shape|italic|IEEE Control Systems Magazine>,
      32(5):96-109, oct 2012.<newblock>

      <bibitem*|15><label|bib-brunskill_sample_2013>Emma Brunskill<localize|
      and >Lihong Li. <newblock>Sample Complexity of Multi-task Reinforcement
      Learning. <newblock>sep 2013.<newblock>

      <bibitem*|16><label|bib-buchholz_computation_2019>Peter
      Buchholz<localize| and >Dimitri Scheftelowitsch. <newblock>Computation
      of weighted sums of rewards for concurrent MDPs.
      <newblock><with|font-shape|italic|Math Meth Oper Res>, 89(1):1-42, feb
      2019.<newblock>

      <bibitem*|17><label|bib-carroll_utility_2019>Micah Carroll, Rohin Shah,
      Mark<nbsp>K.<nbsp>Ho, Thomas<nbsp>L.<nbsp>Griffiths,
      Sanjit<nbsp>A.<nbsp>Seshia, Pieter Abbeel<localize|, and >Anca Dragan.
      <newblock>On the Utility of Learning about Humans for Human-AI
      Coordination. <newblock>Oct 2019.<newblock>

      <bibitem*|18><label|bib-chades_momdps_2012>Iadine Chades, Josie
      Carwardine, Tara Martin, Samuel Nicol, Regis Sabbadin<localize|, and
      >Olivier Buffet. <newblock>MOMDPs: A Solution for Modelling Adaptive
      Management Problems. <newblock><with|font-shape|italic|Proceedings of
      the AAAI Conference on Artificial Intelligence>, 26(1):267-273,
      2012.<newblock>

      <bibitem*|19><label|bib-dong_q-learning_2019>Kefan Dong, Yuanhao Wang,
      Xiaoyu Chen<localize|, and >Liwei Wang. <newblock>Q-learning with UCB
      Exploration is Sample Efficient for Infinite-Horizon MDP. <newblock>sep
      2019.<newblock>

      <bibitem*|20><label|bib-doshi-velez_hidden_2013>Finale
      Doshi-Velez<localize| and >George Konidaris. <newblock>Hidden Parameter
      Markov Decision Processes: A Semiparametric Regression Approach for
      Discovering Latent Task Parametrizations. <newblock>aug 2013.<newblock>

      <bibitem*|21><label|bib-du_bilinear_2021>Simon<nbsp>S.<nbsp>Du,
      Sham<nbsp>M.<nbsp>Kakade, Jason<nbsp>D.<nbsp>Lee, Shachar Lovett,
      Gaurav Mahajan, Wen Sun<localize|, and >Ruosong Wang.
      <newblock>Bilinear Classes: A Structural Framework for Provable
      Generalization in RL. <newblock>jul 2021.<newblock>

      <bibitem*|22><label|bib-duff_optimal_2002>Michael<nbsp>O'Gordon Duff.
      <newblock>Optimal learning: Computational procedures for Bayes
      -adaptive Markov decision processes.
      <newblock><with|font-shape|italic|Doctoral Dissertations Available from
      Proquest>, <localize|pages >1-247, jan 2002.<newblock>

      <bibitem*|23><label|bib-fern_decision-theoretic_2014>A.<nbsp>Fern,
      S.<nbsp>Natarajan, K.<nbsp>Judah<localize|, and >P.<nbsp>Tadepalli.
      <newblock>A Decision-Theoretic Model of Assistance.
      <newblock><with|font-shape|italic|Journal of Artificial Intelligence
      Research>, 50:71-104, may 2014.<newblock>

      <bibitem*|24><label|bib-foerster_counterfactual_2017>Jakob Foerster,
      Gregory Farquhar, Triantafyllos Afouras, Nantas Nardelli<localize|, and
      >Shimon Whiteson. <newblock>Counterfactual Multi-Agent Policy
      Gradients. <newblock>dec 2017.<newblock>

      <bibitem*|25><label|bib-gmytrasiewicz_framework_2005>P.<nbsp>J.<nbsp>Gmytrasiewicz<localize|
      and >P.<nbsp>Doshi. <newblock>A Framework for Sequential Planning in
      Multi-Agent Settings. <newblock><with|font-shape|italic|Journal of
      Artificial Intelligence Research>, 24:49-79, jul 2005.<newblock>

      <bibitem*|26><label|bib-guez_efficient_2012>Arthur Guez, David
      Silver<localize|, and >Peter Dayan. <newblock>Efficient Bayes-adaptive
      reinforcement learning using sample-based search.
      <newblock><localize|In ><with|font-shape|italic|Proceedings of the 25th
      International Conference on Neural Information Processing Systems -
      Volume 1>, NIPS'12, <localize|pages >1025-1033. Red Hook, NY, USA, dec
      2012. Curran Associates Inc.<newblock>

      <bibitem*|27><label|bib-hallak_contextual_2015>Assaf Hallak, Dotan Di
      Castro<localize|, and >Shie Mannor. <newblock>Contextual Markov
      Decision Processes. <newblock>feb 2015.<newblock>

      <bibitem*|28><label|bib-han_learning_2018>Yanlin Han<localize| and
      >Piotr Gmytrasiewicz. <newblock>Learning Others' Intentional Models in
      Multi-Agent Settings Using Interactive POMDPs. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>31. Curran Associates, Inc.,
      2018.<newblock>

      <bibitem*|29><label|bib-he_opponent_2016>He He, Jordan Boyd-Graber,
      Kevin Kwok<localize|, and >Hal Daum� III. <newblock>Opponent Modeling
      in Deep Reinforcement Learning. <newblock>sep 2016.<newblock>

      <bibitem*|30><label|bib-jiang_contextual_2016>Nan Jiang, Akshay
      Krishnamurthy, Alekh Agarwal, John Langford<localize|, and
      >Robert<nbsp>E.<nbsp>Schapire. <newblock>Contextual Decision Processes
      with Low Bellman Rank are PAC-Learnable. <newblock>dec 2016.<newblock>

      <bibitem*|31><label|bib-jin_is_2018>Chi Jin, Zeyuan Allen-Zhu,
      Sebastien Bubeck<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Is Q-learning Provably Efficient? <newblock>jul
      2018.<newblock>

      <bibitem*|32><label|bib-jin_bellman_2021>Chi Jin, Qinghua
      Liu<localize|, and >Sobhan Miryoosefi. <newblock>Bellman Eluder
      Dimension: New Rich Classes of RL Problems, and Sample-Efficient
      Algorithms. <newblock>jul 2021.<newblock>

      <bibitem*|33><label|bib-jin_provably_2020>Chi Jin, Zhuoran Yang,
      Zhaoran Wang<localize|, and >Michael<nbsp>I.<nbsp>Jordan.
      <newblock>Provably efficient reinforcement learning with linear
      function approximation. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of Thirty Third Conference on
      Learning Theory>, <localize|pages >2137-2143. PMLR, jul 2020.<newblock>

      <bibitem*|34><label|bib-karimi_non-asymptotic_2019>Belhal Karimi,
      Blazej Miasojedow, Eric Moulines<localize|, and >Hoi-To Wai.
      <newblock>Non-asymptotic Analysis of Biased Stochastic Approximation
      Scheme. <newblock><localize|In ><with|font-shape|italic|Proceedings of
      the Thirty-Second Conference on Learning Theory>, <localize|pages
      >1944-1974. PMLR, jun 2019.<newblock>

      <bibitem*|35><label|bib-kwon_rl_2021>Jeongyeol Kwon, Yonathan Efroni,
      Constantine Caramanis<localize|, and >Shie Mannor. <newblock>RL for
      Latent MDPs: Regret Guarantees and a Lower Bound. <newblock>feb
      2021.<newblock>

      <bibitem*|36><label|bib-lai_asymptotically_1985>T.<nbsp>L Lai<localize|
      and >Herbert Robbins. <newblock>Asymptotically efficient adaptive
      allocation rules. <newblock><with|font-shape|italic|Advances in Applied
      Mathematics>, 6(1):4-22, mar 1985.<newblock>

      <bibitem*|37><label|bib-liu_pac_2016>Yao Liu, Zhaohan Guo<localize|,
      and >Emma Brunskill. <newblock>PAC Continuous State Online Multitask
      Reinforcement Learning with Identification. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 2016 International
      Conference on Autonomous Agents & Multiagent Systems>, AAMAS '16,
      <localize|pages >438-446. Richland, SC, may 2016. International
      Foundation for Autonomous Agents and Multiagent Systems.<newblock>

      <bibitem*|38><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong,
      Han Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|,
      and >Zhaoran Wang. <newblock>One Objective to Rule Them All: A
      Maximization Objective Fusing Estimation and Planning for Exploration.
      <newblock>may 2023.<newblock>

      <bibitem*|39><label|bib-lockhart_human-agent_2020>Edward Lockhart, Neil
      Burch, Nolan Bard, Sebastian Borgeaud, Tom Eccles, Lucas
      Smaira<localize|, and >Ray Smith. <newblock>Human-Agent Cooperation in
      Bridge Bidding. <newblock>nov 2020.<newblock>

      <bibitem*|40><label|bib-baumeister_survey_2022>Reuth Mirsky, Ignacio
      Carlucho, Arrasy Rahman, Elliot Fosong, William Macke, Mohan Sridharan,
      Peter Stone<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht. <newblock>A
      Survey of Ad Hoc Teamwork Research. <newblock><localize|In >Dorothea
      Baumeister<localize| and >J�rg Rothe<localize|, editors>,
      <with|font-shape|italic|Multi-Agent Systems>, <localize|volume> 13442,
      <localize|pages >275-293. Springer International Publishing, Cham,
      2022.<newblock>

      <bibitem*|41><label|bib-monderer_potential_1996>Dov Monderer<localize|
      and >Lloyd<nbsp>S.<nbsp>Shapley. <newblock>Potential Games.
      <newblock><with|font-shape|italic|Games and Economic Behavior>,
      14(1):124-143, may 1996.<newblock>

      <bibitem*|42><label|bib-nikolaidis_human-robot_2017>Stefanos
      Nikolaidis, David Hsu<localize|, and >Siddhartha Srinivasa.
      <newblock>Human-robot mutual adaptation in collaborative tasks: Models
      and experiments. <newblock><with|font-shape|italic|The International
      Journal of Robotics Research>, 36(5-7):618-634, jun 2017.<newblock>

      <bibitem*|43><label|bib-ong_planning_2010>Sylvie<nbsp>C.<nbsp>W.<nbsp>Ong,
      Shao<nbsp>Wei Png, David Hsu<localize|, and >Wee<nbsp>Sun Lee.
      <newblock>Planning under Uncertainty for Robotic Tasks with Mixed
      Observability. <newblock><with|font-shape|italic|Int. J. Rob. Res.>,
      29(8):1053-1068, jul 2010.<newblock>

      <bibitem*|44><label|bib-osband_model-based_2014>Ian Osband<localize|
      and >Benjamin Van Roy. <newblock>Model-based Reinforcement Learning and
      the Eluder Dimension. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>27. Curran Associates, Inc.,
      2014.<newblock>

      <bibitem*|45><label|bib-rahman_generating_2023>Arrasy Rahman, Elliot
      Fosong, Ignacio Carlucho<localize|, and >Stefano<nbsp>V.<nbsp>Albrecht.
      <newblock>Generating Teammates for Training Robust Ad Hoc Teamwork
      Agents via Best-Response Diversity.
      <newblock><with|font-shape|italic|Transactions on Machine Learning
      Research>, may 2023.<newblock>

      <bibitem*|46><label|bib-ross_agnostic_2012>Stephane Ross<localize| and
      >J.<nbsp>Andrew Bagnell. <newblock>Agnostic System Identification for
      Model-Based Reinforcement Learning.
      <newblock><with|font-shape|italic|ArXiv:1203.1007 [cs, stat]>, jul
      2012.<newblock>

      <bibitem*|47><label|bib-russo_learning_2014>Daniel Russo<localize| and
      >Benjamin Van Roy. <newblock>Learning to Optimize Via Posterior
      Sampling. <newblock>feb 2014.<newblock>

      <bibitem*|48><label|bib-smallwood_optimal_1973>Richard<nbsp>D.<nbsp>Smallwood<localize|
      and >Edward<nbsp>J.<nbsp>Sondik. <newblock>The Optimal Control of
      Partially Observable Markov Processes Over a Finite Horizon.
      <newblock><with|font-shape|italic|Operations Research>,
      21(5):1071-1088, 1973.<newblock>

      <bibitem*|49><label|bib-steimle_multi-model_2021>Lauren<nbsp>N.<nbsp>Steimle,
      David<nbsp>L.<nbsp>Kaufman<localize|, and >Brian<nbsp>T.<nbsp>Denton.
      <newblock>Multi-model Markov decision processes.
      <newblock><with|font-shape|italic|IISE Transactions>, <localize|pages
      >1-16, may 2021.<newblock>

      <bibitem*|50><label|bib-stone_ad_2010>Peter Stone, Gal Kaminka, Sarit
      Kraus<localize|, and >Jeffrey Rosenschein. <newblock>Ad Hoc Autonomous
      Agent Teams: Collaboration without Pre-Coordination.
      <newblock><with|font-shape|italic|AAAI>, 24(1):1504-1509, jul
      2010.<newblock>

      <bibitem*|51><label|bib-strehl_analysis_2008>Alexander<nbsp>L.<nbsp>Strehl<localize|
      and >Michael<nbsp>L.<nbsp>Littman. <newblock>An analysis of model-based
      Interval Estimation for Markov Decision Processes.
      <newblock><with|font-shape|italic|Journal of Computer and System
      Sciences>, 74(8):1309-1331, dec 2008.<newblock>

      <bibitem*|52><label|bib-strouse_collaborating_2022>D.<nbsp>J.<nbsp>Strouse,
      Kevin<nbsp>R.<nbsp>McKee, Matt Botvinick, Edward Hughes<localize|, and
      >Richard Everett. <newblock>Collaborating with Humans without Human
      Data. <newblock>jan 2022.<newblock>

      <bibitem*|53><label|bib-sutton_policy_1999>Richard<nbsp>S Sutton, David
      McAllester, Satinder Singh<localize|, and >Yishay Mansour.
      <newblock>Policy Gradient Methods for Reinforcement Learning with
      Function Approximation. <newblock><localize|In
      ><with|font-shape|italic|Advances in Neural Information Processing
      Systems>, <localize|volume><nbsp>12. MIT Press, 1999.<newblock>

      <bibitem*|54><label|bib-taylor_transfer_2009>Matthew<nbsp>E.<nbsp>Taylor<localize|
      and >Peter Stone. <newblock>Transfer Learning for Reinforcement
      Learning Domains: A Survey. <newblock><with|font-shape|italic|J. Mach.
      Learn. Res.>, 10:1633-1685, dec 2009.<newblock>

      <bibitem*|55><label|bib-thompson_likelihood_1933>William<nbsp>R.<nbsp>Thompson.
      <newblock>On the Likelihood that One Unknown Probability Exceeds
      Another in View of the Evidence of Two Samples.
      <newblock><with|font-shape|italic|Biometrika>, 25(3/4):285-294,
      1933.<newblock>

      <bibitem*|56><label|bib-tylkin_learning_2021>Paul Tylkin, Goran
      Radanovic<localize|, and >David<nbsp>C Parkes. <newblock>Learning
      Robust Helpful Behaviors in Two-Player Cooperative Atari Environments.
      <newblock>2021.<newblock>

      <bibitem*|57><label|bib-white_bayesian_1969>D.<nbsp>J.<nbsp>White.
      <newblock>Bayesian Decision Problems and Markov Chains.
      <newblock><with|font-shape|italic|Royal Statistical Society. Journal.
      Series A: General>, 132(1):106-107, jan 1969.<newblock>

      <bibitem*|58><label|bib-xie_learning_2020>Annie Xie,
      Dylan<nbsp>P.<nbsp>Losey, Ryan Tolsma, Chelsea Finn<localize|, and
      >Dorsa Sadigh. <newblock>Learning Latent Representations to Influence
      Multi-Agent Interaction. <newblock>nov 2020.<newblock>

      <bibitem*|59><label|bib-xu_sample_2021>Pan Xu, Felicia Gao<localize|,
      and >Quanquan Gu. <newblock>Sample Efficient Policy Gradient Methods
      with Recursive Variance Reduction. <newblock>aug 2021.<newblock>

      <bibitem*|60><label|bib-yang_sample-optimal_2019>Lin Yang<localize| and
      >Mengdi Wang. <newblock>Sample-Optimal Parametric Q-Learning Using
      Linearly Additive Features. <newblock><localize|In
      ><with|font-shape|italic|Proceedings of the 36th International
      Conference on Machine Learning>, <localize|pages >6995-7004. PMLR, may
      2019.<newblock>

      <bibitem*|61><label|bib-yao_smixlambda_2020>Xinghu Yao, Chao Wen, Yuhui
      Wang<localize|, and >Xiaoyang Tan. <newblock>SMIX($\\ lambda$):
      Enhancing Centralized Value Functions for Cooperative Multi-Agent
      Reinforcement Learning. <newblock>aug 2020.<newblock>

      <bibitem*|62><label|bib-zanette_learning_2020>Andrea Zanette,
      Alessandro Lazaric, Mykel Kochenderfer<localize|, and >Emma Brunskill.
      <newblock>Learning Near Optimal Policies with Low Inherent Bellman
      Error. <newblock><localize|In ><with|font-shape|italic|Proceedings of
      the 37th International Conference on Machine Learning>, <localize|pages
      >10978-10989. PMLR, nov 2020.<newblock>

      <bibitem*|63><label|bib-zhang_global_2020>Kaiqing Zhang, Alec Koppel,
      Hao Zhu<localize|, and >Tamer Ba�ar. <newblock>Global Convergence of
      Policy Gradient Methods to (Almost) Locally Optimal Policies.
      <newblock><with|font-shape|italic|SIAM J. Control Optim.>,
      58(6):3586-3612, jan 2020.<newblock>

      <bibitem*|64><label|bib-zhang_multi-agent_2021>Kaiqing Zhang, Zhuoran
      Yang<localize|, and >Tamer Ba�ar. <newblock>Multi-Agent Reinforcement
      Learning: A Selective Overview of Theories and Algorithms.
      <newblock>apr 2021.<newblock>

      <bibitem*|65><label|bib-zhang_feel-good_2021>Tong Zhang.
      <newblock>Feel-Good Thompson Sampling for Contextual Bandits and
      Reinforcement Learning. <newblock>oct 2021.<newblock>

      <bibitem*|66><label|bib-zhong_gec_2023>Han Zhong, Wei Xiong, Sirui
      Zheng, Liwei Wang, Zhaoran Wang, Zhuoran Yang<localize|, and >Tong
      Zhang. <newblock>GEC: A Unified Framework for Interactive Decision
      Making in MDP, POMDP, and Beyond. <newblock>jun 2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|app:thm-fin|<tuple|8.2|10>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|5.1|5>>
    <associate|auto-11|<tuple|5.2|6>>
    <associate|auto-12|<tuple|6|7>>
    <associate|auto-13|<tuple|6.1|7>>
    <associate|auto-14|<tuple|6.2|8>>
    <associate|auto-15|<tuple|7|9>>
    <associate|auto-16|<tuple|7.1|9>>
    <associate|auto-17|<tuple|7.2|9>>
    <associate|auto-18|<tuple|8|10>>
    <associate|auto-19|<tuple|8.1|11>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-20|<tuple|8.2|11>>
    <associate|auto-21|<tuple|9|?>>
    <associate|auto-22|<tuple|9|?>>
    <associate|auto-23|<tuple|9|?>>
    <associate|auto-3|<tuple|3|3>>
    <associate|auto-4|<tuple|3.1|3>>
    <associate|auto-5|<tuple|3.2|4>>
    <associate|auto-6|<tuple|4|4>>
    <associate|auto-7|<tuple|4.1|4>>
    <associate|auto-8|<tuple|4.2|4>>
    <associate|auto-9|<tuple|5|5>>
    <associate|bib-agarwal_model-based_2022|<tuple|2|11>>
    <associate|bib-agarwal_non-linear_2022|<tuple|3|11>>
    <associate|bib-agarwal_optimality_2020|<tuple|1|11>>
    <associate|bib-agrawal_posterior_2020|<tuple|4|11>>
    <associate|bib-albrecht_autonomous_2018|<tuple|7|11>>
    <associate|bib-albrecht_belief_2016|<tuple|5|11>>
    <associate|bib-albrecht_game-theoretic_2015|<tuple|6|11>>
    <associate|bib-asadi_lipschitz_2018|<tuple|8|11>>
    <associate|bib-astrom_optimal_1965|<tuple|9|11>>
    <associate|bib-auer_near-optimal_2008|<tuple|10|11>>
    <associate|bib-azar_minimax_2017|<tuple|11|11>>
    <associate|bib-barrett_making_2017|<tuple|12|12>>
    <associate|bib-baumeister_survey_2022|<tuple|40|12>>
    <associate|bib-ben-davidAgnosticOnlineLearning2009|<tuple|13|12>>
    <associate|bib-bertuccelli_robust_2012|<tuple|14|12>>
    <associate|bib-brunskill_sample_2013|<tuple|15|12>>
    <associate|bib-buchholz_computation_2019|<tuple|16|12>>
    <associate|bib-carroll_utility_2019|<tuple|17|12>>
    <associate|bib-chades_momdps_2012|<tuple|18|12>>
    <associate|bib-dong_q-learning_2019|<tuple|19|12>>
    <associate|bib-doshi-velez_hidden_2013|<tuple|20|12>>
    <associate|bib-du_bilinear_2021|<tuple|21|12>>
    <associate|bib-duff_optimal_2002|<tuple|22|12>>
    <associate|bib-fern_decision-theoretic_2014|<tuple|23|12>>
    <associate|bib-foerster_counterfactual_2017|<tuple|24|12>>
    <associate|bib-gmytrasiewicz_framework_2005|<tuple|25|12>>
    <associate|bib-guez_efficient_2012|<tuple|26|12>>
    <associate|bib-hallak_contextual_2015|<tuple|27|12>>
    <associate|bib-han_learning_2018|<tuple|28|12>>
    <associate|bib-he_opponent_2016|<tuple|29|12>>
    <associate|bib-jiang_contextual_2016|<tuple|30|12>>
    <associate|bib-jin_bellman_2021|<tuple|32|12>>
    <associate|bib-jin_is_2018|<tuple|31|12>>
    <associate|bib-jin_provably_2020|<tuple|33|12>>
    <associate|bib-karimi_non-asymptotic_2019|<tuple|34|12>>
    <associate|bib-kwon_rl_2021|<tuple|35|12>>
    <associate|bib-lai_asymptotically_1985|<tuple|36|12>>
    <associate|bib-liu_one_2023|<tuple|38|12>>
    <associate|bib-liu_pac_2016|<tuple|37|12>>
    <associate|bib-lockhart_human-agent_2020|<tuple|39|12>>
    <associate|bib-monderer_potential_1996|<tuple|41|13>>
    <associate|bib-nikolaidis_human-robot_2017|<tuple|42|13>>
    <associate|bib-ong_planning_2010|<tuple|43|13>>
    <associate|bib-osband_model-based_2014|<tuple|44|13>>
    <associate|bib-rahman_generating_2023|<tuple|45|13>>
    <associate|bib-ross_agnostic_2012|<tuple|46|13>>
    <associate|bib-russo_learning_2014|<tuple|47|13>>
    <associate|bib-smallwood_optimal_1973|<tuple|48|13>>
    <associate|bib-steimle_multi-model_2021|<tuple|49|13>>
    <associate|bib-stone_ad_2010|<tuple|50|13>>
    <associate|bib-strehl_analysis_2008|<tuple|51|13>>
    <associate|bib-strouse_collaborating_2022|<tuple|52|13>>
    <associate|bib-sutton_policy_1999|<tuple|53|13>>
    <associate|bib-taylor_transfer_2009|<tuple|54|13>>
    <associate|bib-thompson_likelihood_1933|<tuple|55|13>>
    <associate|bib-tylkin_learning_2021|<tuple|56|13>>
    <associate|bib-white_bayesian_1969|<tuple|57|13>>
    <associate|bib-xie_learning_2020|<tuple|58|13>>
    <associate|bib-xu_sample_2021|<tuple|59|13>>
    <associate|bib-yang_sample-optimal_2019|<tuple|60|13>>
    <associate|bib-yao_smixlambda_2020|<tuple|61|13>>
    <associate|bib-zanette_learning_2020|<tuple|62|13>>
    <associate|bib-zhang_feel-good_2021|<tuple|65|13>>
    <associate|bib-zhang_global_2020|<tuple|63|13>>
    <associate|bib-zhang_multi-agent_2021|<tuple|64|13>>
    <associate|bib-zhong_gec_2023|<tuple|66|13>>
    <associate|def:fin-cover|<tuple|10|7>>
    <associate|eq:cond-exp|<tuple|3|9>>
    <associate|eq:gec-condition|<tuple|1|5>>
    <associate|eq:gen-error|<tuple|4|10>>
    <associate|eq:st-condition|<tuple|7|6>>
    <associate|eq:union-bound|<tuple|2|9>>
    <associate|lem:loss-upperbound|<tuple|16|9>>
    <associate|sec:fin-hypo|<tuple|5|5>>
    <associate|sec:infi-hypo|<tuple|6|7>>
    <associate|sec:num|<tuple|7|9>>
    <associate|sec:type|<tuple|4|4>>
    <associate|thm:fin|<tuple|6|6>>
    <associate|thm:inf|<tuple|14|8>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      zhang_multi-agent_2021

      yao_smixlambda_2020

      foerster_counterfactual_2017

      baumeister_survey_2022

      albrecht_autonomous_2018

      stone_ad_2010

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      barrett_making_2017

      xie_learning_2020

      he_opponent_2016

      kwon_rl_2021

      hallak_contextual_2015

      brunskill_sample_2013

      liu_pac_2016

      taylor_transfer_2009

      brunskill_sample_2013

      liu_one_2023

      liu_one_2023

      carroll_utility_2019

      strouse_collaborating_2022

      monderer_potential_1996

      gmytrasiewicz_framework_2005

      jin_is_2018

      dong_q-learning_2019

      lai_asymptotically_1985

      zhong_gec_2023

      auer_near-optimal_2008

      nikolaidis_human-robot_2017

      tylkin_learning_2021

      lockhart_human-agent_2020

      carroll_utility_2019

      strouse_collaborating_2022

      rahman_generating_2023

      strouse_collaborating_2022

      baumeister_survey_2022

      albrecht_autonomous_2018

      stone_ad_2010

      barrett_making_2017

      he_opponent_2016

      albrecht_game-theoretic_2015

      albrecht_belief_2016

      xie_learning_2020

      astrom_optimal_1965

      smallwood_optimal_1973

      kwon_rl_2021

      hallak_contextual_2015

      steimle_multi-model_2021

      liu_pac_2016

      taylor_transfer_2009

      brunskill_sample_2013

      ong_planning_2010

      chades_momdps_2012

      doshi-velez_hidden_2013

      fern_decision-theoretic_2014

      buchholz_computation_2019

      han_learning_2018

      gmytrasiewicz_framework_2005

      white_bayesian_1969

      duff_optimal_2002

      guez_efficient_2012

      strehl_analysis_2008

      azar_minimax_2017

      liu_one_2023

      thompson_likelihood_1933

      russo_learning_2014

      zhong_gec_2023

      agarwal_model-based_2022

      zhang_feel-good_2021

      agarwal_non-linear_2022

      agrawal_posterior_2020

      jiang_contextual_2016

      bertuccelli_robust_2012

      zhong_gec_2023

      osband_model-based_2014

      jin_bellman_2021

      jiang_contextual_2016

      zanette_learning_2020

      du_bilinear_2021

      yang_sample-optimal_2019

      jin_provably_2020

      jin_bellman_2021

      ben-davidAgnosticOnlineLearning2009

      ross_agnostic_2012

      liu_one_2023

      monderer_potential_1996

      liu_one_2023

      zhong_gec_2023

      jiang_contextual_2016

      jin_bellman_2021

      zhong_gec_2023

      sutton_policy_1999

      asadi_lipschitz_2018

      karimi_non-asymptotic_2019

      zhang_global_2020

      xu_sample_2021

      agarwal_optimality_2020

      liu_one_2023

      liu_one_2023

      liu_one_2023

      liu_one_2023
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      (revised, please read)> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Related
      Work (haven't revise, do not read)>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Prerequisite>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Episodic Finite Horizon MDP
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Maximize to Explore
      Algorithm <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Classifying
      Different Types of Agents by Policies>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1<space|2spc>Best Response Oracle
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|4.2<space|2spc>Type Number
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Regret
      Analysis for Finite Hypothesis Set>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <with|par-left|<quote|1tab>|5.1<space|2spc>Generalized Eluder
      Coefficient <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|1tab>|5.2<space|2spc>Main Theorem: Finite
      Hypothesis Set <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Regret
      Analysis for Infinite Hypothesis Set>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1<space|2spc>Approximate an Infinite
      Hypothesis Set by a Finite Hypothesis Set
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|6.2<space|2spc>Main Theorem: Infinite
      Hypothesis Set <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>Numerical
      Experiments> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-15><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|8<space|2spc>Appendix>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16><vspace|0.5fn>

      <with|par-left|<quote|1tab>|8.1<space|2spc>Lemmas
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|8.2<space|2spc>Proof of Theorem
      <reference|thm:fin> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|9<space|2spc>Do
      Not Read The Following> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>