function [FCLTR] = Codeo2(u, val1, val2)

%% COCHES 
    PC = Trapezo(u, 0, 0, 3, 6);
    IC = Trapezo(u, 3, 6, 9, 12);  
    MC = Trapezo(u, 9, 12, 15, 15);    
    
%% RUIDO
    PO = Trapezo(u, 0, 0, 3, 6);
    MO = Trapezo(u, 3, 6, 9, 12);  
    RO = Trapezo(u, 9, 12, 15, 15);    
    
  
%% TIEMPO ROJO
    TR = 0 :0.1:9;
    
    L = Trapezo(TR,6,8,9,9);
    M = Trapezo(TR, 3,5,6,8);  
    H = Trapezo(TR, 0, 2, 3, 5);

    SEPC = PC(u == val1);
    SEIC = IC(u == val1);
    SEMC = MC(u == val1);
    
    vectorcoches=[SEPC,SEIC,SEMC];

    
    SEPO = PO(u == val2);
    SEMO = MO(u == val2);
    SERO = RO(u == val2);
    
    vectorruido=[SERO,SEMO,SEPO];
    op=[];
    k=1;
    for i=1:3
    for j=1:3 
        op(k)=min(vectorcoches(i),vectorruido(j));
        k=k+1;
    end
end
    
    clL=min(L,max([op(4),op(7)]));
    clM=min(M,max([op(1),op(2),op(5),op(8),op(9)]));
    clH=min(H,max([op(3),op(6)]));
    FCLTR=max(clL,max(clM,clH));

    
end