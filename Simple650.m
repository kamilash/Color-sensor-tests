function [returnval]=Simple650()
calllib('cs_USB','cs_Open',0);
calllib('cs_USB','cs_Write',0,strcat('GOWAVE 500',uint8(10)));
calllib('cs_USB','cs_Write',0, strcat('WAVE?',uint8(10)));
returnval=calllib('cs_USB','cs_Read',0);
calllib('cs_USB','cs_Close',0);
