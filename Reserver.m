
function x = Reserver(reservoirWeight, reservoirInput, preX)

%w�F���U�o�[�����d�ݍs��
%rho : �X�y�N�g�����a
%activation_func : �������֐�
%x_in : ���͑w����̏�ԃx�N�g��
%alpha : ���[�N��


x = tanh(reservoirWeight * preX + reservoirInput);
end


