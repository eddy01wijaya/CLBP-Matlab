clear
close all
clc

dataset=zeros(1,31);%membuat matriks 0, untuk diisi nilai ektraksi fitur
label=1; %variabel label dataset
jumlahDataPerkelas=[];%variabel jumlah data perkelas
for i = [1001:1616,2001:2612,2616:2675,3001:3563,3566:3621]% dari 1001 sampai jumlah data
    disp(i);
    i_char = int2str(i); %mengubah var i menjadi string
    leaves_original = imread(strcat('leaves/',i_char,'.jpg')); %memasukan gambar kedalam variabel matriks
    leaves=leaves_original;
    %leaves = imresize(leaves_original,[384 256]); %praproses resizing
    
    red = leaves(:,:,1); % mengambil nilai channel merah variabel leaves
    green = leaves(:,:,2); % mengambil nilai channel hijau variabel leaves
    blue = leaves(:,:,3); % mengambil nilai channel biru variabel leaves
    
    %ektraksi fitur LBP pada 3 channel, 
    %'upright' false untuk mengatasi varian rotasi, sehingga hanya memiliki 10 fitur/channel 
    lbpFeatures1 = extractLBPFeatures(red  ,'Upright',false);
    lbpFeatures2 = extractLBPFeatures(green,'Upright',false);
    lbpFeatures3 = extractLBPFeatures(blue ,'Upright',false);
    
    %variabel untuk memuat fitur data saat ini (fitur channel merah+fitur channel hijau+fitur channel biru dan label)
    currentData=[lbpFeatures1 lbpFeatures2 lbpFeatures3 label];
    %memasukan fitur data saat ini kevariabel yang akan menampung keseluruhan dataset
    dataset=[dataset;currentData];
    %mengubah variabel label agar sesuai dengan label aslinya
    if i>= 1001& i<= 1059 label=1;
    elseif i>= 1060& i<= 1122 label=2;
    elseif i>= 1552& i<= 1616 label=3;
    elseif i>= 1123& i<= 1194 label=4;
    elseif i>= 1195& i<= 1267 label=5;
    elseif i>= 1268& i<= 1323 label=6;
    elseif i>= 1324& i<= 1385 label=7;
    elseif i>= 1386& i<= 1437 label=8;
    elseif i>= 1497& i<= 1551 label=9;
    elseif i>= 1438& i<= 1496 label=10;
    elseif i>= 2001& i<= 2050 label=11;
    elseif i>= 2051& i<= 2113 label=12;
    elseif i>= 2114& i<= 2165 label=14;
    elseif i>= 2166& i<= 2230 label=15;
    elseif i>= 2231& i<= 2290 label=16;
    elseif i>= 2291& i<= 2346 label=17;
    elseif i>= 2347& i<= 2423 label=18;
    elseif i>= 2424& i<= 2485 label=19;
    elseif i>= 2486& i<= 2546 label=20;
    elseif i>= 2547& i<= 2612 label=21;
    elseif i>= 2616& i<= 2675 label=22;
    elseif i>= 3001& i<= 3055 label=23;
    elseif i>= 3056& i<= 3110 label=24;
    elseif i>= 3111& i<= 3175 label=25;
    elseif i>= 3176& i<= 3229 label=26;
    elseif i>= 3230& i<= 3281 label=27;
    elseif i>= 3282& i<= 3334 label=28;
    elseif i>= 3335& i<= 3389 label=29;
    elseif i>= 3390& i<= 3446 label=30;
    elseif i>= 3447& i<= 3510 label=31;
    elseif i>= 3511& i<= 3563 label=32;
    elseif i>= 3566& i<= 3621 label=33;
    end

end
    dataset(1,:) = [];%menghilangkan bagian atas matriks(karna sebelumnya diisi nilai 0)
    writematrix(dataset,'FlaviaLeavesHistogram.csv');%simpan nilai menjadi file