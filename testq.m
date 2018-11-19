curD = pwd;
[filename, pathname] = uigetfile({'*.png;*.bmp;*.tiff;*.jpeg;*.*'},'Select images','MultiSelect','on');
cd(pathname);
mkdir('preprocessed')
cd('preprocessed')
procD = pwd;
cd(curD);
if ischar(filename) % single image
    if ~exist(filename)
        cd(pathname)
    end
    a = imread(filename);
    cd(curD)

    a = im2double(a);
    a = a(:,:,1);
    a = imadjust(a);
    figure('Name','with contrast','NumberTitle','off')
    imshow(a)

    while(true)
        edgeN = input('enter number between 0 and 1: ');
        e = edge(a,'canny',edgeN); % 0.7 usually?
        gapN = input('enter number: ');
        f = filledgegaps(e,gapN); %15 for chec2, 5 for chec,
        figure('Name','edges','NumberTitle','off')
        imshow(f)
        okA = input('look ok? enter y or n: ','s');
        if okA == 'y' 
            break
        end
    end

    while(true)
        g = imfill(f);%,'holes'); % flowers uses holes
        figure('Name','final','NumberTitle','off')
        imshow(g)
        okB = input('filling look okay? enter y or n: ','s');
        if okB == 'y'
            imwrite(g,'test.png','png');
            break;
        end
    end
else
    if ~exist(filename{1})
        cd(pathname);
    end
    imageCell = cell(1,length(filename));
    for i = 1 : length(filename)
        imageCell{1,i} = imread(filename{i});
        imageCell{1,i} = im2double(imageCell{1,i});
        imageCell{1,i} = imageCell{1,i}(:,:,1);
        imageCell{1,i} = imadjust(imageCell{1,i});
    end
    cd(curD);
    for i = 1 : length(filename)
        ogFig = figure('Name','with contrast','NumberTitle','off');
        imshow(imageCell{1,i});
        figure(ogFig);

        while(true)
            edgeN = input('enter number between 0 and 1: ');
            e = edge(imageCell{1,i},'canny',edgeN); % 0.7 usually?
            gapN = input('enter number: ');
            f = filledgegaps(e,gapN); %15 for chec2, 5 for chec,
            figedge = figure('Name','edges','NumberTitle','off');
            imshow(f)
            figure(figedge);
            okA = input('look ok? enter y or n: ','s');
            close(figedge);
            if okA == 'y' 
                break;
            end
        end
    ogFig2 = figure('Name','with contrast','NumberTitle','off');
    imshow(imageCell{1,i});
    figure(ogFig2);
        while(true)
            g = imfill(f);%,'holes'); % flowers uses holes
            figfinal = figure('Name','final','NumberTitle','off')
            imshow(g)
            figure(figfinal);
            okB = input('filling look okay? enter y or n: ','s');
            close(figfinal);
            if okB == 'y'
                cd(procD);
                imwrite(g,strcat('Pre_processed2_',filename{i}),'png');
                break;
            end
        end
    close('with contrast');
    cd(curD)
    end
    cd(curD);
end
