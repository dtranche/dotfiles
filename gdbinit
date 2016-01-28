#add-auto-load-save-path /home/denist/dotfiles/gdbinit
set print pretty on 
set print symbol-filename on

python
sys.path.insert(0, '/home/denist/bin')
import offsets
end

set history save
set history filename ~/gdb.history
