
%%
%aceasta functie ruleaza intregul proiect 

%citeste o imagine
img = imread('C:\Users\stefa\Desktop\an3sem1\va\tema2\data\lac.jpg');

%reducem imaginea in latime cu 20 de pixeli
%seteaza parametri
parametri.optiuneRedimensionare = 'eliminaObiect';
parametri.numarPixeliLatime = 100;
parametri.ploteazaDrum = 0;
parametri.culoareDrum = [255 0 0]';%culoarea rosie
parametri.metodaSelectareDrum ='programareDinamica';%optiuni posibile: 'aleator','greedy','programareDinamica'


imgRedimensionata_proiect = redimensioneazaImagine(img,parametri); 

%foloseste functia imresize pentru redimensionare traditionala
imgRedimensionata_traditional = imresize(img,[ size(imgRedimensionata_proiect,1) size(imgRedimensionata_proiect,2)]);

%ploteaza imaginile obtinute
figure, hold on;

%1. imaginea initiala
h1 = subplot(1,3,1);imshow(img);
xsize = get(h1,'XLim'); ysize = get(h1,'YLim');
set(h1, 'XLim', xsize, 'YLim', ysize);
xlabel('imaginea initiala');

%2. imaginea redimensionata cu pastrarea continutului
h2 = subplot(1,3,2);imshow(imgRedimensionata_proiect);
%xsize = get(h2,'XLim');ysize = get(h2,'YLim');
set(h2, 'XLim', xsize, 'YLim', ysize);
xlabel('rezultatul nostru');

%3. imaginea obtinuta prin redimensionare traditionala
h3 = subplot(1,3,3);imshow(imgRedimensionata_traditional);
%xsize = get(h3,'XLim');ysize = get(h3,'YLim');
set(h3, 'XLim', xsize, 'YLim', ysize);
xlabel('rezultatul imresize');
