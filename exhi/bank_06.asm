if !ex_patch == 1
	incsrc "ex_patch/ex_graphics_handler.asm"
endif

padbyte $00 : pad $070000
