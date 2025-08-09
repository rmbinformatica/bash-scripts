#!/bin/bash
# (C) 2020 RMB Informatica - www.rmbinformatica.com
# Engenheiro responsavel: RENATO MONTEIRO BATISTA
#
# Este script configura todas as VMs criadas em um servidor Xen Server para inicalização
# automática quando o servidor físico for ligado.
#
# Para maiores informações acesse https://github.com/rmbinformatica/bash-scripts
#
xe pool-param-set uuid=$(xe pool-list | awk 'NR==1 {print $5}') other-config:auto_poweron=true
for uuidvm in $(xe vm-list | grep uuid | awk '{print $5}'); do xe vm-param-set uuid=$uuidvm other-config:auto_poweron=true; done