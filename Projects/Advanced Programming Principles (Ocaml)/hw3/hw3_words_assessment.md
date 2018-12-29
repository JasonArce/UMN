## Assessment for HW3 words

Run on October 20, 13:35:55 PM.

+ Pass: Change into directory "hw3".

+ Pass: Check that hw3 files compile without errors

## Feedback Tests (total possible value: 2)

+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   words "I am *not* 42 letters long"
   ```
   matches the pattern `["I"; "am"; "not"; "letters"; "long"]`.

   




+  _1.0_ / _1.0_ : Pass: 
Check that the result of evaluating
   ```
   words "one_word"
   ```
   matches the pattern `["one"; "word"]`.

   




#### Subtotal: _2.0_ / _2.0_

## Additional automated tests

+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words ">OE~erit#6NMo]$_9XX$z{0s0FuC^t;:-6/s5y&.(&|u;{nPUgl[N;Y$]%=w-*H~YB7e!qaV(km}}$.EE/H")
   ```
   matches the pattern ` (["OE"; "erit"; "NMo"; "XX"; "z"; "s"; "FuC"; "t"; "s"; "y"; "u"; "nPUgl"; "N"; "Y"; "w"; "H"; "YB"; "e"; "qaV"; "km"; "EE"; "H"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "bBOE*-RXdAEXs/:^^OMdKvsE(R6oX`QcDP{z6rci4MBr:cMqQ%:mkf|vh7.Z25HutI91b!A$cF")
   ```
   matches the pattern ` (["bBOE"; "RXdAEXs"; "OMdKvsE"; "R"; "oX"; "QcDP"; "z"; "rci"; "MBr"; "cMqQ"; "mkf"; "vh"; "Z"; "HutI"; "b"; "A"; "cF"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "[8_qZ)=DzoI%u^Lc!sleq*}[up;|fqP^|!UDo8S@5:js(`$1h?-oT0sc}m&[1AC)^#)zO[U_fXYEzy/4%AafCp(wEuh.^")
   ```
   matches the pattern ` (["qZ"; "DzoI"; "u"; "Lc"; "sleq"; "up"; "fqP"; "UDo"; "S"; "js"; "h"; "oT"; "sc"; "m"; "AC"; "zO"; "U"; "fXYEzy"; "AafCp"; "wEuh"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "ak:X}B{<Wv_.2&^h!OrNk8!aKh`Dv>zRD")
   ```
   matches the pattern ` (["ak"; "X"; "B"; "Wv"; "h"; "OrNk"; "aKh"; "Dv"; "zRD"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "L[@;uQ~l&eaXsE5&jP>AO)tSSbd(~I]FQ3y[`9EWAb,|?j}2X)EVI|vKH%2NEs=Ulf8(%im#]Pa@h)~/g")
   ```
   matches the pattern ` (["L"; "uQ"; "l"; "eaXsE"; "jP"; "AO"; "tSSbd"; "I"; "FQ"; "y"; "EWAb"; "j"; "X"; "EVI"; "vKH"; "NEs"; "Ulf"; "im"; "Pa"; "h"; "g"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "Iex{<m/.b4LNoG(yH?c>P?EedG)2Yf=)5H&`,7NpL.W=cqIF[$42;2|VUnaBpj7<>zQH8@P1qh-_z")
   ```
   matches the pattern ` (["Iex"; "m"; "b"; "LNoG"; "yH"; "c"; "P"; "EedG"; "Yf"; "H"; "NpL"; "W"; "cqIF"; "VUnaBpj"; "zQH"; "P"; "qh"; "z"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "w~3[{,~o2m8iN_-L`x=jv}~Gd3jFo~dTtcY!{~L9MMXINi9s64^G81GjY+Zd80[LyO9lptQY:s")
   ```
   matches the pattern ` (["w"; "o"; "m"; "iN"; "L"; "x"; "jv"; "Gd"; "jFo"; "dTtcY"; "L"; "MMXINi"; "s"; "G"; "GjY"; "Zd"; "LyO"; "lptQY"; "s"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "I>MbAU0Ilzy5HM=G=uj~]<z,8dnuDVB>#{rh]8@31dU9rf~h01@G|<C(KG)2bdhdB;(y)g5J*Rb%mlWB#tuCQU[D;?")
   ```
   matches the pattern ` (["I"; "MbAU"; "Ilzy"; "HM"; "G"; "uj"; "z"; "dnuDVB"; "rh"; "dU"; "rf"; "h"; "G"; "C"; "KG"; "bdhdB"; "y"; "g"; "J"; "Rb"; "mlWB"; "tuCQU"; "D"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "z8BL9].m&!;`ad@,F:s``e~!SCoG:mw7$$KAGL:|y{{M0c/U%6mP5^-E82")
   ```
   matches the pattern ` (["z"; "BL"; "m"; "ad"; "F"; "s"; "e"; "SCoG"; "mw"; "KAGL"; "y"; "M"; "c"; "U"; "mP"; "E"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "J*M#O[X>qU1t(]&tao14>_cht10t,HXf?ygT*j&+EN(7do1%lpiC47.;<N+l)]q[P>v[T,!f]zX:>:iF*NMjSW")
   ```
   matches the pattern ` (["J"; "M"; "O"; "X"; "qU"; "t"; "tao"; "cht"; "t"; "HXf"; "ygT"; "j"; "EN"; "do"; "lpiC"; "N"; "l"; "q"; "P"; "v"; "T"; "f"; "zX"; "iF"; "NMjSW"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "b->8]?<DR^F!K$GE/%Nu{~}&E:(gOLPd5BOEE_czg#-[%fkxX%OI1!PU}#8!Ir~_W{oE!mIF|LFj?E~cA3dPn)tl^mr6`f")
   ```
   matches the pattern ` (["b"; "DR"; "F"; "K"; "GE"; "Nu"; "E"; "gOLPd"; "BOEE"; "czg"; "fkxX"; "OI"; "PU"; "Ir"; "W"; "oE"; "mIF"; "LFj"; "E"; "cA"; "dPn"; "tl"; "mr"; "f"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "Sk2VNE,J}f0IL;=g#*fQ+5aiyyT^$2m8Rk&n{NLlMHu8nN1Jost$_XsT_@YCwBB!yz")
   ```
   matches the pattern ` (["Sk"; "VNE"; "J"; "f"; "IL"; "g"; "fQ"; "aiyyT"; "m"; "Rk"; "n"; "NLlMHu"; "nN"; "Jost"; "XsT"; "YCwBB"; "yz"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "+Dc(0QNan|Jv`Ii*U`-HR;j@Gej__^}y")
   ```
   matches the pattern ` (["Dc"; "QNan"; "Jv"; "Ii"; "U"; "HR"; "j"; "Gej"; "y"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "R;FexRjzOM-jfPLJ>(sYdPMst:?w;V-H0C_ss-UXj(]522F[=l3Jz{|=!1?kUC`MQz;W`:X=/muO8Q")
   ```
   matches the pattern ` (["R"; "FexRjzOM"; "jfPLJ"; "sYdPMst"; "w"; "V"; "H"; "C"; "ss"; "UXj"; "F"; "l"; "Jz"; "kUC"; "MQz"; "W"; "X"; "muO"; "Q"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "5by*)B1l5XcJE0CP%FL4P1qgDD{47J_!#S~k]gZiBH4>u9CD$^I<E-4c^@!9/LVcX8-Oc4aj>Kz,M,3^}7qKuvfMeR2|")
   ```
   matches the pattern ` (["by"; "B"; "l"; "XcJE"; "CP"; "FL"; "P"; "qgDD"; "J"; "S"; "k"; "gZiBH"; "u"; "CD"; "I"; "E"; "c"; "LVcX"; "Oc"; "aj"; "Kz"; "M"; "qKuvfMeR"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "UligHsM%j](%:#NN@?U7*!yJHq~TgZbQ9ZE`OW(!)KP?h=<{3IO?TG2iOvS/1nKi:JGv]*VPj!h60I")
   ```
   matches the pattern ` (["UligHsM"; "j"; "NN"; "U"; "yJHq"; "TgZbQ"; "ZE"; "OW"; "KP"; "h"; "IO"; "TG"; "iOvS"; "nKi"; "JGv"; "VPj"; "h"; "I"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "C03SiK=BLF2Wn+=BXy]C0pP5dJd_Du-Kb#6csLE.!A85ym!?pWr|~izRC6lVk}9-XT(Hc8H4Oai_a[.")
   ```
   matches the pattern ` (["C"; "SiK"; "BLF"; "Wn"; "BXy"; "C"; "pP"; "dJd"; "Du"; "Kb"; "csLE"; "A"; "ym"; "pWr"; "izRC"; "lVk"; "XT"; "Hc"; "H"; "Oai"; "a"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "_721|&_(:Hqn{p:4>749iSMsBV0?IUfgI6tykjk?")
   ```
   matches the pattern ` (["Hqn"; "p"; "iSMsBV"; "IUfgI"; "tykjk"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "cM9c{NhYE^lz[79|1+w^}7ycnNO@?3no+<kx!P1#y")
   ```
   matches the pattern ` (["cM"; "c"; "NhYE"; "lz"; "w"; "ycnNO"; "no"; "kx"; "P"; "y"])`.

   




+  _0.2_ / _0.2_ : Pass: 
Check that the result of evaluating
   ```
    (words "-W2[&xAKuL5NndGbRkzla5``f6~&|X%+jsuBOkHYx%V-o0.DK)-F.5&c")
   ```
   matches the pattern ` (["W"; "xAKuL"; "NndGbRkzla"; "f"; "X"; "jsuBOkHYx"; "V"; "o"; "DK"; "F"; "c"])`.

   




#### Subtotal: _4.000000000000001_ / _4.000000000000001_

## Manual tests entered by TA: borne038

+  _2_ / _2_ : Pass: Useful comments and indentation

    score: 2 (out of 2)


+  _2_ / _2_ : Pass: Uses an appropriate style (including reuse of previous functions where appropriate) for implementation

    score: 2 (out of 2)


+ Pass: Other Stylistic Comments & Feedback

    Great job!

#### Subtotal: _4_ / _4_

