clc;
close all;
clear all;

ser = serial('COM1', 'Baudrate', 9600, 'Databits', 8);
fopen(ser);
pause(1);

sendangle_rarm(30,ser);
pause(1);
sendangle_larm(215,ser);
pause(1);

sendangle_rarm(0,ser);
pause(1);
sendangle_larm(185,ser);
pause(1);
sendangle_rarm(60,ser);
pause(1);
sendangle_larm(245,ser);
pause(1);

sendangle_rarm(0,ser);
pause(1);
sendangle_larm(185,ser);
pause(1);
sendangle_rarm(60,ser);
pause(1);
sendangle_larm(245,ser);
pause(1);

sendangle_rarm(30,ser);
pause(1);
sendangle_larm(215,ser);
pause(1);

fclose(ser);

