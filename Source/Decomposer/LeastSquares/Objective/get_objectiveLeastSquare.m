function fun = get_objectiveLeastSquare(options)
%
% fun = get_objectiveLeastSquare(J,d2,d1,options)
%
%   Get function handle of objective.
%   
% Input:
%
%   options      : struct - set various options
%
% Output:
%  
%   fun     : function handle - includes gradient if option is set
%

if isfield(options,'IncludeObjectiveGradient') && ~options.includeObjectiveGradient 
    fun = @objectiveLeastSquares;
else
    fun = @objectiveGradientLeastSquares;
end

end
