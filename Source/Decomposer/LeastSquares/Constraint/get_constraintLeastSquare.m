function const = get_constraintLeastSquare(options)
%
% fun = get_objectiveLeastSquare(J,d2,d1,options)
%
%   Get function handle of constraint.
%   
% Input:
%
%   options : struct - set various options
%
% Output:
%  
%   const   : function handle - includes gradient if option is set
%

if isfield(options,'IncludeConstraintGradient') && ~options.includeConstraintGradient 
    const = @constraintLeastSquares;
else
    const = @constraintGradientLeastSquares;
end

end