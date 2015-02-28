# Color-sensor-tests

Basic tests made for specifying a color sensor response.

## Purpose
	The purpose is to control the wavelength of the Cornerstone 130 Motorized 1/8m Monochromator.  This equipment can send different wavelengths to an optical sensor, to make this test was used a color sensor model: S120B and an Optical Power Meter. The Optical Power Meter read the color sensor’s current and power on each wavelength output which is possible to change on the Monochromator. 

## Starting
	The first step is to open and run the M-file ‘startitup.m’ which is located in ‘C:\Documents and Settings\Administrator\Desktop\Test Color Sensor\Cornerstone dll\API\MATLAB’. 
	The second step is to add path and load libraries. Write on the Matlab Command Window: 
>> addpath([matlabroot ‘\extern\examples\shrlib’])
>> loadlibrary shrlibsample shrlibsample.h
	Now is possible to open the file which will control the equipments. This file is called ‘final’ and is located in ‘C:\Documents and Settings\Administrator\Desktop\Test Color Sensor’.

## Program
	First is necessary to set the following variables: 
>>in_wl = xxx;  %initial wavelength value (Optical Power Meter range: 400nm - 1100nm)
>>fi_wl = xxx;      %final wavelength value
>>step = xxx;      %wavelength scan step
>>tread = xxx;     %current and power samples per each wavelength step
	The main commands are descript on the following flowchart. 


	A USB library was used to control the Monochromator, to send the wavelength is necessary to change the number with the command ‘GOWAVE’. For Example:
>>string = ['GOWAVE 500'];  %set 500nm on the Monochromator
    
>>calllib('cs_USB','cs_Open',0);
>>calllib('cs_USB','cs_Write',0,strcat(string,uint8(10)));
>>calllib('cs_USB','cs_Write',0, strcat('WAVE?',uint8(10)));
>>returnval=calllib('cs_USB','cs_Read',0)
>>calllib('cs_USB','cs_Close',0);

	To control the Optical Power Meter was used the following Commands which can be find on the manual of the equipment.
:WAVELENGTH?        *Query the currently used correction wavelength [meter].
:WAVELENGTH           *Set the wavelength [meter] to use for calculating the sensitivity.
:PHOTOCURRENT?   *Query the last measured value of the photo diode head current.

	To send commands is necessary to use the function ‘fprintf’, for example:
>>x= [':WAVELENGTH ',wli,'E-09']
>>fprintf(obj1, x)
*the variable ‘x’ must be string.

	To read data is necessary to use the function ‘query’, for example:
>>wavelength = query(obj1, ':WAVELENGTH?')
	The type of this variable which is read is string.

## Results
	The result is a Power Chart and a .txt file where is stored Wavelength, Responsivity, Power and Current. The result is on the following table.

