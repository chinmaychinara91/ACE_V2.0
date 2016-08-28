function [ ] = sendangle_rfot( data,ser )

% Transmitts the angle to reach to the motor rfot

a0 = 64;
a1 = 192;

ln = bitand(data,15); % extracting the lower nibble
disp(ln);
temp = bitand(data,240); %extracting the higher nibble
disp(temp);
hn = bitshift(temp,-4,'uint8'); %left shift 4 the lower nibble
disp(hn);

byte1 = bitor(a0,ln); %constructing the 1st byte with lower nibble
disp(byte1);
byte2 = bitor(a1,hn);   %constructing the 2nd byte with higher nibble
disp(byte2);

for i = 1 : 3
    fwrite(ser,byte1);
    fwrite(ser,byte2);
end

end