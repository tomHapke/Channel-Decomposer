function val=Try(C)
    
    global d1g d2g
    
    val=zeros(d1g,d1g);
    for i=1:d2g
        indexStart = d1g*(i-1)+1;
        indexEnd = d1g*i;
        val=val+C(indexStart:indexEnd,indexStart:indexEnd);
    end
end