curD = pwd;
[filename, pathname] = uigetfile('*.*','Select big Tiff Canvas');
cd(pathname);
bigCanvas = imread(filename);
[filename1, pathname2] = uigetfile('*.*','Select raw tiff images','MultiSelect','on');
imageCell = cell(1,length(filename1));
mkdir('preprocessed');
cd('preprocessed');
for i = 1 :length(filename1)
    if i == 1
    imageCell{1,i} = bigCanvas(1:600,1:600);
    elseif i == 2
    imageCell{1,i} = bigCanvas(1:600,601:1200);
    elseif i == 3
    imageCell{1,i} = bigCanvas(1:600,1201:1800);
    elseif i == 4
    imageCell{1,i} = bigCanvas(1:600,1801:2400);
    elseif i == 5
    imageCell{1,i} = bigCanvas(1:600,2401:3000);
    elseif i == 6
    imageCell{1,i} = bigCanvas(1:600,3001:3600);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
    elseif i == 7
    imageCell{1,i} = bigCanvas(601:1200,1:600);
    elseif i == 8
    imageCell{1,i} = bigCanvas(601:1200,601:1200);
    elseif i == 9
    imageCell{1,i} = bigCanvas(601:1200,1201:1800);
    elseif i == 10
    imageCell{1,i} = bigCanvas(601:1200,1801:2400);
    elseif i == 11
    imageCell{1,i} = bigCanvas(601:1200,2401:3000);
    elseif i == 12
    imageCell{1,i} = bigCanvas(601:1200,3001:3600); 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif i == 13
    imageCell{1,i} = bigCanvas(1201:1800,1:600);
    elseif i == 14
    imageCell{1,i} = bigCanvas(1201:1800,601:1200);
    elseif i == 15
    imageCell{1,i} = bigCanvas(1201:1800,1201:1800);
    elseif i == 16
    imageCell{1,i} = bigCanvas(1201:1800,1801:2400);
    elseif i == 17
    imageCell{1,i} = bigCanvas(1201:1800,2401:3000);
    elseif i == 18
    imageCell{1,i} = bigCanvas(1201:1800,3001:3600);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif i == 19
    imageCell{1,i} = bigCanvas(1801:2400,1:600);
    elseif i == 20
    imageCell{1,i} = bigCanvas(1801:2400,601:1200);
    elseif i == 21
    imageCell{1,i} = bigCanvas(1801:2400,1201:1800);
    elseif i == 22
    imageCell{1,i} = bigCanvas(1801:2400,1801:2400);
    elseif i == 23
    imageCell{1,i} = bigCanvas(1801:2400,2401:3000);
    elseif i == 24
    imageCell{1,i} = bigCanvas(1801:2400,3001:3600);
    end
    
    imwrite(imageCell{1,i}, strcat('painted_',filename1{i}),'png');
end
cd(curD);
