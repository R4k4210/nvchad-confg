-- Esto es para que me cambie el resaltado en los archivos .asm
-- Posibles valoresfunction
-- asm	       GNU assembly (the default)
-- asm68k      Motorola 680x0 assembly
-- asmh8300    Hitachi H-8300 version of GNU assembly
-- ia64	       Intel Itanium 64
-- fasm	       Flat assembly (http://flatassembler.net)
-- masm	       Microsoft assembly (probably works for any 80x86)
-- nasm	       Netwide assembly
-- tasm	       Turbo Assembly (with opcodes 80x86 up to Pentium, and MMX)
-- pic	       PIC assembly (currently for PIC16F84)
vim.cmd([[
  au BufRead,BufNewFile *.s   let asmsyntax='gas'|let filetype_inc='gas'
  au BufRead,BufNewFile *.asm let asmsyntax='fasm'|let filetype_inc='fasm'
]])
