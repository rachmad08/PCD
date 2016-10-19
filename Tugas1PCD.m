A=imread('C:/Users/Smantan/Pictures/wefie.jpg'); %membaca sebuah gambar
grayscaleA= uint8(0.2989 * double(A(:,:,1)) + ...
        0.5870*double(A(:,:,2)) + ...
        0.1141 * double(A(:,:,3))); 
%imshow(grayscaleA); %untuk melihat gambar grayscale
image1= 0.2*log(grayscaleA+1); %transformasi logaritmik dengan nilai c=0.2
image2= 0.3*log(grayscaleA+1); %transformasi logaritmik dengan nilai c=0.3
image3= 0.05*log(grayscaleA+1); %transformasi logaritmik dengan nilai c=0.05
%imshow(image1), title('c=0.2');  %menampilkan gambar image1
%imshow(image2),title('c=0.3');  %menampilkan gambar image2
%imshow(image3),title('c=0.05');  %menampilkan gambar image3
%hist(image1),title('hist image1'); %histogram pada image1
%hist(image2),title('hist image2'); %histogram pada image2
%hist(image3), title('hist image3'); %histogram pada image3

G1= grayscaleA+80;  %menambah citra keabuan dengan 80
G2= grayscaleA-80;  %mengurangi citra keabuan dengan 80
%imshow(G1);
%imshow(G2);
%hist(G1),title('hist +80');
%hist(G2), title('hist -80');

G1=double(G1); %merubah tipe bilangan dari uint8 ke tipe double
for i=1:size(G1,1)-2
    for j=1:size(G1,2)-2
        %menghitung nilai Gx
        Gx=(G1(i+2,j)+(2*G1(i+2,j+1))+G1(i+2,j+2))-(G1(i,j)+(2*G1(i,j+1))+G1(i,j+2));
        %menghitung nilai Gy
        Gy=(G1(i,j+2)+(2*G1(i+1,j+2))+G1(i+2,j+2))-(G1(i,j)+(2*G1(i+1,j))+G1(i+2,j));    
        %Gradien pada citra
        G1(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
G1 = uint8(G1);  %mengonversi tipe double ke uint8 (tipe bilangan bulat 8 bit)
%imshow(G1);

G2=double(G2); %merubah tipe bilangan dari uint8 ke tipe double
for i=1:size(G2,1)-2     %perulangan terhadap baris
    for j=1:size(G2,2)-2 %perulangan terhadap kolom
        %menghitung nilai Gx
        Gx=(G2(i+2,j)+(2*G2(i+2,j+1))+G2(i+2,j+2))-(G2(i,j)+(2*G2(i,j+1))+G2(i,j+2));
        %menghitung nilai Gy
        Gy=(G2(i,j+2)+(2*G2(i+1,j+2))+G2(i+2,j+2))-(G2(i,j)+(2*G2(i+1,j))+G2(i+2,j));    
        %Gradien pada citra
        G2(i,j)=sqrt(Gx.^2+Gy.^2);
    end
end
G2 = uint8(G2);  %mengonversi tipe double ke uint8 (tipe bilangan bulat 8 bit)
imshow(G2);






   