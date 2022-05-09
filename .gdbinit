add-auto-load-safe-path /home/yoshida/compiler/.gdbinit

break *main
display /x $pc
display /x $rsp
display /x $eax
display /x $edi
display /32xb $rsp
display /4i $pc
