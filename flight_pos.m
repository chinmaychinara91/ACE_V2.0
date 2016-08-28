clc;
close all;
clear all;

ser = serial('COM1', 'Baudrate', 9600, 'Databits', 8);
fopen(ser);
pause(1);

reset_torso1;

t2s('initiating flight position');
sendangle_rarm(175,ser);
pause(1);
sendangle_larm(80,ser);
pause(1);
sendangle_relb(123,ser);
pause(1);
sendangle_lelb(130,ser);
pause(1);
sendangle_relt(0,ser);
pause(1);
sendangle_lelt(200,ser);
pause(1);
sendangle_rslr(143,ser);
pause(1);
sendangle_lslr(143,ser);
pause(1);
t2s('flight position achieved');

reset_torso1;
t2s('Thank You');
fclose(ser);

