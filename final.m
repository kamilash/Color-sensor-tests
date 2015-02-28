clear all;
clc;

%%%%%%%%%%% input variables %%%%%%%%%%%%

in_wl = 400;  %initial wavelength value (Optical Power Meter range: 400nm - 1100nm)
fi_wl = 1100;  %final wavelength value
step = 5;     %wavelength scan step
tread = 3;    %current and power samples per each wavelength step

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Optical Sensor Responsity %%%%%%%

resp = [400 405 410 415 420 425 430 435 440 445 450 455 460 465 470 475 480 485 490 495 500 505 510 515 520 525 530 535 540 545 550 555 560 565 570 575 580 585 590 595 600 605 610 615 620 625 630 635 640 645 650 655 660 665 670 675 680 685 690 695 700 705 710 715 720 725 730 735 740 745 750 755 760 765 770 775 780 785 790 795 800 805 810 815 820 825 830 835 840 845 850 855 860 865 870 875 880 885 890 895 900 905 910 915 920 925 930 935 940 945 950 955 960 965 970 975 980 985 990 995 1000 1005 1010 1015 1020 1025 1030 1035 1040 1045 1050 1055 1060 1065 1070 1075 1080 1085 1090 1095 1100;
        3.034e-03 3.412e-03 3.632e-03 3.876e-03 4.206e-03 4.583e-03 4.917e-03 5.085e-03 5.191e-03 5.495e-03 6.025e-03 6.616e-03 7.109e-03 7.415e-03 7.562e-03 7.613e-03 7.640e-03 7.636e-03 7.675e-03 7.739e-03 7.836e-03 7.958e-03 8.136e-03 8.370e-03 8.643e-03 8.959e-03 9.327e-03 9.723e-03 1.009e-02 1.039e-02 1.062e-02 1.078e-02 1.086e-02 1.090e-02 1.090e-02 1.090e-02 1.095e-02 1.105e-02 1.126e-02 1.159e-02 1.193e-02 1.243e-02 1.295e-02 1.349e-02 1.403e-02 1.454e-02 1.500e-02 1.542e-02 1.586e-02 1.635e-02 1.696e-02 1.773e-02 1.868e-02 1.988e-02 2.140e-02 2.323e-02 2.539e-02 2.779e-02 3.016e-02 3.256e-02 3.470e-02 3.668e-02 3.843e-02 4.005e-02 4.149e-02 4.284e-02 4.411e-02 4.525e-02 4.636e-02 4.734e-02 4.829e-02 4.920e-02 5.003e-02 5.081e-02 5.153e-02 5.224e-02 5.287e-02 5.345e-02 5.401e-02 5.447e-02 5.493e-02 5.538e-02 5.571e-02 5.609e-02 5.638e-02 5.664e-02 5.687e-02 5.704e-02 5.721e-02 5.734e-02 5.744e-02 5.754e-02 5.755e-02 5.759e-02 5.761e-02 5.759e-02 5.755e-02 5.752e-02 5.749e-02 5.740e-02 5.735e-02 5.728e-02 5.720e-02 5.715e-02 5.709e-02 5.701e-02 5.691e-02 5.686e-02 5.676e-02 5.670e-02 5.663e-02 5.652e-02 5.645e-02 5.637e-02 5.623e-02 5.610e-02 5.594e-02 5.569e-02 5.547e-02 5.509e-02 5.464e-02 5.401e-02 5.326e-02 5.235e-02 5.121e-02 4.970e-02 4.781e-02 4.572e-02 4.316e-02 4.035e-02 3.733e-02 3.413e-02 3.059e-02 2.733e-02 2.500e-02 2.279e-02 2.071e-02 1.873e-02 1.694e-02 1.520e-02 1.362e-02]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
pow=1;
pow2=1;
i=1;
aux2=1;
current2=0;
in_wl2=in_wl;
aux = 1;

    % Create a serial port object.
    obj1 = instrfind('Type', 'serial', 'Port', 'COM1', 'Tag', '');
    

    % Create the serial port object if it does not exist
    % otherwise use the object that was found.
    if isempty(obj1)
        obj1 = serial('COM1');
    else
        fclose(obj1);
        obj1 = obj1(1)
    end

while (in_wl<=fi_wl) %initial value will be incremented until to be less or equal final value       
    
    s = serial('com1','BaudRate',115200,'Parity','none');
    get(s,{'BaudRate','DataBits','Parity','StopBits','Terminator'})
    
    wli = int2str(in_wl); %convert integer to string to be possible to use on 'GOWAVE'
    
    string = ['GOWAVE ',wli] %send wl's value to equipment
        
    %in_wl=in_wl+step; %increment variable step on initial value
    
    calllib('cs_USB','cs_Open',0);
    calllib('cs_USB','cs_Write',0,strcat(string,uint8(10)));
    calllib('cs_USB','cs_Write',0, strcat('WAVE?',uint8(10)));
    returnval=calllib('cs_USB','cs_Read',0)
    calllib('cs_USB','cs_Close',0);
    

    % Connect to instrument object, obj1.
     fopen(obj1);

    % Communicating with instrument object, obj1. Send the right value of
    % Wavelength to the Optical Power Meter.
%     wli2 = str2num(wli)
%     wli2 = wli2*(1E-9)
%     wli2 = num2str(wli2)
    
    string2 = [':WAVELENGTH ',wli,'E-09']
    fprintf(obj1, string2)
% 
%     % Disconnect from instrument object, obj1.
    fclose(obj1);
  
    fopen(obj1);
%     %Check which Wavelength is set on Optical Power Meter.
    wavelength = query(obj1, ':WAVELENGTH?')
    fclose(obj1);
        
    for b=1:tread, 1;
        
        fopen(obj1);
        %Check which Photocurrent the Optical Power Meter is reading on the sensor.
        current = query(obj1, ':PHOTOCURRENT?')
        current = str2num(current);
        pcurrent(1,b) = current;
        current2 = current2+current;
        fclose(obj1);
        %delete(obj1);
    
       
        fopen(obj1);
        %Check which Photocurrent the Optical Power Meter is reading on the sensor.
        pow2 = query(obj1, ':POWER?')
        pow2 = str2num(pow2);
        fclose(obj1);
        %delete(obj1);    
    end;
   
    % Clean up all objects.
    %delete(obj1);
    
    current = current2/tread;
    current2 = 0;
  
    
    for i=400:1100 ,5;
        
        if (in_wl==i)
            
            cresp = resp(2,aux);
            pow = current/(resp(2,aux));
            aux=aux+1;
            
            
        end;
    
    end;
    
    
    power(aux2,1)=in_wl;
    power(aux2,2)=cresp;
    power(aux2,3)=pow;
    power(aux2,4)=current;
    
  
   power2(1,aux2)=pow2;
    aux2=aux2+1;
    
    
    in_wl=in_wl+step; %increment variable step on initial value
    
end;

figure(1)
plot (power(:,3))

figure(2)
plot (power2)


fid = fopen('TestReport.txt','wt');
fprintf(fid, 'Wavelength\tResponsivity\tPower\t         Current\n\n');
fprintf(fid, '%6.1f\t%19.3e\t%11.3e\t%12.3e\n', power');
fclose(fid)
