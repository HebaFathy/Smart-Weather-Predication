




inputcairo2006=wk1read('Data\Cairo\2006');
inputcairo2007=wk1read('Data\Cairo\2007');
inputcairo2006=inputcairo2006(:,8:9)
inputcairo2007=inputcairo2007(1:171,8:9);

inputalex2006=wk1read('Data\Alex\2006');
inputalex2007=wk1read('Data\Alex\2007');
inputalex2006=inputalex2006(:,6:7)
inputalex2007=inputalex2007(1:171,6:7);

inputhurgada2006=wk1read('Data\Hurgada\2006');
inputhurgada2007=wk1read('Data\Hurgada\2007');
inputhurgada2006=inputhurgada2006(:,6:7)
inputhurgada2007=inputhurgada2007(1:171,6:7);


inputluxor2006=wk1read('Data\Luxor\2006');
inputluxor2007=wk1read('Data\Luxor\2007');
inputluxor2006=inputluxor2006(:,6:7)
inputluxor2007=inputluxor2007(1:171,6:7);


% form date matrix
zero='0';
dot='.';
datecell_index=1;

y='06';
date=[];
size=length(inputcairo2006)+length(inputcairo2007);
date_cell=cell(365,1);

%for of months
for k=1:1:2;
    if(k==1)
        y='06';
    else
        y='07';
    end;
for i=1:1:12;
    if(i==1 | i==3 | i==5 | i==7 | i==8 | i==10| i==12 )
        number_days=31;
    else
        if(i==4 | i==6 | i==9 | i==11 )
            number_days=30;
        else
            number_days=28;
        end;
    end;
   %if month < 10 put 0 e.g 01,02,etc
    if(i<10)
        month=strcat(zero,num2str(i));
    else
        month=strcat(num2str(i));
    end;
    %for of days
    for j=1:1:number_days;
        if(j<10)
            day=strcat(zero,num2str(j));
        else
            day=strcat(num2str(j));
        end;
        date_stirng=strcat(month,dot,day,dot,y);
        date_cell(datecell_index,1)=cellstr(date_stirng);
        datecell_index=datecell_index+1;
        
    end;
    
end;
end;
date= date_cell;
date
 size   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Database
connA=database('weather','root','')
colnames={'date','min','max'}
resultc=cell(size,3);
resulta=cell(size,3);
resulth=cell(size,3);
resultl=cell(size,3);

for i=1:1:size;
    if(i<=365)
   resultc(i,1)={date(i)};
   resultc(i,2)={inputcairo2006(i,2)};
   resultc(i,3)={inputcairo2006(i,1)};
   
   resulta(i,1)={date(i)};
   resulta(i,2)={inputalex2006(i,2)};
   resulta(i,3)={inputalex2006(i,1)};
   
   resulth(i,1)={date(i)};
   resulth(i,2)={inputhurgada2006(i,2)};
   resulth(i,3)={inputhurgada2006(i,1)};
   
   resultl(i,1)={date(i)};
   resultl(i,2)={inputluxor2006(i,2)};
   resultl(i,3)={inputluxor2006(i,1)};

else
    ii=i-365;
        
        resultc(i,1)={date(i)};
   resultc(i,2)={inputcairo2007(ii,2)};
   resultc(i,3)={inputcairo2007(ii,1)};
    
   resulta(i,1)={date(i)};
   resulta(i,2)={inputalex2007(ii,2)};
   resulta(i,3)={inputalex2007(ii,1)};
    
   resulth(i,1)={date(i)};
   resulth(i,2)={inputhurgada2007(ii,2)};
   resulth(i,3)={inputhurgada2007(ii,1)};
   
   resultl(i,1)={date(i)};
   resultl(i,2)={inputluxor2007(ii,2)};
   resultl(i,3)={inputluxor2007(ii,1)};
   
end;

end;




insert(connA,'cairo',colnames,resultc)
insert(connA,'alex',colnames,resulta)
insert(connA,'hurgada',colnames,resulth)
insert(connA,'luxor',colnames,resultl)
close(connA)
