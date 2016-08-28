clc;
close all;
clear all;

ser = serial('COM1', 'Baudrate', 9600, 'Databits', 8);
fopen(ser);
pause(1);

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
sendangle_rslr(0,ser);
pause(1);
sendangle_lslr(253,ser);
pause(1);

fclose(ser);

