FasdUAS 1.101.10   ��   ��    k             l     ��  ��    4 . usage: osascript timer.scpt <time_in_seconds>     � 	 	 \   u s a g e :   o s a s c r i p t   t i m e r . s c p t   < t i m e _ i n _ s e c o n d s >   
  
 l     ��  ��    Q K TODO: figure out (easy) way to run with args but have custom reminder icon     �   �   T O D O :   f i g u r e   o u t   ( e a s y )   w a y   t o   r u n   w i t h   a r g s   b u t   h a v e   c u s t o m   r e m i n d e r   i c o n      l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  o      ���� 0 argv  ��    k     �       Z      ����  =        l     ����  I    �� ��
�� .corecnte****       ****  o     ���� 0 argv  ��  ��  ��    m    ����    L   
 ����  ��  ��         r     ! " ! l    #���� # n     $ % $ 4    �� &
�� 
cobj & m    ����  % o    ���� 0 argv  ��  ��   " o      ���� 0 duration      ' ( ' r     ) * ) ^     + , + l    -���� - c     . / . o    ���� 0 duration   / m    ��
�� 
nmbr��  ��   , m    ���� < * o      ���� &0 durationinminutes durationInMinutes (  0 1 0 r     % 2 3 2 l    # 4���� 4 c     # 5 6 5 o     !���� 0 duration   6 m   ! "��
�� 
nmbr��  ��   3 o      ���� &0 durationinseconds durationInSeconds 1  7 8 7 I  & +�� 9��
�� .sysodelanull��� ��� nmbr 9 o   & '���� &0 durationinseconds durationInSeconds��   8  : ; : l  , ,��������  ��  ��   ;  < = < r   , / > ? > m   , - @ @ � A A   ? o      ���� 0 message   =  B C B Z   0 } D E�� F D A   0 3 G H G o   0 1���� &0 durationinseconds durationInSeconds H m   1 2���� < E k   6 R I I  J K J r   6 = L M L I  6 ;�� N��
�� .sysorondlong        doub N l  6 7 O���� O o   6 7���� &0 durationinseconds durationInSeconds��  ��  ��   M o      ���� "0 roundedduration roundedDuration K  P�� P r   > R Q R Q b   > P S T S b   > L U V U b   > E W X W b   > C Y Z Y m   > ? [ [ � \ \  S e t   Z l  ? B ]���� ] c   ? B ^ _ ^ o   ? @���� "0 roundedduration roundedDuration _ m   @ A��
�� 
TEXT��  ��   X m   C D ` ` � a a    s e c o n d V I   E K�� b���� 0 	pluralize   b  c�� c o   F G���� "0 roundedduration roundedDuration��  ��   T m   L O d d � e e    a g o R o      ���� 0 message  ��  ��   F k   U } f f  g h g r   U d i j i I  U b�� k��
�� .sysorondlong        doub k ^   U ^ l m l l  U Z n���� n ]   U Z o p o o   U V���� &0 durationinminutes durationInMinutes p m   V Y���� 
��  ��   m m   Z ]���� 
��   j o      ���� "0 roundedduration roundedDuration h  q�� q r   e } r s r b   e { t u t b   e w v w v b   e p x y x b   e l z { z m   e h | | � } }  S e t   { l  h k ~���� ~ c   h k  �  o   h i���� "0 roundedduration roundedDuration � m   i j��
�� 
TEXT��  ��   y m   l o � � � � �    m i n u t e w I   p v�� ����� 0 	pluralize   �  ��� � o   q r���� "0 roundedduration roundedDuration��  ��   u m   w z � � � � �    a g o s o      ���� 0 message  ��   C  ��� � I  ~ ��� � �
�� .sysonotfnull��� ��� TEXT � o   ~ ���� 0 message   � �� � �
�� 
appr � m   � � � � � � �  T i m e r   D o n e � �� ���
�� 
nsou � m   � � � � � � �  p u r r��  ��     � � � l     ��������  ��  ��   �  ��� � i     � � � I      �� ����� 0 	pluralize   �  ��� � o      ���� 0 anumber aNumber��  ��   � k      � �  � � � Z     � ����� � =     � � � o     ���� 0 anumber aNumber � m    ����  � L     � � m     � � � � �  ��  ��   �  ��� � L     � � m     � � � � �  s��  ��       
�� � � � � ��� �������   � ����������������
�� .aevtoappnull  �   � ****�� 0 	pluralize  �� 0 duration  �� &0 durationinminutes durationInMinutes�� &0 durationinseconds durationInSeconds�� 0 message  �� "0 roundedduration roundedDuration��   � �� ���� � ���
�� .aevtoappnull  �   � ****�� 0 argv  ��   � ���� 0 argv   � ���������������� @������ [�� `�� d� | � ��~ ��} ��|�{
�� .corecnte****       ****
�� 
cobj�� 0 duration  
�� 
nmbr�� <�� &0 durationinminutes durationInMinutes�� &0 durationinseconds durationInSeconds
�� .sysodelanull��� ��� nmbr�� 0 message  
�� .sysorondlong        doub�� "0 roundedduration roundedDuration
�� 
TEXT�� 0 	pluralize  � 

�~ 
appr
�} 
nsou�| 
�{ .sysonotfnull��� ��� TEXT�� ��j  j  hY hO��k/E�O��&�!E�O��&E�O�j O�E�O�� !�j 
E�O���&%�%*�k+ %a %E�Y *�a  a !j 
E�Oa ��&%a %*�k+ %a %E�O�a a a a a   � �z ��y�x � ��w�z 0 	pluralize  �y �v ��v  �  �u�u 0 anumber aNumber�x   � �t�t 0 anumber aNumber �  � ��w �k  �Y hO� � � � �  1 2 0 � @       �� x � � � � " S e t   2   m i n u t e s   a g o�� ��  ascr  ��ޭ