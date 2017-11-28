%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 

sol1 = ode23(@repressilator,[0 200],[1,0,0])
colour = 'r-';
figure(1);
for ii = 1:3
    switch ii
    case 2
        colour = 'b-';
    case 3
        colour = 'g-';
    end
plot(sol1.x,sol1.y(ii,:),colour); hold on;
end
hold off;

figure(2);
plot(sol1.y(1,:),sol1.y(2,:)); hold on;
plot(sol1.y(1,:),sol1.y(3,:)); hold on;
plot(sol1.y(2,:),sol1.y(3,:)); hold off;

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?
%Adam: the code below shows that all three values for y will be the same at
%every point in time. This means that they will rise and fall at the same
%rate, making the movement linear instead of oscilatory.
sol2 = ode23(@repressilator,[0 200],[0.5,0.5,0.5])
colour = 'r-';
figure(3);
for ii = 1:3
    switch ii
    case 2
        colour = 'b-';
    case 3
        colour = 'g-';
    end
plot(sol2.x,sol2.y(ii,:),colour); hold on;
end
hold off;

figure(4);
plot(sol2.y(1,:),sol2.y(2,:)); hold on;
plot(sol2.y(1,:),sol2.y(3,:)); hold on;
plot(sol2.y(2,:),sol2.y(3,:)); hold off;

%%
% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 
for ii = 1:100
 ii
sol3(ii) = ode23(@repressWithK,[0 200],[1,0,0,ii])
colour = 'r-';
figure(5);
for iii = 1:3
    switch iii
    case 1
        colour = 'r-';
    case 2
        colour = 'b-';
    case 3
        colour = 'g-';
    end
plot(sol3.x,sol1.y(iii,:),colour); hold on;
end
hold off;
end



% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 