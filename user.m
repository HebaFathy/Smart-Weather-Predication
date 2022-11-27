   d=input('enter the day               : ');
   m=input('enter the month             : ');
   y=input('enter the year              : ');
cmin=input('enter min degree of cairo   : ');
cmax=input('enter max degree of cairo   : ');

amin=input('enter min degree of alex    : ');
amax=input('enter max degree of alex    : ');

hmin=input('enter min degree of hurgada : ');
hmax=input('enter max degree of hurgada : ' );

lmin=input('enter min degree of luxor   : ' );
lmax=input('enter max degree of luxor   : ');




  for i=1:1:7;     
 cminv=[cmin cmin cmin cmin cmin cmin cmin cmin cmin cmin cmin  cmax  cmax cmax cmax cmax cmax cmax cmax cmax cmax cmax cmax];  
       cminv=cminv';
 cmaxv=[cmax cmax cmax cmax cmax cmax cmax cmax cmax cmax cmax  cmin cmin cmin cmin cmin cmin cmin cmin cmin cmin cmin cmin  ];
        cmaxv=cmaxv';
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       aminv=[amin amin amin amin amin amin amin amin amin amin amin  amax  amax amax amax amax amax amax amax amax amax amax amax];
       aminv=aminv';
       
     amaxv=[amax amax amax amax amax amax amax amax amax amax amax   amin  amin amin amin amin amin amin amin amin amin amin amin ];  
       
       amaxv=amaxv';
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hminv=[hmin hmin hmin hmin hmin hmin hmin hmin hmin hmin hmin  hmax  hmax hmax hmax hmax hmax hmax hmax hmax hmax hmax hmax];
   hminv=hminv';    
 hmaxv=[  hmax hmax hmax hmax hmax hmax hmax hmax hmax hmax hmax  hmin  hmin hmin hmin hmin hmin hmin hmin hmin hmin hmin hmin ];      
       hmaxv=hmaxv';
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
 lminv=[lmin lmin lmin lmin lmin lmin lmin lmin lmin lmin lmin  lmax  lmax lmax lmax lmax lmax lmax lmax lmax lmax lmax lmax]; 
    lminv=lminv';   
  lmaxv=[lmax lmax lmax lmax lmax lmax lmax lmax lmax lmax lmax   lmin  lmin lmin lmin lmin lmin lmin lmin lmin lmin lmin lmin ];
       lmaxv=lmaxv';
       
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
       
       pmin=wk1read('Data\Cairo\2006min');
