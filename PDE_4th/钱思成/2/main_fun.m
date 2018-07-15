close all;clear;clc;
%MAIN_FUN �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global t_final x_final x T
a = 1;
% tau = input('please input tau:(tau = 0.5 or 1)');
h = 0.5;
x_final = 10;

t_final = [1,2,3,4,5,6];   % 2 3 4 5
Tau = [0.5,1];
for k = 1:2
    figure
    tau = Tau(k);
    for i = 1:6
        subplot(2,3,i)
        T = t_final(i);

        x = 0:h:x_final;
        %% ��ֵͼ��
        u_real = 1.*(x-T < 0) + (1-(x-T)).*((x-T<=1&x-T>=0)) + ((x-T)-1).*(x-T> 1);
        plot(x,u_real,'-*r')
        hold on 
        %% �Ը�ʽӭ��
        u_explicit_x = explicit_x(a,tau,h);
        plot(x,u_explicit_x,'-og')
        hold on 

        %% ����ʽӭ�� a = 1
        u_explicit_y = explicit_y(a,tau,h);
        plot(x,u_explicit_y,'-vm')
        hold on 
        %% lax-Friedrichs
        u_Lax_Friedrichs = Lax_Friedrichs(a,tau,h);
        plot(x,u_Lax_Friedrichs,'-.b')
        hold on
        %% Box
        u_Box_Scheme = Box_Scheme(a,tau,h);
        plot(x,u_Box_Scheme,'-+c')
        hold on 
        %% Lax-Wendroff
        u_Lax_Wendroff = Lax_Wendroff(a,tau,h);
        plot(x,u_Lax_Wendroff)
        %%
        title(['the figure with h = 0.5; tau = ' num2str(tau) ';T=' num2str(i)]);
        legend('real','�Ը�ʽӭ��','����ʽӭ��','lax-Friedrichs','Box','Lax-Wendroff')

    end

     figure;
     for i = 1:6
        subplot(2,3,i)
        title(['This is the figure with tau = ' num2str(i)]);
        %% �������
        %% 
        T = t_final(i);
        u_real = 1.*(x-T < 0) + (1-(x-T)).*((x-T<=1&x-T>=0)) + ((x-T)-1).*(x-T> 1);
        %% �Ը�ʽӭ��������
        u_explicit_x = explicit_x(a,tau,h);
        u_explicit_x_error = u_explicit_x - u_real;
        plot(x,u_explicit_x_error,'-og')
        hold on 
        %% ����ʽӭ��������
        u_explicit_y = explicit_y(a,tau,h);
        u_explicit_y_error = u_explicit_y - u_real;
        plot(x,u_explicit_y_error,'-vm')
        hold on 
        %% lax-Friedrichs������
        u_Lax_Friedrichs = Lax_Friedrichs(a,tau,h);
        u_Lax_Friedrichs_error = u_Lax_Friedrichs - u_real;
        plot(x,u_Lax_Friedrichs_error,'-.b')
        hold on
        %% Box-Scheme������
        u_Box_Scheme = Box_Scheme(a,tau,h);
        u_Box_Scheme_error = u_Box_Scheme - u_real;
        plot(x,u_Box_Scheme_error,'-+c')
        hold on 
        %% Lax-Wendroff������
        u_Lax_Wendroff = Lax_Wendroff(a,tau,h);
        u_Lax_Wendroff_error = u_Lax_Wendroff - u_real;
        plot(x,u_Lax_Wendroff_error)
        %%
        title(['the ERROR figure with h = 0.5; tau = ' num2str(tau) ';T=' num2str(i)]);
        legend('�Ը�ʽӭ��-error','����ʽӭ��-error','lax-Friedrichs��error','Box-Scheme-error','Lax-Wendroff-error')
     end
end

