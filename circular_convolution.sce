//To find the circular convolution of a sequence x(n) and h(n)

// "conv" -- inbuilt command for linear convolution
// For circular convolution:
// x = {a,b,c,d}
//[a d c b      [h1
// b a d c       h2
// c b a d       h3
// d c b a]      h4]

// till n-1 time we have to do
// than element by element multiplication

// example:
// x(n) = {1,2,3,4} and h(n) = {1,2}

// [1 4 3 2     [1              [9
//  2 1 4 3      2               4
//  3 2 1 4      0      =        7
//  4 3 2 1]     0]              10]

//clear if any variable
clear
//clear console
clc
//close if any graph
close


//Asking for x(n) samples
x = input('Enter input sequence x(n) =');
//Asking for h(n) impulsive response
h = input('Enter impulse response h(n) = ');

// finding length of x(n) and h(n)
lx = length(x) // to get len of x(n)
lh = length(h) // to get len of h(n)

// finding the maximum length from x(n) and h(n)
N = max(lx,lh)

// to pad zero to if it's shorter
x = [x zeros(1,N - lx)] // to pad zerors if x(n) shorter
h = [h zeros(1,N - lh)] // to pad zerors if h(n) shorter

// to get first row of matrix --> x(n) as matrix
// flipdim(x,1) -- to flip row
// flipdim(x,2) -- to flip column 
// here 1 rep row, and 2 rep column

//n1 dummy variable to hold the index start to end for flip 
n1 = 2:N; 
//first row of matrix 
//flipdim(2:N,2)
xm = [x(1) flipdim(x(n1),2)]
disp(xm)
//first y(n) output
//sum(x.*y) gives the sum of product by element by element
yc = sum(xm.*h) // to get sum of product

//to get remaining output
for n2 = 2:N
    xm = [xm(N)  xm(n1-1)]
    disp(xm)
    yc(n2) = sum(xm.*h)
end

disp("Circular convolution of sequence is : y(n) = ", yc')



//plotting x(n), h(n) and y(n)
figure
subplot(311)
plot2d3(0:length(x)-1,x)
plot(0:length(x)-1,x,'red.')
title("x(n)");
xlabel('sample, n');
ylabel('Amplitude');
//setting the axis to origin
a11 = gca(); // get the current axes
a11.x_location = 'origin'; //set x axis to origin--0
a11.y_location = "origin"; //set y axis to origin--0


subplot(312)
plot2d3(0:length(h)-1,h)
plot(0:length(h)-1,h,'red.')
title("h(n)");
xlabel('sample, n');
ylabel('Amplitude');
//setting the axis to origin
a12 = gca(); // get the current axes
a12.x_location = 'origin'; //set x axis to origin--0
a12.y_location = "origin"; //set y axis to origin--0

subplot(313)
plot2d3(0:length(yc')-1,yc')
plot(0:length(yc')-1,yc','red.')
title("y(n)");
xlabel('sample, n');
ylabel('Amplitude');
//setting the axis to origin
a13 = gca(); // get the current axes
a13.x_location = 'origin'; //set x axis to origin--0
a13.y_location = "origin"; //set y axis to origin--0