Tmin=wk1read('Data\Cairo\target2006min');
pmin=pmin';
Tmin=Tmin';
net = newff([min(min(pmin)), max(max(pmin))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');

net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmin,Tmin)
trian_data_min = sim(net,pmin);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for cairo min
test_output_min_c=sim(net,cminv)
%test_output_min=test_output_min'
cmin=test_output_min_c;
cairo(i,1)=cmin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for alex min

 pmin=wk1read('Data\Alex\2006min');
Tmin=wk1read('Data\Alex\target2006min');
pmin=pmin';
Tmin=Tmin';
net = newff([min(min(pmin)), max(max(pmin))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');

net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmin,Tmin)
trian_data_min = sim(net,pmin);

test_output_min_a=sim(net,aminv)
amin=test_output_min_a;
alex(i,1)=amin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for hur min

 pmin=wk1read('Data\Hurgada\2006min');
Tmin=wk1read('Data\Hurgada\target2006min');
pmin=pmin';
Tmin=Tmin';
net = newff([min(min(pmin)), max(max(pmin))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');

net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmin,Tmin)
trian_data_min = sim(net,pmin);

test_output_min_h=sim(net,hminv)
hmin=test_output_min_h;
h(i,1)=hmin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for luxor min

 pmin=wk1read('Data\Luxor\2006min');
Tmin=wk1read('Data\Luxor\target2006min');
pmin=pmin';
Tmin=Tmin';
net = newff([min(min(pmin)), max(max(pmin))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');

net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmin,Tmin)
trian_data_min = sim(net,pmin);

test_output_min_l=sim(net,lminv)
lmin=test_output_min_l;
l(i,1)=lmin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%max
pmax=wk1read('Data\Cairo\2006max');
Tmax=wk1read('Data\Cairo\target2006max');
pmax=pmax';
Tmax=Tmax';
net = newff([min(min(pmax)), max(max(pmax))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');


net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmax,Tmax)


trian_data_max = sim(net,pmax);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for cairo max
test_output_max_c=sim(net,cmaxv)
%test_output_max=test_output_max'
cmax=test_output_max_c;
cairo(i,2)=cmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for alex max

pmax=wk1read('Data\Alex\2006max');
Tmax=wk1read('Data\Alex\target2006max');
pmax=pmax';
Tmax=Tmax';
net = newff([min(min(pmax)), max(max(pmax))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');


net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmax,Tmax)


trian_data_max = sim(net,pmax);

test_output_max_a=sim(net,amaxv)
amax=test_output_max_a;
alex(i,2)=amax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for hur max


pmax=wk1read('Data\Hurgada\2006max');
Tmax=wk1read('Data\Hurgada\target2006max');
pmax=pmax';
Tmax=Tmax';
net = newff([min(min(pmax)), max(max(pmax))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');


net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmax,Tmax)


trian_data_max = sim(net,pmax);

test_output_max_h=sim(net,hmaxv)
hmax=test_output_max_h;
h(i,2)=hmax;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%peredect for luxor max


pmax=wk1read('Data\luxor\2006max');
Tmax=wk1read('Data\luxor\target2006max');
pmax=pmax';
Tmax=Tmax';
net = newff([min(min(pmax)), max(max(pmax))],[23 1],{'purelin' 'purelin'},'TRAINRP','LEARNGD','MSE');


net.numInputs=23;
net.trainParam.mc=.1
net.trainParam.min_grad=0;
net.trainParam.lr=.01
net.trainParam.epochs =50;
net.trainParam.goal = .01;
net = train(net,pmax,Tmax)


trian_data_max = sim(net,pmax);

test_output_max_l=sim(net,lmaxv)
lmax=test_output_max_l;
l(i,2)=lmax;
end;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%prdect for 3 days come


 
 
 

cairo
alex
h
l
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for i=1:1:7;
    
    if(m==1 | m==3 | m==5 | m==7 | m==8 | m==10| m==12 )
        if(d>31)
            d=1;
            m=m+1;
            
            end;
            if(m>12)
                y=y+1;
                m=1;
            end;
            
        
    else
        if(i==4 | i==6 | i==9 | i==11 )
            if(d>30)
            m=m+1;
            d=1;
            end;
            if(m>12)
                y=y+1;
                m=1;
            end;
            
        else
            if(d>28)
            m=m+1;
            d=1;
            end;
             if(m>12)
                y=y+1;
                m=1;
            end;
            
        end;
    end;
        
    if(d<10)
        sd=strcat('0',num2str(d));
    else
        sd=strcat(num2str(d));
    end;
    
    if(m<10)
        sm=strcat('0',num2str(m));
    else
        sm=strcat(num2str(m));
    end;
    ss=strcat(sm,'.',sd,'.','0',num2str(y));
    
    date(i,1)=cellstr(ss);
    d=d+1;
end;

  date;     
datev=date




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
connA=database('weather','root','')
colnames={'date','min','max'}
colnames2={'min','max'};
resultc=cell(4,3);

for i=1:1:7;
   resultc(i,1)={datev(i)};
   resultc(i,2)={cairo(i,1)};
   resultc(i,3)={cairo(i,2)};
   
   resulta(i,1)={datev(i)};
   resulta(i,2)={alex(i,1)};
   resulta(i,3)={alex(i,2)};
   
   resulth(i,1)={datev(i)};
   resulth(i,2)={h(i,1)};
   resulth(i,3)={h(i,2)};
   
   resultl(i,1)={datev(i)};
   resultl(i,2)={l(i,1)};
   resultl(i,3)={l(i,2)};
   resultc
   
end;
end;
curs=exec(connA,'select date from cairo');
curs=fetch(curs);
ddd=curs.data
numrow=rows(curs)
dnew='04.09.07';
%update(connA,'cairo',colnames,dnew,'where cairo.date=''04.01.07''')
aa=[datev(1) datev(2) datev(3) datev(4) datev(5) datev(6) datev(7) ]
aa=aa';
col={'min','max'};
dn={2,10}
%for i=1:1:numrow;
%if(ddd(1)=='09.10.07')
%    update(connA,'cairo',col,dn,'where date=''09.10.07''')

insert(connA,'cairo',colnames,resultc)
insert(connA,'alex',colnames,resulta)
insert(connA,'hurgada',colnames,resulth)
insert(connA,'luxor',colnames,resultl)
close(connA)