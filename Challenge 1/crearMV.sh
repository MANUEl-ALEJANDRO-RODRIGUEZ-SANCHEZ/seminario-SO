!/bin/bash

# Validar que se pasen exactamente 8 argumentos
if [ "$#" -ne 8 ]; then
  echo "Uso: $0 <nombre_VM> <tipo_sistema> <cpus> <memoria_ram_GB> <memoria_vram_MB> <tamanio_disco_GB> <nombre_controlador_SATA> <nombre_controlador_IDE>"
  exit 1
fi

# Asignar los argumentos a variables
NOMBRE_VM=$1
TIPO_SISTEMA=$2   	# Por ejemplo: "Linux"
CPUS=$3           	# Numero de CPUs
MEM_RAM=$(($4 * 1024))  # Convertir GB a MB
VRAM=$5           	# Tamanio de VRAM en MB
DISCO_GB=$6       	# Tamanio del disco en GB
CONTROLADOR_SATA=$7  	# Nombre del controlador SATA
CONTROLADOR_IDE=$8   	# Nombre del controlador IDE

# Crear la maquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_SISTEMA" --register

# Configurar CPUs, RAM y VRAM
VBoxManage modifyvm "$NOMBRE_VM" --cpus $CPUS --memory $MEM_RAM --vram $VRAM

# Crear el disco duro virtual (VDI)
VBoxManage createmedium disk --filename "$HOME/VirtualBox VMs/$NOMBRE_VM/$NOMBRE_VM.vdi" --size $(($DISCO_GB * 1024)) --format VDI

# Crear y asociar el controlador SATA
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_SATA" --add sata --controller IntelAhci
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$NOMBRE_VM/$NOMBRE_VM.vdi"

# Crear y asociar el controlador IDE para CD/DVD
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_IDE" --add ide
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_IDE" --port 0 --device 0 --type dvddrive --medium emptydrive

# Imprimir la configuracion de la VM
echo "Configuración de la máquina virtual '$NOMBRE_VM':"
VBoxManage showvminfo "$NOMBRE_VM"