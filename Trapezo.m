function [y] = mf_trapezoidal(x, a, b, c, d)
%     start = x(1);
%     step = x(2);
%     stop = x(3);
%     x = start : step : stop;
    
    y(x<a)= 0;

    x2 = x(a <= x & x < b);
    y(a <= x & x < b)= (x2 - a) / (b - a);

    y(b <= x & x < c) = 1;
    
    x4 = x(c <= x & x <= d);
    y(c <= x & x <= d) = (d - x4) / (d - c);

    y(d < x) = 0;
    
    if isnan(y(length(y)))
        y(length(y)) = 1;
    end
end