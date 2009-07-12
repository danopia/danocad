#!/usr/bin/env ruby
#
# This file is gererated by ruby-glade-create-template 1.1.4.
#
require 'libglade2'

class DanoCAD
  include GetText
  
  def method_missing(m, *args, &blck)
		raise ArgumentError, "wrong number of arguments (#{args.length} for 0)" if args.length > 0
		return @glade.get_widget(m.to_s) if @glade.get_widget(m.to_s)
		raise NoMethodError, "undefined method '#{m}' for #{self}"
	end

  attr :glade
  
  def initialize(path_or_data, root = nil, domain = nil, localedir = nil, flag = GladeXML::FILE)
    bindtextdomain(domain, localedir, nil, "UTF-8")
    @glade = GladeXML.new(path_or_data, root, domain, localedir, flag) {|handler| method(handler)}
    
    drawingarea1.modify_bg(0, Gdk::Color.new(65535, 65535, 65535))
  end
  
  def on_open1_activate(widget)
    puts "on_open1_activate() is not implemented yet."
  end
  def on_paste1_activate(widget)
    puts "on_paste1_activate() is not implemented yet."
  end
  def on_save_as1_activate(widget)
    puts "on_save_as1_activate() is not implemented yet."
  end
  def on_copy1_activate(widget)
    puts "on_copy1_activate() is not implemented yet."
  end
  def on_delete1_activate(widget)
    puts "on_delete1_activate() is not implemented yet."
  end
  def on_cut1_activate(widget)
    puts "on_cut1_activate() is not implemented yet."
  end
  def on_save1_activate(widget)
    puts "on_save1_activate() is not implemented yet."
  end
  def on_quit1_activate(widget)
    puts "on_quit1_activate() is not implemented yet."
  end
  
  # Main window
  def on_about_activate(widget)
    aboutdialog.run
  end
  def on_new_file_activate(widget)
    drawingarea1.window.clear
    puts "on_new_file_activate() is not implemented yet."
  end
  def on_main_window_delete_event(widget, event)
    exit
  end
  
  def on_drawingarea1_expose_event(widget, event)
    gc = Gdk::GC.new(widget.window)
    gc.rgb_fg_color = Gdk::Color.new(65535, 0, 0)
    
    puts "Drawing"
    widget.window.clear
    widget.window.draw_line(gc, 1, 1, 100, 100)
  end
  
  # Motion box
  def on_eventbox_motion_notify_event(sender, e)
    gc = Gdk::GC.new(drawingarea1.window)
    gc.rgb_fg_color = Gdk::Color.new(65535, 0, 0)
    
    drawingarea1.window.clear
    drawingarea1.window.draw_line(gc, @startx, @starty, e.x, e.y)
  end
  def on_eventbox_button_press_event(sender, e)
    @startx = e.x
    @starty = e.y
  end
  
  # About dialog
  def on_aboutdialog_response(widget, response)
    widget.hide
  end
  def on_aboutdialog_delete_event(widget, event)
    widget.hide
    return true
  end
end

# Main program
if __FILE__ == $0
  app = DanoCAD.new('hello-world.glade', nil, 'Hello World')
  Gtk.main
end
