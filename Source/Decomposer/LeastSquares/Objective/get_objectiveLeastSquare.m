function fun = get_objectiveLeastSquare(J,d2,d1,options)
%
% fun = get_objectiveLeastSquare(J,d2,d1,options)
%
%   Get function handle of objective. If gradient is included (default),
%   we generate the objective as an symbolic expression, differentiate and
%   save the gradient as an m-file in 'Temp'. 
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

if isfield(options,'includeGradient') && ~options.includeGradient 
    fun = @(x) objectiveLeastSquares(x,Jr,Ji,d2,d1);
else
    
end


end
