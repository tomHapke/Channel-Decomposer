function const = get_constraintLeastSquare(d2,d1,options)
%
% fun = get_objectiveLeastSquare(J,d2,d1,options)
%
%   Get function handle of constraint.
%   
% Input:
%   d1      : int - input dimension
%   d2      : int - output dimension
%   options : struct - set various options
%
% Output:
%  
%   const   : function handle - includes gradient if option is set
%

if isfield(options,'includeConstraintGradient') && ~options.includeConstraintGradient 
    const = @(x) constraintLeastSquares(x,d2,d1);
else
    const = @(x) constraintGradientLeastSquares(x,d2,d1);
end

end