function [c, ceq, DC, DCeq] = constraintGradientLeastSquares(X)
%
% [c, ceq, DC, DCeq] = constraintGradientLeastSquares(X)
%
%   constraint value and gradient of ceqstraint function for LeastSquares problem.
%
%
% Input:
%   
%   X      : [d1d2 x d1d2 x 2] double - optimization variable
%
% Output:
%
%   c      : [] - inequality constraints (empty)
%   ceq    : [d1 x d1d2 x 2] double - value of constraint
%   DC     : [] - gradient  of inequality constraints (empty)
%   DCeq   : [d1d2 x d1d2 x 2 x d1 x d1d2 x 2] double - gradient of constraint
%

global d1g d2g   

if nargout >2
    DC = [];
end

%% Constraint Value

[c,ceq] = constraintLeastSquares(X);


%% Gradient (A indices-heavy derivation is needed)

if nargout >2
    
    d = d1g*d2g;
    
    DCeq = zeros(d,d,2,d1g,d,2); % 6-dimensional tensor !!!
    
        
    for j2 = 1:d2g
    
        indexLeft  = (j2-1)*d1g;
    
        for ic = 1:d1g
            for jc = 1:d1g
                if ic ~= jc

                   %% Real constraints
        
                   % real part of X

                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 1, ic, indexLeft+jc, 1) = X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),1);
                   DCeq( (0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g), 1, ic, indexLeft+jc, 1) = X((0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g),1);


                   % imaginary part of X
                   
                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 2, ic, indexLeft+jc, 1) = X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),2);
                   DCeq( (0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g), 2, ic, indexLeft+jc, 1) = X((0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g),2);


                   %% Imaginary constraints

                   % real part of X

                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 1, ic, indexLeft+jc, 2) = -X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),2);
                   DCeq( (0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g), 1, ic, indexLeft+jc, 2) =  X((0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g),2);


                   % imaginary part of X
                   
                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 2, ic, indexLeft+jc, 2) =  X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),1);
                   DCeq( (0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g), 2, ic, indexLeft+jc, 2) = -X((0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g),1);
                   

                else

                   %% Real constraints

                   % real part of X
                   
                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 1, ic, indexLeft+jc, 1) = 2*X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),1);


                   % imaginary part of X

                   DCeq( (0:(d2g-1))*d1g + ic, (indexLeft+1):(indexLeft+d1g), 2, ic, indexLeft+jc, 1) = 2*X((0:(d2g-1))*d1g + jc, (indexLeft+1):(indexLeft+d1g),2);

                end
            end
        end
    end
    
    
    %% Reshape
    
    DCeq = reshape(DCeq, 2*(d1g*d2g)^2, 2*d1g^2*d2g );

end

end