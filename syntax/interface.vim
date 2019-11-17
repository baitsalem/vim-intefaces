if exists("b:current_syntax")
	finish
endif

syntax keyword interfaceOptions metric pointopoint media hwadress mtu hostname 
syntax keyword interfaceOptions leasehours leasetime vendor client bootfile server hwaddr provider frame netnum endpoint local ttl network 

syntax keyword interfaceKeyword mapping script up down pre-up post-down map 

"setting shared variables 

let inetName1 = '(en|wl)[ospx][0-9a-z]+'
let inetName2 = '(wlan|eth|vlan|br|bond|tap|tun|virbr|vrrp)\d+'
let inetName3= 'lo'
let ip = '([0-9]{1,3}\.){3}[0-9]{1,3}(\/[0-9]{1,3})?'
let netmask1 = '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
let netmask2 = '\d+'

"Comment
syn keyword	todo		TODO XXX contained 
syntax match interfaceComment "\v^[[:space:]]*#.*$" contains=todo


"interface Mode
syntax keyword interfaceMode static dhcp loopback manual 

" netmask 
exe 'syntax match interfaceNetmask /\v' . netmask1 . '/ contained'
exe 'syntax match interfaceNetmask /\v' . netmask2 . '/ contained'

"ipv4
exe 'syntax match interfaceIp /\v' . ip .  '/ contained'

" Interface Names
exe 'syntax match interfaceNames /\v' . inetName1 .'/ contained'
exe 'syntax match interfaceNames /\v' . inetName2 .'/ contained'
exe 'syntax match interfaceNames /\v' . inetName3 .'/ contained'


"auto line
exe 'syntax match autoLine /' . '\v^\s*(auto|allow-hotplug)\s+(' . inetName1 . ')\s*$/ contains=interfaceNames'
exe 'syntax match autoLine /' . '\v^\s*(auto|allow-hotplug)\s+(' . inetName2 . ')\s*$/ contains=interfaceNames'
exe 'syntax match autoLine /' . '\v^\s*(auto|allow-hotplug)\s+(' . inetName3 . ')\s*$/ contains=interfaceNames'


" Interface settings
exe 'syntax match interfaceSetLine /' . '\v^\s*(iface)\s+' . inetName1  . '\s+inet\s+(static|dhcp|loopback)\s*$' .  '/ contains=interfaceMode,interfaceNames'
exe 'syntax match interfaceSetLine /' . '\v^\s*(iface)\s+' . inetName2  . '\s+inet\s+(static|dhcp|loopback)\s*$' .  '/ contains=interfaceMode,interfaceNames'
exe 'syntax match interfaceSetLine /' . '\v^\s*(iface)\s+' . inetName3  . '\s+inet\s+(static|dhcp|loopback)\s*$' .  '/ contains=interfaceMode,interfaceNames'


" set address of host and gateway
exe 'syntax match address_line /' .  '\v^\s*(address|gateway|broadcast)\s+' . ip  . '\s*$' . '/ contains=interfaceIp' 

" set netmask

exe 'syntax match netmask_line /' .  '\v^\s*(netmask)\s+' . netmask1  . '\s*$' . '/ contains=interfaceNetmask' 
exe 'syntax match netmask_line /' .  '\v^\s*(netmask)\s+' . netmask2  . '\s*$' . '/ contains=interfaceNetmask' 




"link to colors

hi link interfaceComment Comment
hi link interfaceMode keyword
hi link interfaceNetmask String
hi link interfaceIP ip_color
hi link interfaceNames Special
hi link interfaceOptions interface_options_color

hi link autoLine ip_color
hi link interfaceSetLine set_interface_line_color
hi link address_line address_line_color
hi link netmask_line netmask_line_color
hi link interfaceKeyword interface_keyword_color

"define new colors
highlight ip_color ctermfg=10  guifg=#808080
highlight set_interface_line_color ctermfg=12  guifg=#808080
highlight address_line_color ctermfg=14  guifg=#808080
highlight netmask_line_color ctermfg=14  guifg=#808080
highlight interface_options_color ctermfg=17  guifg=#808080
highlight interface_keyword_color ctermfg=19  guifg=#808080




let b:current_syntax = "interface"
