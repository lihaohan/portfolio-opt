load('hist_data_ps2.mat')
r_p = [1, 1.023, 1.045, 1.13];
x1 = zeros(1,12);
x1(1:4) = 1;
x2 = zeros(1,12);
x2(10:12) = 1;

r_bar = mean(R,1);

b = [1;0.25;0.2;r_p(1)];%r_P(i) i from 1 to 4

A1 = r_bar - R;

A2 = [ones(1,12);x1; x2;r_bar];

[Q2,R2]=qr(transpose(A2));
R2 = R2(1:4,:);
Y2 = Q2(: , 1:4);
Z2 = Q2(:, 5:12);
x0 = Y2*(transpose(R2)\b);

A_bar = A1*Z2;
b_bar = A1 * x0;

[Y_bar,R_bar]=qr(A_bar,0);
w_star = - R_bar\(transpose(Y_bar))*b_bar;
x_star = x0+ Z2 * w_star

risk = (norm(Aone * x_star)^2)/100;
disp('risk is');
disp(risk);

bias = (norm(A * x_star-b));
disp('bias is');
disp(bias);