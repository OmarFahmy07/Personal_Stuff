Regarding assignment 5.2:

VIP: Notice en fel FSM mesh bene3mel 7esab ay failure y7sl fel hardware bta3 el system. Y3ny masalan e7na 3amleen 7esabna en el 2 sensors 3omrohom
ma haytala3o 1 homa el etnen fi nafs el wa2t, y3ny ya haytala3o 1 w 0, ya 0 w 1, ya2ema 0 w 0 lw el door still beyefta7 aw beye2fel. Nafs el kalam
bel nesba lel motors, mesh 3amleen 7esab eny masalan agy ashaghal el motor may2omsh. Tab ana ba2olak keda leeh? t3ala nemsek my solution keda 
fel combinational always block bta3 el next state logic, ta7dedan fi Move_Up case. E7na 3amlen if condition lw true roo7 IDLE otherwise roo7
Move_Up. Fa momken tes2al nafsak "Tyb lw Up_max = 1 && Dn_max == 0 fa keda da ma3nah en el door is completely open w bel taly el mafrood teb2a
next_state = IDLE, fa de tamam w mafhoma. B3d keda 2ayelo else roo7 3la Move_Up 3la tool. Tyb mesh el mafrood a3mel 7esab lw Up_max = 1 w Dn_max
= 1 eno yroo7 idle state masalan?". Aho, da keda failure fel sensors nafsaha enaha me3ala2a, el etnen metala3en 1, fa de 7aga mesh han handle-ha 
e7na, w bel taly bene3teberha 3omraha ma hate7sal. Momken bardo tes2al nafsak "Tyb ana aslan geet Move_Up de ezay? en el bab kan ma2fol w 7asal
activation, be ma3na en Up_max kanet be 0 w Dn_max kanet be 1 fa omt da5el fel Move_Up state. Nerga3 lel if, leeh mane3melsh 7esab en teb2a still
Up_max = 0 w Dn_max = 1?". Tany, ma3na en Up_max still be 0 w Dn_max still be 1 en keda although ana da5alt fel Move_Up state, el bab mafata7sh,
be ma3na en el Up_motor ma2amsh, w bel taly de keda bardo failure fel hardware mesh hane3mel 7esabo. Thus, e7na el 3amleen 7esabo actually fi el
if statement de heya en lw Up_max = 1 && Dn_max = 0 yeb2a keda el baab completely opened w bel taly aroo7 lel IDLE state, else yeb2a da ma3nah
en both sensors 2aryeen zeroes w bel taly el baab lesa beyefta7, fa hafdal fi nafs el state 3ashan afdal meshaghal el Up_motor fa el baab yekamel.