Wavelength   Responsivity   Power	            Current
(nm)	          (A/W)		(W)		 (A)

 400.0	         3.034e-003	 2.153e-004	  6.531e-007
 405.0	         3.412e-003	 2.447e-004	  8.349e-007
 410.0	         3.632e-003	 2.807e-004	  1.020e-006
 415.0	         3.876e-003	 3.091e-004	  1.198e-006
 420.0	         4.206e-003	 3.307e-004	  1.391e-006
 425.0	         4.583e-003	 3.462e-004	  1.586e-006
 430.0	         4.917e-003	 3.663e-004	  1.801e-006
 435.0	         5.085e-003	 3.973e-004	  2.020e-006
 440.0	         5.191e-003	 4.339e-004	  2.252e-006
 445.0	         5.495e-003	 4.520e-004	  2.484e-006
 450.0	         6.025e-003	 4.590e-004	  2.765e-006
 455.0	         6.616e-003	 4.697e-004	  3.108e-006
 460.0	         7.109e-003	 4.921e-004	  3.498e-006
 465.0	         7.415e-003	 5.254e-004	  3.896e-006
 470.0	         7.562e-003	 5.659e-004	  4.279e-006
 475.0	         7.613e-003	 6.051e-004	  4.607e-006
 480.0	         7.640e-003	 6.401e-004	  4.891e-006
 485.0	         7.636e-003	 6.718e-004	  5.130e-006
 490.0	         7.675e-003	 6.947e-004	  5.331e-006
 495.0	         7.739e-003	 7.168e-004	  5.547e-006
 500.0	         7.836e-003	 7.350e-004	  5.759e-006
 505.0	         7.958e-003	 7.509e-004	  5.975e-006
 510.0	         8.136e-003	 7.659e-004	  6.232e-006
 515.0	         8.370e-003	 7.827e-004	  6.551e-006
 520.0	         8.643e-003	 8.023e-004	  6.934e-006
 525.0	         8.959e-003	 8.271e-004	  7.410e-006
 530.0	         9.327e-003	 8.507e-004	  7.934e-006
 535.0	         9.723e-003	 8.740e-004	  8.498e-006
 540.0	         1.009e-002	 8.975e-004	  9.056e-006
 545.0	         1.039e-002	 9.220e-004	  9.579e-006
 550.0	         1.062e-002	 9.468e-004	  1.006e-005
 555.0	         1.078e-002	 9.681e-004	  1.044e-005
 560.0	         1.086e-002	 9.893e-004	  1.074e-005
 565.0	         1.090e-002	 1.006e-003	  1.096e-005
 570.0	         1.090e-002	 1.020e-003	  1.112e-005
 575.0	         1.090e-002	 1.028e-003	  1.121e-005
 580.0	         1.095e-002	 1.030e-003	  1.128e-005
 585.0	         1.105e-002	 1.027e-003	  1.135e-005
 590.0	         1.126e-002	 1.015e-003	  1.143e-005
 595.0	         1.159e-002	 9.946e-004	  1.153e-005
 600.0	         1.193e-002	 9.807e-004	  1.170e-005
 605.0	         1.243e-002	 9.637e-004	  1.198e-005
 610.0	         1.295e-002	 9.622e-004	  1.246e-005
 615.0	         1.349e-002	 9.733e-004	  1.313e-005
 620.0	         1.403e-002	 1.002e-003	  1.406e-005
 625.0	         1.454e-002	 1.042e-003	  1.515e-005
 630.0	         1.500e-002	 1.085e-003	  1.627e-005
 635.0	         1.542e-002	 1.128e-003	  1.740e-005
 640.0	         1.586e-002	 1.161e-003	  1.841e-005
 645.0	         1.635e-002	 1.175e-003	  1.921e-005
 650.0	         1.696e-002	 1.178e-003	  1.997e-005
 655.0	         1.773e-002	 1.165e-003	  2.066e-005
 660.0	         1.868e-002	 1.146e-003	  2.141e-005
 665.0	         1.988e-002	 1.119e-003	  2.225e-005
 670.0	         2.140e-002	 1.087e-003	  2.326e-005
 675.0	         2.323e-002	 1.058e-003	  2.457e-005
 680.0	         2.539e-002	 1.026e-003	  2.606e-005
 685.0	         2.779e-002	 1.004e-003	  2.789e-005
 690.0	         3.016e-002	 9.880e-004	  2.980e-005
 695.0	         3.256e-002	 9.769e-004	  3.181e-005
 700.0	         3.470e-002	 9.698e-004	  3.365e-005
 705.0	         3.668e-002	 9.646e-004	  3.538e-005
 710.0	         3.843e-002	 9.582e-004	  3.683e-005
 715.0	         4.005e-002	 9.503e-004	  3.806e-005
 720.0	         4.149e-002	 9.409e-004	  3.904e-005
 725.0	         4.284e-002	 9.291e-004	  3.980e-005
 730.0	         4.411e-002	 9.152e-004	  4.037e-005
 735.0	         4.525e-002	 9.010e-004	  4.077e-005
 740.0	         4.636e-002	 8.851e-004	  4.103e-005
 745.0	         4.734e-002	 8.697e-004	  4.117e-005
 750.0	         4.829e-002	 8.529e-004	  4.118e-005
 755.0	         4.920e-002	 8.356e-004	  4.111e-005
 760.0	         5.003e-002	 8.182e-004	  4.093e-005
 765.0	         5.081e-002	 8.007e-004	  4.068e-005
 770.0	         5.153e-002	 7.834e-004	  4.037e-005
 775.0	         5.224e-002	 7.654e-004	  3.998e-005
 780.0	         5.287e-002	 7.478e-004	  3.954e-005
 785.0	         5.345e-002	 7.308e-004	  3.906e-005
 790.0	         5.401e-002	 7.137e-004	  3.855e-005
 795.0	         5.447e-002	 6.973e-004	  3.798e-005
 800.0	         5.493e-002	 6.813e-004	  3.743e-005
 805.0	         5.538e-002	 6.660e-004	  3.688e-005
 810.0	         5.571e-002	 6.526e-004	  3.635e-005
 815.0	         5.609e-002	 6.392e-004	  3.585e-005
 820.0	         5.638e-002	 6.279e-004	  3.540e-005
 825.0	         5.664e-002	 6.179e-004	  3.500e-005
 830.0	         5.687e-002	 6.098e-004	  3.468e-005
 835.0	         5.704e-002	 6.037e-004	  3.443e-005
 840.0	         5.721e-002	 5.991e-004	  3.427e-005
 845.0	         5.734e-002	 5.967e-004	  3.421e-005
 850.0	         5.744e-002	 5.956e-004	  3.421e-005
 855.0	         5.754e-002	 5.965e-004	  3.432e-005
 860.0	         5.755e-002	 5.992e-004	  3.448e-005
 865.0	         5.759e-002	 6.027e-004	  3.471e-005
 870.0	         5.761e-002	 6.075e-004	  3.500e-005
 875.0	         5.759e-002	 6.133e-004	  3.532e-005
 880.0	         5.755e-002	 6.197e-004	  3.567e-005
 885.0	         5.752e-002	 6.266e-004	  3.604e-005
 890.0	         5.749e-002	 6.336e-004	  3.643e-005
 895.0	         5.740e-002	 6.409e-004	  3.679e-005
 900.0	         5.735e-002	 6.475e-004	  3.714e-005
 905.0	         5.728e-002	 6.540e-004	  3.746e-005
 910.0	         5.720e-002	 6.604e-004	  3.777e-005
 915.0	         5.715e-002	 6.658e-004	  3.805e-005
 920.0	         5.709e-002	 6.707e-004	  3.829e-005
 925.0	         5.701e-002	 6.751e-004	  3.849e-005
 930.0	         5.691e-002	 6.791e-004	  3.865e-005
 935.0	         5.686e-002	 6.818e-004	  3.876e-005
 940.0	         5.676e-002	 6.846e-004	  3.886e-005
 945.0	         5.670e-002	 6.865e-004	  3.892e-005
 950.0	         5.663e-002	 6.879e-004	  3.896e-005
 955.0	         5.652e-002	 6.892e-004	  3.895e-005
 960.0	         5.645e-002	 6.894e-004	  3.892e-005
 965.0	         5.637e-002	 6.891e-004	  3.884e-005
 970.0	         5.623e-002	 6.890e-004	  3.874e-005
 975.0	         5.610e-002	 6.880e-004	  3.860e-005
 980.0	         5.594e-002	 6.865e-004	  3.840e-005
 985.0	         5.569e-002	 6.854e-004	  3.817e-005
 990.0	         5.547e-002	 6.831e-004	  3.789e-005
 995.0	         5.509e-002	 6.815e-004	  3.755e-005
