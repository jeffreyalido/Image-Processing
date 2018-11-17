curD = pwd;
[filename, pathname] = uigetfile({'*.png;*.bmp;*.tiff;*.jpeg;*.*'},'Select images in anchored','MultiSelect','on');

cd(pathname);

imageCell = cell(1,length(filename));
for i = 1 : length(filename)
    imageCell{1,i} = imread(filename{i});
    imageCell{1,i} = im2double(imageCell{1,i});
    imageCell{1,i} = imageCell{1,i}(:,:,1);
    imageCell{1,i} = imadjust(imageCell{1,i});
end
cd ..
mkdir('preprocessed_1');
cd('preprocessed_1');
preprocessed1 = pwd;
cd(curD);
for i = 1 : length(filename)
    figure('Name','whole image imadjusted','NumberTitle','off')
    imshow(imageCell{1,i});
    while(true)
        finishedP = input('Have you selected all the underpolymerized areas? enter y or n: ','s');
        if finishedP == 'y'
            cd(preprocessed1);
            imwrite(imageCell{1,i},strcat('Preprocessed1_',filename{i}),'png');
            break;
        end
        [x, y] = ginputc(5, 'Color', 'r', 'LineWidth', .5);
        segment = imageCell{1,i}(y(1) - 5 :y(3) + 5,x(1) - 5 : x(2) + 5);
        figure('Name','segment','NumberTitle','off')
        imshow(segment)
        while(true)
            edgeN = input('enter number between 0 and 1: \n');
            e = edge(segment,'canny',edgeN);
            gapN = input('enter number: ');
            f = filledgegaps(e,gapN);

            figure('Name','edges','NumberTitle','off')
            imshow(f)
            okA = input('look ok? enter y or n: ','s');
            if okA == 'y'
                break
            end
        end
        
        while(true)
            g = imfill(f);
            figure('Name','final segment','NumberTitle','off')
            imshow(g)
            okB = input('filling look okay? enter y or n: ','s');
            if okB == 'y'
                imageCell{1,i}(y(1) : y(3), x(1) : x(2)) = g(5:end - 6,5:end - 6);
                cd(preprocessed1);
                imwrite(imageCell{1,i},strcat('Preprocessed1_',filename{i}),'png');
                break;
            end
        end
        cd(curD);

    end
    cd(curD);
end

        