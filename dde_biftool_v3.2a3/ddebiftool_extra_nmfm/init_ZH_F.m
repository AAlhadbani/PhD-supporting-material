function fold_br = init_ZH_F(funcs,zeho,eps)
%% Initialize branch for continuing the fold curve
% emanating from the fold-Hopf point.
%
% @author Maikel Bosschaert, maikel.bosschaert -at- uhasselt.be
% (c) DDE-Biftool v3.2a3 2019-09-14 (76060b1c6081bc0c98a69a8b0829d26a658fc9d6)

%%

freepars=get_free_pars();
K01=zeho.nmfm.K01;

fold1=p_tofold(funcs,zeho);
fold2=fold1;

fold2.parameter(freepars)=fold2.parameter(freepars)+eps*K01';

method=df_mthod(funcs,'fold');
[fold2,s]=p_correc(funcs,fold2,freepars(2),[],method.point);
if ~s
    warning('Could not correct second fold point.')
end

fold_br=df_brnch(funcs,freepars,'fold');
fold_br.point=fold1;
fold_br.point(2)=fold2;

end