1000.0	         5.464e-002	 6.797e-004	  3.714e-005
1005.0	         5.401e-002	 6.786e-004	  3.665e-005
1010.0	         5.326e-002	 6.768e-004	  3.605e-005
1015.0	         5.235e-002	 6.751e-004	  3.534e-005
1020.0	         5.121e-002	 6.742e-004	  3.453e-005
1025.0	         4.970e-002	 6.748e-004	  3.354e-005
1030.0	         4.781e-002	 6.769e-004	  3.236e-005
1035.0	         4.572e-002	 6.775e-004	  3.097e-005
1040.0	         4.316e-002	 6.812e-004	  2.940e-005
1045.0	         4.035e-002	 6.859e-004	  2.768e-005
1050.0	         3.733e-002	 6.908e-004	  2.579e-005
1055.0	         3.413e-002	 6.961e-004	  2.376e-005
1060.0	         3.059e-002	 7.085e-004	  2.167e-005
1065.0	         2.733e-002	 7.153e-004	  1.955e-005
1070.0	         2.500e-002	 7.019e-004	  1.755e-005
1075.0	         2.279e-002	 6.919e-004	  1.577e-005
1080.0	         2.071e-002	 6.876e-004	  1.424e-005
1085.0	         1.873e-002	 6.861e-004	  1.285e-005
1090.0	         1.694e-002	 6.845e-004	  1.159e-005
1095.0	         1.520e-002	 6.851e-004	  1.041e-005
1100.0	         1.362e-002	 6.854e-004	  9.336e-006
