clc;
close all;
clear all;

ser = serial('COM1', 'Baudrate', 9600, 'Databits', 8);
fopen(ser);
pause(1);

reset_torso1;

t2s('Initiating Psi Position');
sendangle_rarm(175,ser);
pause(1);
sendangle_larm(80,ser);
pause(1);
sendangle_rslr(143,ser);
pause(1);
sendangle_lslr(143,ser);
pause(1);
sendangle_relb(0,ser);
pause(1);
sendangle_lelb(255,ser);
pause(1);
t2s('Psi Position achieved');

reset_torso1;
t2s('Thank You');
fclose(ser);

