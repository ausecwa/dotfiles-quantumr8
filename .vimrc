set foldmethod=marker 
set foldnestmax=10
set nofoldenable
set foldlevel=2
set number
command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
