
% ejercicio 1
a = 50;
% la transformaada de nuestra ecuacion es  1 / (a+jw)
rango = -10:0.1:10;
transformada = 1 ./ (a + 1i*rango);
partesReales = real(transformada);
partesImaginarias =imag(transformada);

modulos = sqrt(partesReales.^2 + partesImaginarias.^2);
fases = atan2(partesImaginarias, partesReales);
hold on; 
subplot(4,1,1);
plot(rango, partesReales);
subplot(4,1,2);
plot(rango, partesImaginarias);
subplot(4,1,3);
plot(rango, modulos);
subplot(4,1,4);
plot(rango, fases);
hold off;

% EJERCICIO 2

figure;

%Representación de la señal en el dominio del tiempo
hold on;
N1 = 5;
n = -50:1:50;
x_pulse = zeros(size(n));
x_pulse(find(abs(n)<=N1)) = 1;
pintar(x_pulse,n); 
hold off;


%Ejercicio 3 : 
[n,x_pulse]=repite_pulso(N1,1);

pintar(x_pulse,n); 

%ejercicio 4 :

hold on
n_points = 1001; 
 
% Explore distintos valores para delta_t
delta_t = 0.001;
t = -2:delta_t:2;
x = sin(t.*2)
w = linspace(-6*pi,6*pi,n_points);
for k = 1:length(w)
   Xw_num(k) = sum(x.*exp(-j*w(k)*t)*delta_t);
end 
subplot(2,1,2)
plot(w,real(Xw_num)); 
plot(w,imag(Xw_num)); 
xlabel('w'); ylabel('X_{pulse}(e^{jw})'); title('Dominio de la frecuencia')
hold off;
% Xw_num contiene la evaluación numérica de la integral de análisis de Fourier

function pintar (x_pulse,n);

subplot(2,1,1);
stem(n,x_pulse);
xlabel('n'); ylabel('x_{pulse}[n]'); title('Dominio del tiempo')



%Representación de la señal en el dominio de la frecuencia 
n_points=1001;
w = linspace(-pi*6,pi*6,n_points);

for k = 1:length(w)
   X_pulse(k) = sum(x_pulse.*exp(j*n*w(k)));
end

subplot(2,1,2)
plot(w,real(X_pulse));
xlabel('w'); ylabel('X_{pulse}(e^{jw})'); title('Dominio de la frecuencia')
end
 
%Ejercicio 3 :

function [n_ext,x_ext] = repite_pulso(N1,n_times)
 
n = -10:10;
x = zeros(size(n));
x(find(abs(n)<=N1)) = 1;
 
x_ext = x;
for k = 1:n_times
   x_ext = [x x_ext x];
end
 
max_n = (length(x_ext)-1)/2;
n_ext = -max_n:max_n;
end
