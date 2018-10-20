% Vector input trapezoid integration rule function
function d = Vtrap(v, t)
h = 0.277;
sum = (v(1) + v(end))/2;
    for i = 2:length(t) 
       sum = sum + v(i);
    end
d = h*sum;