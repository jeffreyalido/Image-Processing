curD = pwd;
[filename1, pathname2] = uigetfile('*.*','Select converted bin images','MultiSelect','on');
imageCell = 1;
cd(pathname2);
bigCanvas = zeros(4*600,6*600);
imageCell = cell(1,length(filename));
for i = 1 : length(filename1)
    imageCell{1,i} = imread(filename1{i});
    if i == 1
        bigCanvas(1:600,1:600) = imageCell{1,i};
    elseif i == 2
        bigCanvas(1:600,601:1200) = imageCell{1,i};
    elseif i == 3
        bigCanvas(1:600,1201:1800) = imageCell{1,i};
    elseif i == 4
        bigCanvas(1:600,1801:2400) = imageCell{1,i};
    elseif i == 5
        bigCanvas(1:600,2401:3000) = imageCell{1,i};
    elseif i == 6
        bigCanvas(1:600,3001:3600) = imageCell{1,i};
    elseif i == 7
        bigCanvas(601:1200,1:600) = imageCell{1,i};
    elseif i == 8
        bigCanvas(601:1200,601:1200) = imageCell{1,i};
    elseif i == 9
        bigCanvas(601:1200,1201:1800) = imageCell{1,i};
    elseif i == 10
        bigCanvas(601:1200,1801:2400) = imageCell{1,i};
    elseif i == 11
        bigCanvas(601:1200,2401:3000) = imageCell{1,i};
    elseif i == 12
        bigCanvas(601:1200,3001:3600) = imageCell{1,i};
    elseif i == 13
        bigCanvas(1201:1800,1:600) = imageCell{1,i};
    elseif i == 14
        bigCanvas(1201:1800,601:1200) = imageCell{1,i};
    elseif i == 15
        bigCanvas(1201:1800,1201:1800) = imageCell{1,i};
    elseif i == 16
        bigCanvas(1201:1800,1801:2400) = imageCell{1,i};
    elseif i == 17
        bigCanvas(1201:1800,2401:3000) = imageCell{1,i};
    elseif i == 18
        bigCanvas(1201:1800,3001:3600) = imageCell{1,i};
    elseif i == 19
        bigCanvas(1801:2400,1:600) = imageCell{1,i};
    elseif i == 20
        bigCanvas(1801:2400,601:1200) = imageCell{1,i};
    elseif i == 21
        bigCanvas(1801:2400,1201:1800) = imageCell{1,i};
    elseif i == 22
        bigCanvas(1801:2400,1801:2400) = imageCell{1,i};
    elseif i == 23
        bigCanvas(1801:2400,2401:3000) = imageCell{1,i};
    elseif i == 24
        bigCanvas(1801:2400,3001:3600) = imageCell{1,i};
    end
end
cd ..
imwrite(bigCanvas,'bigCanvasBinRaw.png','png')
cd(curD);