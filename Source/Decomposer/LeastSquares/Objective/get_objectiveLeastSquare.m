function fun = get_objectiveLeastSquare(J,d2,d1,options)
%
% fun = get_objectiveLeastSquare(J,d2,d1,options)
%
%   Get function handle of objective.
%   
% Input:
%   J       : [d1d2 x d1d2] complex - Choi Jamiolkowski matrix to decompose
%   d1      : int - input dimension
%   d2      : int - output dimension
%   options      : struct - set various options
%
% Output:
%  
%   fun     : function handle - includes gradient if option is set
%

Jr = real(J);
Ji = imag(J);

if isfield(options,'includeObjectiveGradient') && ~options.includeObjectiveGradient 
    fun = @(x) objectiveLeastSquares(x,Jr,Ji,d2,d1);
else
    fun = @(x) objectiveGradientLeastSquares(x,Jr,Ji,d2,d1);
end

end
