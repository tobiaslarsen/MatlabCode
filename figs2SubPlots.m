function figs2SubPlots (subFormat, figs)

%%%%%%%%%%%%%%%%%
% Function to merge existing figures into one figure using subplot
% subFormat should be a [rows,columns] array for the desired sublot layout
% figs should be a list of figures that is to be combined. They will be
% added in the order they are listed.
% Ex: figs2SubPlots([3,1],[5,3,2]); plots figures 5, 3, and 2 in 3 rows.
% Tobias Larsen 2014
%%%%%%%%%%%%%%%%%

    F=figure;
    rws=subFormat(1);
    cls=subFormat(2);
    numFigs=rws*cls;

    if(length(figs) ~= numFigs)
        disp('Error, number of figures does not match number of subplots')
        return;
    end

    j=1;
    for i=figs
        fg=get(figs(j),'children');
        P=subplot(rws,cls,j);
        P_pos=get(P,'position');
        delete(P);
        P = copyobj(fg,F);
        set(P,'position',P_pos)
        j=j+1;
    end
end