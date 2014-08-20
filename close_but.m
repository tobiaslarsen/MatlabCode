%%%%
% Tobias Larsen, 2013
%%%%

function []= close_but(keep)
    nfigs = get(0,'Children');
    close(nfigs((nfigs~=keep)));
end