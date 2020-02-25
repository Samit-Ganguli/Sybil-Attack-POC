%function [outgoingTable] = createRoundRobinSchedulerNetwork()
n_total=9000;
rand_rng=4;
N_start=1:n_total;
N_full=[N_start; zeros(7,n_total)];
%Nnew=reshape(N,[8,10000]);
%V_1=0:6; V_2=0:6; V_3=0:6; V_4=0:6; V_5=0:6; V_6=0:6; V_7=0:6; V_8=0:6;
%RR_sched= [V_1; V_2; V_3; V_4; V_5; V_6; V_7; V_8];
index_V_full = [0; 1; 2; 3; 4; 5; 6; 7];
r = randi([1 56], [1 n_total+1]);
r_rem = randi([0 7], [1 n_total+1]);

for n = 1:n_total
    node=N_full(1,n);
    connect=r(1,n);
    N_full(2,n)=connect;

    for i = 2:8        
        next = N_full(i,n);
        index_V = floor(next/7);
        if (index_V == 0)
            index_V = 8;
        end
        %rem = mod(connect,7);

        next_V = index_V_full(index_V,1);
        index_V_full(index_V,1)=mod(index_V-1,8); %adjusts index value of RR_Sched as though circular queue in place
        N_full(i+1,n)=next_V*7+ r_rem(1,n+i);
    end
end