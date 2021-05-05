function Experimental()
hs.window = figure(...
    'Name','Experimental',...
    'OuterPosition',[550 550 1000 459]...
    );

% defaults and constants
R_He = RCalc([0 1 0 0 0 0]);
%defaultTankRow = {0,R_He,48.99,2500,15,1.4108,100,10,0.0574,1.3534};

hs.gastanktable = uitable(hs.window,...
    'CellEditCallback',@gttEdit_callback,...
    'ColumnEditable',true,...
    'ColumnName',{'Tank Group','Gas R Val (SI)','Tank Vol (L)','Start PSI','°C Start','Start Mass (kg)','End PSI','°C End','End Mass (kg)','Mass Diff (kg)'},...
    'Position',[10 120 800 100],...
    'Data',{1,R_He,48.99,2500,15,1.4108,100,10,0.0574,1.3534;0,R_He,48.99,2500,15,1.4108,100,10,0.0574,1.3534;2,R_He,48.99,2500,15,1.4108,100,10,0.0574,1.3534;0,R_He,48.99,2500,15,1.4108,100,10,0.0574,1.3534}...
    );


hs.balloontable = uitable(hs.window,...
    'CellEditCallback',@btEdit_callback,...
    'ColumnEditable',true,...
    'ColumnName',{'Bln Mass (kg)','Insert Mass (kg)','Gas R Val (SI)','Gas Mass (kg)','Temp °C','Pres Diff (Pa)','Neck Lift (lbs)','use','Notes'},...
    'Position',[10 10 800 100],...
    'Data',{1.6,0.047,R_He,1.3534,15,50,15,true,'';1.6,0.047,R_He,1.3534,15,50,15,false,''}...
    );


    function gttEdit_callback(src,event) %UIcomponent,eventData
        pos = event.Indices(1);    
        R = cell2mat(src.Data(pos,2));
        V = cell2mat(src.Data(pos,3));
        P1 = cell2mat(src.Data(pos,4));
        T1 = cell2mat(src.Data(pos,5));
        T2 = cell2mat(src.Data(pos,8));
        if event.Indices(2) == 10
            Md = cell2mat(src.Data(pos,10));
            M1 = cell2mat(src.Data(pos,6));
            M2 = M1 - Md;
            P2 = GasPresCalc(R,V,M2,T2);
            src.Data(pos,7) = num2cell(P2);
        else
            P2 = cell2mat(src.Data(pos,7));
            M1 = GasMassCalc(R,V,P1,T1);
            M2 = GasMassCalc(R,V,P2,T2);
            Md = M1-M2;
            src.Data(pos,6) = num2cell(M1);
            src.Data(pos,9)= num2cell(M2);
            src.Data(pos,10) = num2cell(Md);
        end
        
    end

    function addtank_callback(~,~,hs)
        [n,~] = size(hs.gastanktable.data);
        hs.gastanktable.data(n+1,:) = hs.gastanktable.data(n,:);
    end

    function btEdit_callback(src,event)
        pos = event.Indices(1);

    end

    function addballoon_callback(~,~,hs)
        [n,~] = size(hs.balloontable.data);
        hs.balloontable.data(n+1,:) = hs.gastanktable.data(n,:);
    end

end %end of Experimental