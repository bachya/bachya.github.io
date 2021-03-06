FasdUAS 1.101.10   ��   ��    k             l      ��  ��   D>
### SCRIPT NAME

Send nvALT Checkboxes to Omnifocus

### DESCRIPTION

Automatically scans nvALT files (via Hazel) and, upon finding "checkboxes,"
sends them to OmniFocus as tasks.

### LICENSE(The MIT License)Copyright � 2014 Aaron Bach bachya1208@gmail.comPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

author: Aaron Bach
date: July 27, 2014
version: 1.0.0
     � 	 	
| 
 # # #   S C R I P T   N A M E 
 
 S e n d   n v A L T   C h e c k b o x e s   t o   O m n i f o c u s 
 
 # # #   D E S C R I P T I O N 
 
 A u t o m a t i c a l l y   s c a n s   n v A L T   f i l e s   ( v i a   H a z e l )   a n d ,   u p o n   f i n d i n g   " c h e c k b o x e s , " 
 s e n d s   t h e m   t o   O m n i F o c u s   a s   t a s k s . 
 
 # # #   L I C E N S E   ( T h e   M I T   L i c e n s e )   C o p y r i g h t   �   2 0 1 4   A a r o n   B a c h   b a c h y a 1 2 0 8 @ g m a i l . c o m   P e r m i s s i o n   i s   h e r e b y   g r a n t e d ,   f r e e   o f   c h a r g e ,   t o   a n y   p e r s o n   o b t a i n i n g   a   c o p y   o f   t h i s   s o f t w a r e   a n d   a s s o c i a t e d   d o c u m e n t a t i o n   f i l e s   ( t h e   ' S o f t w a r e ' ) ,   t o   d e a l   i n   t h e   S o f t w a r e   w i t h o u t   r e s t r i c t i o n ,   i n c l u d i n g   w i t h o u t   l i m i t a t i o n   t h e   r i g h t s   t o   u s e ,   c o p y ,   m o d i f y ,   m e r g e ,   p u b l i s h ,   d i s t r i b u t e ,   s u b l i c e n s e ,   a n d / o r   s e l l   c o p i e s   o f   t h e   S o f t w a r e ,   a n d   t o   p e r m i t   p e r s o n s   t o   w h o m   t h e   S o f t w a r e   i s   f u r n i s h e d   t o   d o   s o ,   s u b j e c t   t o   t h e   f o l l o w i n g   c o n d i t i o n s :   T h e   a b o v e   c o p y r i g h t   n o t i c e   a n d   t h i s   p e r m i s s i o n   n o t i c e   s h a l l   b e   i n c l u d e d   i n   a l l   c o p i e s   o r   s u b s t a n t i a l   p o r t i o n s   o f   t h e   S o f t w a r e .   T H E   S O F T W A R E   I S   P R O V I D E D   ' A S   I S ' ,   W I T H O U T   W A R R A N T Y   O F   A N Y   K I N D ,   E X P R E S S   O R   I M P L I E D ,   I N C L U D I N G   B U T   N O T   L I M I T E D   T O   T H E   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y ,   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A N D   N O N I N F R I N G E M E N T .   I N   N O   E V E N T   S H A L L   T H E   A U T H O R S   O R   C O P Y R I G H T   H O L D E R S   B E   L I A B L E   F O R   A N Y   C L A I M ,   D A M A G E S   O R   O T H E R   L I A B I L I T Y ,   W H E T H E R   I N   A N   A C T I O N   O F   C O N T R A C T ,   T O R T   O R   O T H E R W I S E ,   A R I S I N G   F R O M ,   O U T   O F   O R   I N   C O N N E C T I O N   W I T H   T H E   S O F T W A R E   O R   T H E   U S E   O R   O T H E R   D E A L I N G S   I N   T H E   S O F T W A R E . 
 
 a u t h o r :   A a r o n   B a c h 
 d a t e :   J u l y   2 7 ,   2 0 1 4 
 v e r s i o n :   1 . 0 . 0 
   
  
 i         I      �� ���� $0 hazelprocessfile hazelProcessFile   ��  o      ���� 0 thefile theFile��  ��    k     �       l     ��  ��    #  The maildrop address to use.     �   :   T h e   m a i l d r o p   a d d r e s s   t o   u s e .      r         m        �   , Y O U R   M A I L   D R O P   A D D R E S S  o      ���� "0 maildropaddress mailDropAddress      l   ��������  ��  ��        l   ��   !��     G A DO NOT CHANGE BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING.    ! � " " �   D O   N O T   C H A N G E   B E L O W   T H I S   L I N E   U N L E S S   Y O U   K N O W   W H A T   Y O U ' R E   D O I N G .   # $ # l   ��������  ��  ��   $  % & % r    	 ' ( ' n     ) * ) 1    ��
