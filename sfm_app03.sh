#!/usr/bin/env bash




# criar arquivo de configuração com dados sensiveis
_login=genes
_password=0331


#programas
#sfm1=/dsdsdsdsdsds
#comand_install=dd if/$sfmi1 of=/dev/
_var=false


# teste iniciais 

function test_init()
{
	 [[ $UID = 0 ]] && { hd_choice ;} || { echo " Favor logar como root"; exit 1 ; }
	
}

function Logar() 
{

clear

read -p "LOGIN: " user_login
read -sp "SENHA: " user_pass

if [[ $userlogin -ne $_login ]] || [[ $user_pass -ne $_password  ]]; 
	then
		echo "\n SENHA INCORRETA, VERIFIQUE SUAS CREDENCIAIS"
		Logar
	
	else
		echo -e "\n-----------------------------------------------------------------------"
	 	echo -e "\nACESSO PERMITIDO!\nBEM-VINDO"
	 	echo -e "\n-----------------------------------------------------------------------"
	 	sleep 2s
	 	 
	 	test_init
	
fi

}


######################### Funcões Principais ############################################

# funcao escolher hd
function hd_choice() 
{

	clear # limpando tela 
	
	echo -e "DISPOSITIVOS DISPONIVEIS:\n"
	echo "-----------------------------------------------------------------------"
	lsblk -S
	echo -e "--------------------------------------------------------------------------\n"
		echo $_var
		if [ "$_var" != "true" ]; 
		
			then
				echo "ESCOLHA PARA FAZER A INSTALAÇÃO (1-sda, 2-sdb, 3-sdc, 4-Manual)" 
					read user_hd_choice
			else
				echo "DIGITE MANUALMENTE HD (exe: sda ):"
					read hd
					sleep 3s
					
						_list 
		fi
	
					conf_hd_choice

		
}
#confere hd
function conf_hd_choice() { # confere hd

		 
		 if [ $user_hd_choice -ge 5 ] || [ $user_hd_choice -le 0 ]; # verifica se o numero digitado esta entre 1 e 4 (se não estiver bybyebird ^^)
		 	then 
				echo "DIGITE UM NUMERO DE 1 A 4: [ERRO] "
					sleep 3
				
					
				else
					case $user_hd_choice in 
						 1) hd="sda" ;;
						 2) hd="sdb" ;; 
						 3) hd="sdc" ;;
					     4) clear 
					     local _var="true"
					     hd_choice "$_var" ;;
		    		esac
				    
				    _list
		fi						
			
			
}

#mostra ao usuário o que escolheu e dá possibilidade de retornar
function _list() 
{

unset "_var"

sleep 3s
clear

echo -e "CONFIRA A LISTA:\n"
echo -e "-------------------------------------------------------"
echo -e "DISPOSITIVO SELECIONADO: /dev/$hd"
echo -e "-------------------------------------------------------"
echo "SISTEMA: SFM 22.04"
echo -e "-------------------------------------------------------\n"
read -p  "Esta correto [s/n]? " user_conf
			
	[[ "$user_conf" = "s" ]]  && { echo " fuNCAO DE INSTALAÇÃO REAL " ; } || { echo "[ CANCELADO RETORNANDO PARA DISPOSITIVOS... ]" ; sleep 3s ; hd_choice ; } 
	# chamar funcao 
			
			
			
			
			sleep 2s
			   echo -e "\n O PROCESSO DE INSTALAÇÃO VAI COMEÇAR LEMBRE DE MANTER O PC NA TOMADA - O SISTEMA REINICIARÁ AUTOMATICAMENTE AO FINALIZAR:"
			   	 read -p "COMERÇAR [s/n]" _conf
			   	 
			   	 

		if	[[ $_conf = "s" ]]; then
			
			echo "Bazinga!" 
		  
			else
		   		echo "cancelando"
		 fi
			
			sleep 2s
			
			unset _var
			
		
			
				

}


Logar

test_init

