function [ ] = sendangle_relb( data,ser )

% Transmitts the angle to reach to the motor relb

a0 = 4;
a1 = 12;

temp = bitand(data,15); % extracting the lower nibble
ln = bitshift(temp,4,'uint8');
disp(ln);
hn = bitand(data,240); %extracting the higher nibble
disp(hn);

byte1 = bitor(a0,ln); %constructing the 1st byte with lower nibble
disp(byte1);
byte2 = bitor(a1,hn); %constructing the 2nd byte with higher nibble
disp(byte2);

for i = 1 : 3
    fwrite(ser,byte1);
    fwrite(ser,byte2);
end

end