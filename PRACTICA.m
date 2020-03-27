u1 = 0 :0.1: 15;

TR = 0 :0.1:9;
    
LOW = Trapezo(TR,6,8,9,9);
MED = Trapezo(TR, 3,5,6,8);  
HIGH = Trapezo(TR, 0, 2, 3, 5);



[X, Y] = meshgrid(0:0.1:15, 0:0.1:15);
Zs = X;
u2 = 0:0.1:15;
x = 1;
for i = u2
    y = 1;
    for j = u2
        [FCLTR] = Codeo2(u2, i, j);
        Tiempor = defuzz(TR, FCLTR, 'centroid');
        Zs(y, x) = Tiempor;
        y = y + 1;
    end
    x = x + 1;
end
    
figure(1)
surf(X, Y, Zs)
title('Tiempo rojo')
xlabel('Coches')
ylabel('Ruido')


    val1 = input('Introduce value for cars: ');
    val2 = input('Introduce value for noise: ');
    
    

    [FCLTR] = Codeo2(u1, val1, val2);
    
    figure(2)
    hold on
    plot(TR, FCLTR, 'LineWidth', 2);
    
    Tiempor = defuzz(TR, FCLTR, 'centroid');
    
    fprintf('Tirmpo rojo: %.2f \n', Tiempor);
    
    