�� 
psxp * o    ���� 0 thefile theFile ( o      ���� 0 p   &  + , + r   
  - . - n   
  / 0 / 2   ��
�� 
cpar 0 l  
  1���� 1 I  
 �� 2��
�� .sysoexecTEXT���     TEXT 2 b   
  3 4 3 m   
  5 5 � 6 6  g r e p   ' \ [   x   \ ] '   4 n     7 8 7 1    ��
�� 
strq 8 o    ���� 0 p  ��  ��  ��   . o      ���� 0 l   ,  9 : 9 l   ��������  ��  ��   :  ; < ; l   �� = >��   = . ( Determine whether OmniFocus is running.    > � ? ? P   D e t e r m i n e   w h e t h e r   O m n i F o c u s   i s   r u n n i n g . <  @ A @ O    / B C B r    . D E D I   ,�� F��
�� .corecnte****       **** F l   ( G���� G 6   ( H I H 2    ��
�� 
prcs I =    ' J K J 1   ! #��
�� 
pnam K m   $ & L L � M M  O m n i F o c u s��  ��  ��   E o      ���� "0 omnifocusactive omnifocusActive C m     N N�                                                                                  sevs  alis    �  Macintosh HD               �@��H+  wSystem Events.app                                              �cS�An�        ����  	                CoreServices    �@��      �A�9    wts  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��   A  O P O l  0 0��������  ��  ��   P  Q�� Q X   0 � R�� S R k   @ � T T  U V U r   @ K W X W l  @ I Y���� Y I  @ I�� Z��
�� .sysoexecTEXT���     TEXT Z b   @ E [ \ [ b   @ C ] ^ ] m   @ A _ _ � ` `  n = " ^ o   A B���� 0 v   \ m   C D a a � b b  " ;   e c h o   $ { n : 6 }��  ��  ��   X o      ���� 0 taskname taskName V  c d c r   L d e f e b   L b g h g m   L O i i � j j B C r e a t e d   f r o m   n v A L T :   n v a l t : / / f i n d / h n  O a k l k I   P a�� m���� 0 encode_text   m  n o n n  P [ p q p I   Q [�� r���� 0 remove_extension   r  s�� s n  Q W t u t I   R W�� v���� 0 basename   v  w�� w o   R S���� 0 p  ��  ��   u  f   Q R��  ��   q  f   P Q o  x y x m   [ \��
�� boovtrue y  z�� z m   \ ]��
�� boovfals��  ��   l  f   O P f o      ���� 0 tasknote taskNote d  { | { l  e e��������  ��  ��   |  }�� } Z   e � ~ �� � ~ ?   e h � � � o   e f���� "0 omnifocusactive omnifocusActive � m   f g����    k   k � � �  � � � l  k k�� � ���   � ? 9 OmniFocus is running, so insert a task into it directly.    � � � � r   O m n i F o c u s   i s   r u n n i n g ,   s o   i n s e r t   a   t a s k   i n t o   i t   d i r e c t l y . �  ��� � O  k � � � � O   q � � � � I  z ����� �
�� .corecrel****      � null��   � �� � �
�� 
kocl � m   | ��
�� 
FCit � �� ���
�� 
prdt � K   � � � � �� � �
�� 
pnam � b   � � � � � m   � � � � � � �  H E R E � o   � ����� 0 taskname taskName � �� ���
�� 
FCno � o   � ����� 0 tasknote taskNote��  ��   � 4   q w�� �
�� 
docu � m   u v����  � m   k n � ��                                                                                  OFOC  alis    X  Macintosh HD               �@��H+  �OmniFocus.app                                                  F<����        ����  	                Applications    �@��      ���%    �  (Macintosh HD:Applications: OmniFocus.app    O m n i F o c u s . a p p    M a c i n t o s h   H D  Applications/OmniFocus.app  / ��  ��  ��   � k   � � � �  � � � l  � ��� � ���   � < 6 OmniFocus isn't running, so use the Mail Drop method.    � � � � l   O m n i F o c u s   i s n ' t   r u n n i n g ,   s o   u s e   t h e   M a i l   D r o p   m e t h o d . �  ��� � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � �  e c h o   " � o   � ����� 0 tasknote taskNote � m   � � � � � � �  "   |   m a i l   - s   " � o   � ����� 0 taskname taskName � m   � � � � � � �  "   � o   � ����� "0 maildropaddress mailDropAddress��  ��  ��  �� 0 v   S o   3 4���� 0 l  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 basename   �  ��� � o      ���� 0 thepath thePath��  ��   � l    + � � � � k     + � �  � � � Z      � ��� � � D      � � � o     ���� 0 thepath thePath � m     � � � � �  / � r    	 � � � m    ������ � o      ���� 0 	nameindex 	nameIndex��   � r     � � � m    ������ � o      ���� 0 	nameindex 	nameIndex �  � � � r     � � � n    � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr � o      ���� 0 astid ASTID �  � � � r     � � � m     � � � � �  / � n      � � � 1    ��
�� 
txdl � 1    ��
�� 
ascr �  � � � r    " � � � n      � � � 4     �� �
�� 
citm � o    ���� 0 	nameindex 	nameIndex � o    ���� 0 thepath thePath � o      ���� 0 thepath thePath �  � � � r   # ( � � � o   # $���� 0 astid ASTID � n      � � � 1   % '��
�� 
txdl � 1   $ %��
�� 
ascr �  ��� � L   ) + � � o   ) *���� 0 thepath thePath��   �   Requires POSIX path    � � � � (   R e q u i r e s   P O S I X   p a t h �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 encode_char   �  ��� � o      ���� 0 	this_char  ��  ��   � k     K � �  � � � r      � � � l     ����� � l     ���� � I    �~ ��}
�~ .sysoctonshor       TEXT � o     �|�| 0 	this_char  �}  ��  �  ��  ��   � l      ��{�z � o      �y�y 0 	ascii_num 	ASCII_num�{  �z   �  � � � r      � � � J        m    	 �  0  m   	 
 �  1 	
	 m   
  �  2
  m     �  3  m     �  4  m     �  5  m     �  6  m     �    7 !"! m    ## �$$  8" %&% m    '' �((  9& )*) m    ++ �,,  A* -.- m    // �00  B. 121 m    33 �44  C2 565 m    77 �88  D6 9:9 m    ;; �<<  E: =�x= m    >> �??  F�x   � l     @�w�v@ o      �u�u 0 hex_list  �w  �v   � ABA r   ! /CDC n   ! -EFE 4   " -�tG
�t 
cobjG l  % ,H�s�rH [   % ,IJI l  % *K�q�pK _   % *LML o   % &�o�o 0 	ascii_num 	ASCII_numM m   & )�n�n �q  �p  J m   * +�m�m �s  �r  F l  ! "N�l�kN o   ! "�j�j 0 hex_list  �l  �k  D o      �i�i 0 x  B OPO r   0 >QRQ n   0 <STS 4   1 <�hU
�h 
cobjU l  4 ;V�g�fV [   4 ;WXW l  4 9Y�e�dY `   4 9Z[Z o   4 5�c�c 0 	ascii_num 	ASCII_num[ m   5 8�b�b �e  �d  X m   9 :�a�a �g  �f  T l  0 1\�`�_\ o   0 1�^�^ 0 hex_list  �`  �_  R o      �]�] 0 y  P ]�\] L   ? K^^ c   ? J_`_ l  ? Fa�[�Za b   ? Fbcb b   ? Dded m   ? Bff �gg  %e o   B C�Y�Y 0 x  c o   D E�X�X 0 y  �[  �Z  ` m   F I�W
�W 
TEXT�\   � hih l     �V�U�T�V  �U  �T  i jkj i    lml I      �Sn�R�S 0 encode_text  n opo o      �Q�Q 0 	this_text  p qrq o      �P�P 0 encode_url_a encode_URL_Ar s�Os o      �N�N 0 encode_url_b encode_URL_B�O  �R  m k     ftt uvu r     wxw m     yy �zz H a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9x l     {�M�L{ o      �K�K 0 standard_characters  �M  �L  v |}| r    ~~ m    �� ��� 2 $ + ! ' / ? ; & @ = # % > < { } [ ] " ~ ` ^ \ | * l     ��J�I� o      �H�H 0 url_a_chars URL_A_chars�J  �I  } ��� r    ��� m    	�� ���  . - _ :� l     ��G�F� o      �E�E 0 url_b_chars URL_B_chars�G  �F  � ��� r    ��� l   ��D�C� o    �B�B 0 standard_characters  �D  �C  � l     ��A�@� o      �?�? 0 acceptable_characters  �A  �@  � ��� Z   ���>�=� =   ��� o    �<�< 0 encode_url_a encode_URL_A� m    �;
�; boovfals� r    ��� b    ��� l   ��:�9� o    �8�8 0 acceptable_characters  �:  �9  � l   ��7�6� o    �5�5 0 url_a_chars URL_A_chars�7  �6  � l     ��4�3� o      �2�2 0 acceptable_characters  �4  �3  �>  �=  � ��� Z    /���1�0� =    #��� o     !�/�/ 0 encode_url_b encode_URL_B� m   ! "�.
�. boovfals� r   & +��� b   & )��� l  & '��-�,� o   & '�+�+ 0 acceptable_characters  �-  �,  � l  ' (��*�)� o   ' (�(�( 0 url_b_chars URL_B_chars�*  �)  � l     ��'�&� o      �%�% 0 acceptable_characters  �'  �&  �1  �0  � ��� r   0 3��� m   0 1�� ���  � l     ��$�#� o      �"�" 0 encoded_text  �$  �#  � ��� X   4 c��!�� Z   D ^��� �� E  D G��� l  D E���� o   D E�� 0 acceptable_characters  �  �  � o   E F�� 0 	this_char  � r   J O��� l  J M���� b   J M��� l  J K���� o   J K�� 0 encoded_text  �  �  � o   K L�� 0 	this_char  �  �  � l     ���� o      �� 0 encoded_text  �  �  �   � r   R ^��� c   R \��� l  R Z���� b   R Z��� l  R S���� o   R S�� 0 encoded_text  �  �  � I   S Y���� 0 encode_char  � ��� o   T U�
�
 0 	this_char  �  �  �  �  � m   Z [�	
�	 
TEXT� l     ���� o      �� 0 encoded_text  �  �  �! 0 	this_char  � o   7 8�� 0 	this_text  � ��� L   d f�� l  d e���� o   d e�� 0 encoded_text  �  �  �  k ��� l     � �����   ��  ��  � ��� i    ��� I      ������� 0 remove_extension  � ���� o      ���� 0 	this_name  ��  ��  � k     <�� ��� Z     9������� E     ��� o     ���� 0 	this_name  � m    �� ���  .� k    5�� ��� r    ��� c    ��� l 	  ������ l   ������ l   ������ n    ��� 1   	 ��
�� 
rvse� n    	��� 2    	��
�� 
cha � o    ���� 0 	this_name  ��  ��  ��  ��  ��  ��  � m    ��
�� 
TEXT� o      ���� 0 	this_name  � ��� r    ��� l   ������ I   �����
�� .sysooffslong    ��� null��  � ����
�� 
psof� m    �� ���  .� �����
�� 
psin� o    ���� 0 	this_name  ��  ��  ��  � o      ���� 0 x  � ��� r    +��� l   )������ n    )� � 7   )��
�� 
ctxt l  ! %���� [   ! % o   " #���� 0 x   m   # $���� ��  ��   m   & (������  o    ���� 0 	this_name  ��  ��  � o      ���� 0 	this_name  � �� r   , 5 c   , 3	
	 l  , 1���� l  , 1���� n   , 1 1   / 1��
�� 
rvse n   , / 2   - /��
�� 
cha  o   , -���� 0 	this_name  ��  ��  ��  ��  
 m   1 2��
�� 
TEXT o      ���� 0 	this_name  ��  ��  ��  � �� L   : < o   : ;���� 0 	this_name  ��  �  l     ��������  ��  ��   �� i     I      ������ 0 replacestring replaceString  o      ���� 0 thetext theText  o      ���� 0 	oldstring 	oldString �� o      ���� 0 	newstring 	newString��  ��   k     E   q      !! ��"�� 0 astid ASTID" ��#�� 0 thetext theText# ��$�� 0 	oldstring 	oldString$ ��%�� 0 	newstring 	newString% ������ 0 lst  ��    &'& r     ()( n    *+* 1    ��
�� 
txdl+ 1     ��
�� 
ascr) o      ���� 0 astid ASTID' ,��, Q    E-./- k   	 /00 121 P   	 &34��3 k    %55 676 r    898 o    ���� 0 	oldstring 	oldString9 n     :;: 1    ��
�� 
txdl; 1    ��
�� 
ascr7 <=< r    >?> n    @A@ 2    ��
�� 
citmA o    ���� 0 thetext theText? o      ���� 0 lst  = BCB r    DED o    ���� 0 	newstring 	newStringE n     FGF 1    ��
�� 
txdlG 1    ��
�� 
ascrC H��H r     %IJI c     #KLK o     !���� 0 lst  L m   ! "��
�� 
TEXTJ o      ���� 0 thetext theText��  4 ����
�� conscase��  ��  2 MNM r   ' ,OPO o   ' (���� 0 astid ASTIDP n     QRQ 1   ) +��
�� 
txdlR 1   ( )��
�� 
ascrN S��S L   - /TT o   - .���� 0 thetext theText��  . R      ��UV
�� .ascrerr ****      � ****U o      ���� 0 emsg eMsgV ��W��
�� 
errnW o      ���� 0 enum eNum��  / k   7 EXX YZY r   7 <[\[ o   7 8���� 0 astid ASTID\ n     ]^] 1   9 ;��
�� 
txdl^ 1   8 9��
�� 
ascrZ _��_ R   = E��`a
�� .ascrerr ****      � ****` b   A Dbcb m   A Bdd �ee * C a n ' t   r e p l a c e S t r i n g :  c o   B C���� 0 emsg eMsga ��f��
�� 
errnf o   ? @���� 0 enum eNum��  ��  ��  ��       ��ghijklm��  g �������������� $0 hazelprocessfile hazelProcessFile�� 0 basename  �� 0 encode_char  �� 0 encode_text  �� 0 remove_extension  �� 0 replacestring replaceStringh �� ����no���� $0 hazelprocessfile hazelProcessFile�� ��p�� p  ���� 0 thefile theFile��  n ������������������ 0 thefile theFile�� "0 maildropaddress mailDropAddress�� 0 p  �� 0 l  �� "0 omnifocusactive omnifocusActive�� 0 v  �� 0 taskname taskName�� 0 tasknote taskNoteo  �� 5��~�} N�|q�{ L�z�y�x _ a i�w�v�u ��t�s�r ��q�p�o � � �
�� 
psxp
� 
strq
�~ .sysoexecTEXT���     TEXT
�} 
cpar
�| 
prcsq  
�{ 
pnam
�z .corecnte****       ****
�y 
kocl
�x 
cobj�w 0 basename  �v 0 remove_extension  �u 0 encode_text  
�t 
docu
�s 
FCit
�r 
prdt
�q 
FCno�p 
�o .corecrel****      � null�� ��E�O��,E�O��,%j �-E�O� *�-�[�,\Z�81j E�UO ��[��l kh �%�%j E�Oa )))�k+ k+ efm+ %E�O�j 2a  (*a k/ *�a a �a �%a �a a  UUY a �%a %�%a %�%j [OY��i �n ��m�lrs�k�n 0 basename  �m �jt�j t  �i�i 0 thepath thePath�l  r �h�g�f�h 0 thepath thePath�g 0 	nameindex 	nameIndex�f 0 astid ASTIDs  ��e�d�c ��b�e��
�d 
ascr
�c 
txdl
�b 
citm�k ,�� �E�Y iE�O��,E�O���,FO��/E�O���,FO�j �a ��`�_uv�^�a 0 encode_char  �` �]w�] w  �\�\ 0 	this_char  �_  u �[�Z�Y�X�W�[ 0 	this_char  �Z 0 	ascii_num 	ASCII_num�Y 0 hex_list  �X 0 x  �W 0 y  v �V#'+/37;>�U�Tf�S
�V .sysoctonshor       TEXT�U 
�T 
cobj
�S 
TEXT�^ L�j  E�O���������������a a vE�O�a �a "k/E�O�a �a #k/E�Oa �%�%a &k �Rm�Q�Pxy�O�R 0 encode_text  �Q �Nz�N z  �M�L�K�M 0 	this_text  �L 0 encode_url_a encode_URL_A�K 0 encode_url_b encode_URL_B�P  x 	�J�I�H�G�F�E�D�C�B�J 0 	this_text  �I 0 encode_url_a encode_URL_A�H 0 encode_url_b encode_URL_B�G 0 standard_characters  �F 0 url_a_chars URL_A_chars�E 0 url_b_chars URL_B_chars�D 0 acceptable_characters  �C 0 encoded_text  �B 0 	this_char  y 	y����A�@�?�>�=
�A 
kocl
�@ 
cobj
�? .corecnte****       ****�> 0 encode_char  
�= 
TEXT�O g�E�O�E�O�E�O�E�O�f  
��%E�Y hO�f  
��%E�Y hO�E�O .�[��l kh �� 
��%E�Y �*�k+ %�&E�[OY��O�l �<��;�:{|�9�< 0 remove_extension  �; �8}�8 }  �7�7 0 	this_name  �:  { �6�5�6 0 	this_name  �5 0 x  | 
��4�3�2�1��0�/�.�-
�4 
cha 
�3 
rvse
�2 
TEXT
�1 
psof
�0 
psin�/ 
�. .sysooffslong    ��� null
�- 
ctxt�9 =�� 4��-�,�&E�O*���� E�O�[�\[Z�k\Zi2E�O��-�,�&E�Y hO�m �,�+�*~�)�, 0 replacestring replaceString�+ �(��( �  �'�&�%�' 0 thetext theText�& 0 	oldstring 	oldString�% 0 	newstring 	newString�*  ~ �$�#�"�!� ���$ 0 thetext theText�# 0 	oldstring 	oldString�" 0 	newstring 	newString�! 0 astid ASTID�  0 lst  � 0 emsg eMsg� 0 enum eNum 	��4�����d
� 
ascr
� 
txdl
� 
citm
� 
TEXT� 0 emsg eMsg� ���
� 
errn� 0 enum eNum�  
� 
errn�) F��,E�O +�g ���,FO��-E�O���,FO��&E�VO���,FO�W X  ���,FO)�l�%ascr  ��ޭ