function E = calculeazaEnergie(img)
%calculeaza energia la fiecare pixel pe baza gradientului
%input: img - imaginea initiala
%output: E - energia

%urmati urmatorii pasi:
%transformati imaginea in grayscale
%folositi un filtru sobel pentru a calcula gradientul in directia x si y
%calculati magnitudinea gradientului
%E - energia = gradientul imaginii

%img1=imread('C:\Users\stefa\Desktop\tema2\data\delfin.jpeg');
grayImg=rgb2gray(img);
[Gx,Gy] = imgradientxy(grayImg);
%imshowpair(Gx,Gy,'montage')
[E,Gdir] = imgradient(Gx,Gy);
