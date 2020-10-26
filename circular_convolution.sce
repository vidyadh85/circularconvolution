clear
clc
close

x = input('Enter input sequence x(n) =');
h = input('Enter impulse response h(n) = ');

lx = length(x) 
lh = length(h) 

N = max(lx,lh)


x = [x zeros(1,N - lx)]
h = [h zeros(1,N - lh)] 

n1 = 2:N; 

xm = [x(1) flipdim(x(n1),2)]
disp(xm)
yc = sum(xm.*h) // to get sum of product


for n2 = 2:N
    xm = [xm(N)  xm(n1-1)]
    disp(xm)
    yc(n2) = sum(xm.*h)
end

disp("Circular convolution of sequence is : y(n) = ", yc')

