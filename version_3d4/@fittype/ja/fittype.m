%FITTYPE  fit type オブジェクトを作成
%
%   FITTYPE(EXPR) は、文字列 EXPR の中に含まれる MATLAB 表現から FITTYPE 
%   関数オブジェクトを作成します。入力引数は、変数名に対して、EXPR を
%   検策することで、自動的に決定されます (SYMVAR を参照)。この場合、
%   'x' は独立変数、'y' は従属変数で、すべての他の変数はモデルの係数と
%   仮定しています。変数が存在しない場合、'x' が使われます。すべての係数は
%   スカラです。EXPR は、非線形モデルとして取り扱われます。
%
%   式の文字列 EXPR で次の係数名を係数として用いることはできません。
%   i, j, pi, inf, nan, eps.
%
%   線形モデルは、以下の型のモデルです。
%      coeff1 * term1 + coeff2 * term2 + coeff3 * term3 + ...
%   (ここで、係数は、term1, term2, 等々の中には表れません) このモデルは、
%   セル配列として、EXPR を設定することで規定され、係数を含まない線形モデルの
%   各項は、EXPR のセルに設定されます。たとえば、モデル 'a*x + b*sin(x) + c' は、
%   'a', 'b', 'c' を含んだ型で線形です。3 つの項、'x', 'sin(x)', '1' (c=c*1 のため) 
%   を持ち、EXPR は、3 つのセルを一つにまとめたセル {'x','sin(x)','1'} になります。
%
%   FITTYPE(TYPE) は、タイプ TYPE の FITTYPE オブジェクトを作成します。
%   TYPE に対する選択：
%                TYPE                   詳細
%   スプライン：
%                'smoothingspline'      平滑化スプライン
%                'cubicspline'          三次 (内挿された) スプライン
%   補間:
%                'linearinterp'         線形内挿
%                'nearestinterp'        最近傍内挿
%                'splineinterp'         三次スプライン内挿
%                'pchipinterp'          型を保存した (pchip) 内挿
%
%   または、CFLIBHELP に記述されるライブラリモデルの名前を設定できます 
%   (ライブラリモデルの名前、詳細は、type CFLIBHELP を参照してください)。
%
%   FITTYPE(EXPR,PARAM1,VALUE1,PARAM2,VALUE2,....) は、PARAM-VALUE の組を
%   使って、デフォルト値を書き換えます。
%   'independent'    独立変数名を指定
%   'dependent'      従属変数名を指定
%   'coefficients'   係数名を指定 (2 つ以上の場合は、セル配列)。上記の
%                    除外名に注意してください。
%   'problem'        問題に依存した(定数)名を指定
%                    (2 つ以上の場合は、セル配列)
%   'options'        この方程式に対しては、デフォルトの 'fitoptions' を設定
%   デフォルト： 独立変数は x です。
%                従属変数は、y です。
%                問題に従属する定数はありません。
%                その他は、すべて係数名です。
%
%   複数の文字シンボル名も使うことができます。
%
%   例:
%     g = fittype('a*x^2+b*x+c')
%     g = fittype('a*x^2+b*x+c','coeff',{'a','b','c'})
%     g = fittype('a*time^2+b*time+c','indep','time')
%     g = fittype('a*time^2+b*time+c','indep','time','depen','height')
%     g = fittype('a*x+n*b','problem','n')
%     g = fittype({'cos(x)','1'})                            % 線形
%     g = fittype({'cos(x)','1'}, 'coefficients', {'a','b'}) % 線形
%
%   参考 CFLIBHELP, FIT.


%   Copyright 1999-2008 The MathWorks, Inc.
