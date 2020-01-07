require 'gosu' # <-- Gosu module, like import graphics.py or import pygame

# local variable is: a = 2 (variables that are confined to the method that they are in)
# instance variable is: @a = 2 (variables that can be used around in all methods within the same class)
# class-level variable is: @@a = 2 (variables that can be used and passed around in different classes)
# global variable is: $a = 2 (global is global)

# 90% of all ruby syntax is the same as python, dictionaires(key, value pair) are called hashes here, lists are arrays



class Title_Screen < Gosu::Window
  
  def initialize
    super(900,470)
    self.caption = "Tap Symphony: Title Screen"
    @user_image = Gosu::Image.new('assets/images/Sword_1.png')
    @title_logo = Gosu::Image.new('assets/images/title_logo.png')
    @title_background = Gosu::Image.new('assets/images/title_background.jpg')
    $button_press_sound = Gosu::Sample.new('assets/sounds/resurrect_sound.wav')
    
    @crystal_1 = Gosu::Image.new('assets/images/Iris_crystal.png')
    @crystal_2 = Gosu::Image.new('assets/images/scorch_crystal.png')
    @crystal_3 = Gosu::Image.new('assets/images/time_crystal.png')
    @crystal_4 = Gosu::Image.new('assets/images/reverse_crystal.png')
    @crystal_5 = Gosu::Image.new('assets/images/symphony_crystal.png')
       
    @begin_font = Gosu::Image.new('assets/images/Begin.png')
    @begin_pass_arrow = Gosu::Image.new('assets/images/pass_arrow.png')
    @exit_pass_arrow = Gosu::Image.new('assets/images/exit_pass_arrow.png')
    @exit_font = Gosu::Image.new('assets/images/Exit-Game.png')
      
    @title_pass_x = 750
    @title_pass_y = 375
        
    @title_pass_exit_x = 40
    @title_pass_exit_y = 375
    
    @title_button_width = 126
    @title_button_height = 126
    
    $playing = false
    
    @title_font = Gosu::Font.new(self,"assets/fonts/Walkway_SemiBold.ttf",14)
    
    @begin_color_checker = 0
    @exit_color_checker = 0
    
    @crystal_x = 75
    @crystal_y = 75
    
    @crystal_x_2 = 125
    @crystal_y_2 = 225
    
    @crystal_x_3 = 775
    @crystal_y_3 = 75
    
    @crystal_x_4 = 725
    @crystal_y_4 = 235
    
    @crystal_velocity_x = -2
    @crystal_velocity_y = -2
    
    @crystal_velocity_x_2 = 2
    @crystal_velocity_y_2 = 2
    
    @crystal_velocity_x_3 = 2
    @crystal_velocity_y_3 = 2
    
    @crystal_velocity_x_4 = -2
    @crystal_velocity_y_4 = -2
       
    $win = 0
    $lose = 0
     
  end
  
  def title_image_centering
    
    @title_logo_width = 490
    @title_logo_height = 184
    
    @title_logo_x = 455
    @title_logo_y = 235
    
  end
  
  def crystal_drawn
    
    @crystal_1.draw(@crystal_x,@crystal_y,1)
    @crystal_2.draw(@crystal_x_2,@crystal_y_2,1)
    @crystal_3.draw(@crystal_x_3,@crystal_y_3,1)
    @crystal_4.draw(@crystal_x_4,@crystal_y_4,1)
    @crystal_5.draw(438,330,1)
       
  end
  
  def arrows_drawn
    
    @begin_font.draw(@title_pass_x + 30 , @title_pass_y - 30,1)
    @begin_pass_arrow.draw(@title_pass_x,@title_pass_y,1)
    @exit_pass_arrow.draw(@title_pass_exit_x,@title_pass_exit_y,1)
    @exit_font.draw(@title_pass_exit_x + 10,@title_pass_exit_y - 30,1)
    
  end
   
  def draw
    
    arrows_drawn()
    
    @title_background.draw(0,0,0)
    
    title_image_centering()
    
    @title_logo.draw(@title_logo_x - @title_logo_width / 2 , @title_logo_y - 75 - @title_logo_height / 2, 1)
       
    crystal_drawn()
      
    @user_image.draw(mouse_x - 40, mouse_y - 10, 1)
       
  end
       
  def update
    
    @crystal_x += @crystal_velocity_x
    @crystal_y += @crystal_velocity_y
    
    @crystal_x_2 += @crystal_velocity_x_2
    @crystal_y_2 += @crystal_velocity_y_2
    
    @crystal_x_3 += @crystal_velocity_x_3
    @crystal_y_3 += @crystal_velocity_y_3
    
    @crystal_x_4 += @crystal_velocity_x_4
    @crystal_y_4 += @crystal_velocity_y_4
    
    @crystal_velocity_x *= -1 if @crystal_x > 900 || @crystal_x < 0
    @crystal_velocity_y *= -1 if @crystal_y > 470 || @crystal_y < 0
    
    @crystal_velocity_x_2 *= -1 if @crystal_x_2 > 900 || @crystal_x_2 < 0
    @crystal_velocity_y_2 *= -1 if @crystal_y_2 > 470 || @crystal_y_2 < 0
    
    @crystal_velocity_x_3 *= -1 if @crystal_x_3 > 900 || @crystal_x_3 < 0
    @crystal_velocity_y_3 *= -1 if @crystal_y_3 > 470 || @crystal_y_3 < 0
    
    @crystal_velocity_x_4 *= -1 if @crystal_x_4 > 900 || @crystal_x_4 < 0
    @crystal_velocity_y_4 *= -1 if @crystal_y_4 > 470 || @crystal_y_4 < 0
    
  end     
       
  def close ##prevents the user from trying to exit the game by the red 'x' button.
  end
       
  def button_up(titleCheck)
        
    if (titleCheck == Gosu::MsLeft)
      if Gosu.distance( mouse_x, mouse_y, @title_pass_x , @title_pass_y) < 100
        $playing = false
        $button_press_sound.play  
        $window.close! #overrides the close function. When you press on the continue arrow, it procedes onto the next gosu window.
        $window_change = true
      elsif Gosu.distance(mouse_x,mouse_y,@title_pass_exit_x , @title_pass_exit_y ) < 100
        Kernel.exit
      end
    end
  end
  
end

$window = Title_Screen.new()
$window.show


class Lore_Page < Gosu::Window
    
  def initialize
    
    super(1000,670)
    
    $playing = false
    
    self.caption = "Tap Symphony: Lore Page"
    
    @user_image = Gosu::Image.new('assets/images/Sword_1.png')
    
    @boss_1 = Gosu::Image.new('assets/images/archon.gif')
    @boss_2 = Gosu::Image.new('assets/images/bull.gif')
    @boss_3 = Gosu::Image.new('assets/images/Biomech.png')
    @boss_4 = Gosu::Image.new('assets/images/Ghost.png')
    
    @big_fatty = Gosu::Image.new('assets/images/big_fatty.png')
    
    @minions_1 = Gosu::Image.new('assets/images/minotaur.png')
    @minions_2 = Gosu::Image.new('assets/images/ogreguy.png')
    @minions_3 = Gosu::Image.new('assets/images/fishyskull.png')
    @minions_4 = Gosu::Image.new('assets/images/helmetfish.gif')
    @minions_5 = Gosu::Image.new('assets/images/snekk.png')
    
    @speed_goblin = Gosu::Image.new('assets/images/speed_goblin.png')
     
    @hero = Gosu::Image.new('assets/images/Hero.gif')
    
    @ending_background = Gosu::Image.new('assets/images/ending_background.png')
    @ending_message = Gosu::Image.new('assets/images/ending_message.png')
    
    @exit_font = Gosu::Image.new('assets/images/Exit-Game.png')
    
    @pass_arrow = Gosu::Image.new('assets/images/pass_arrow.png')
    
    $button_press_sound = Gosu::Sample.new('assets/sounds/resurrect_sound.wav')
    
    @continue_font = Gosu::Image.new('assets/images/Continue.png')
    
    @exit_pass_arrow = Gosu::Image.new('assets/images/exit_pass_arrow.png')
    
    @font = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",16)
    
  end
  
  def arrows_drawn
    
    @pass_x = 825
    @pass_y = 580
    
    @exit_x = 50
    @exit_y = 580
    
    @continue_font.draw(@pass_x + 15,@pass_y - 30,1) 
    @pass_arrow.draw(@pass_x,@pass_y,1)
    
    @exit_font.draw(@exit_x + 10,@exit_y - 30,1)
    @exit_pass_arrow.draw(@exit_x ,@exit_y ,1)
     
  end
  
  def draw
    
    arrows_drawn()
    
    @ending_background.draw(0,0,0)
    @big_fatty.draw(425,300,1)
    
    @speed_goblin.draw(525,325,1)
    
    @minions_1.draw(250,500,1)
    @minions_2.draw(350,510,1)
    @minions_3.draw(450,500,1)
    @minions_4.draw(535,500,1)
    @minions_5.draw(650,505,1)
    
    @boss_1.draw(200,115,1)
    @boss_2.draw(350,115,1)
    @boss_3.draw(525,115,1)
    @boss_4.draw(660,115,1)
    
    @continue_font.draw(@pass_x + 15,@pass_y - 30,1)
    @pass_arrow.draw(@pass_x,@pass_y,1)
    
    #@ending_message.draw(300,50,1)
    
    @font.draw_markup("Bosses!\n (Strengths): Large HP Pools, Health Stacking, Moderate Speed, Regeneration.\n (Weaknesses): Affected by Reverse Crystals and Scorch Crystals. Affected by Shields.",250,50,2,1.0,1.0,Gosu::Color::YELLOW)
    @font.draw_markup("Big Fatty's!\n (Strengths): Large HP Pools, Sword DPS Eater,\n Not affected by Shields, Regeneration.\n (Weaknesses): Extremely slow, Affected by\n Reverse Crystals.",50,300,2,1.0,1.0,Gosu::Color::YELLOW)
    @font.draw_markup("Speed Goblins!\n (Strengths): Extremely Fast, Not Affected by\n Reverse Crystals, Scorch Crystals & Shields.\n (Weaknesses): Very low HP Pool, No Regeneration.",625,300,2,1.0,1.0,Gosu::Color::YELLOW)
    @font.draw_markup("Minions!\n (Strengths): Balanced HP, Balanced Speed, Regeneration, Many of Minions.\n (Weaknesses): Affected by Reverse & Scorch Crystals. Affected by Shields harder. ",250,450,2,1.0,1.0,Gosu::Color::YELLOW)
  
    @user_image.draw(mouse_x - 40,mouse_y - 10,1)
    
  end
  
  def close #prevents the user from trying to exit the game by the red 'x' button.
  end
  
  def button_up(loreCheck)
    if (loreCheck == Gosu::MsLeft)
      if Gosu.distance( mouse_x, mouse_y, @pass_x , @pass_y ) < 100
        $playing = false
        $window_change = true
        $button_press_sound.play  
        $window_x.close! #overrides the close function. When you press on the continue arrow, it procedes onto the next gosu window.
      end
      if Gosu.distance(mouse_x,mouse_y,@exit_x,@exit_y) < 100
        Kernel.exit
      end
    end
  end
    
end


$window_x = Lore_Page.new()
$window_x.show
 

class Second_Lore_Page < Gosu::Window
  
  def initialize
    
    super(1000,670)
    
    @user_cursor = Gosu::Image.new('assets/images/Sword_1.png')
    @alexhero = Gosu::Image.new('assets/images/Hero.gif')
    @iris_crystal = Gosu::Image.new('assets/images/Iris_crystal.png')
    @scorch_crystal = Gosu::Image.new('assets/images/scorch_crystal.png')
    @time_crystal = Gosu::Image.new('assets/images/time_crystal.png')
    @symph_crystal = Gosu::Image.new('assets/images/symphony_crystal.png')
    @reverse_crystal = Gosu::Image.new('assets/images/reverse_crystal.png')
    @magicka_cannon = Gosu::Image.new('assets/images/magicka_cannon.gif')
    @sword = Gosu::Image.new('assets/images/Sword_1.png')
    @shield = Gosu::Image.new('assets/images/armor_shield.png')
    
    @background_image = Gosu::Image.new('assets/images/ending_background.png')
    
    @lore_font = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",16)
    
    @pass_arrow = Gosu::Image.new('assets/images/pass_arrow.png')
        
    $button_press_sound = Gosu::Sample.new('assets/sounds/resurrect_sound.wav')
    
    @continue_font = Gosu::Image.new('assets/images/Continue.png')
    
    @exit_pass_arrow = Gosu::Image.new('assets/images/exit_pass_arrow.png')
    
    @exit_font = Gosu::Image.new('assets/images/Exit-Game.png')
    
  end
  
  def arrows_drawn
    
    @pass_x = 825
    @pass_y = 580
    
    @exit_x = 50
    @exit_y = 580
    
    @pass_arrow.draw(@pass_x,@pass_y,1)
    @exit_pass_arrow.draw(@exit_x,@exit_y,1)
    @exit_font.draw(@exit_x + 10,@exit_y - 30,1)
    @continue_font.draw(@pass_x + 15,@pass_y - 30,1)
    
  end
  
  def draw
    
    arrows_drawn()
    
    @background_image.draw(0,0,0)
    @alexhero.draw(100,100,1)
    @sword.draw(460,220,1)
    @shield.draw(770,120,1)
    
    @iris_crystal.draw(175,450,1)
    @scorch_crystal.draw(325,450,1)
    @time_crystal.draw(475,450,1)
    @symph_crystal.draw(640,450,1)
    @reverse_crystal.draw(775,450,1)
    
    @lore_font.draw_markup("The Hero of the story, Alex the Unbroken,\n seeks to end the Symphony with an \nevolving sword and countless shields on his side.",20,30,2,1.0,1.0,Gosu::Color::YELLOW)
    @lore_font.draw_markup("The sword that You, the hero, will be using\n to combat the monsters being spawned\n from the Symphony.",370,160,2,1.0,1.0,Gosu::Color::YELLOW)
    @lore_font.draw_markup("The shield that you can switch to,\n using the 'S' Key. Shield strikes\n send monsters back flying.",700,50,2,1.0,1.0,Gosu::Color::YELLOW)
    @lore_font.draw_markup("The crystals that spawn into the game are beneficial to ending the Symphony. \nEach Crystal in this lineup do a different task. Break them open to find out!",260,390,2,1.0,1.0,Gosu::Color::YELLOW)
    
    @user_cursor.draw(mouse_x - 40, mouse_y - 10 , 1)
     
  end
  
  def close
  end
  
  def button_up(sec_LoreCheck)
    if (sec_LoreCheck == Gosu::MsLeft)
      if Gosu.distance( mouse_x, mouse_y, @pass_x , @pass_y ) < 100
        $playing = false
        $button_press_sound.play  
        $window_z.close!
      end
      if Gosu.distance(mouse_x,mouse_y,@exit_x,@exit_y) < 100
        Kernel.exit
      end
    end 
  end
  
end

$window_z = Second_Lore_Page.new()
$window_z.show


class Third_Lore_Page < Gosu::Window
  
  def initialize
    
    super(1000,670)
    
    @background_image = Gosu::Image.new('assets/images/ending_background.png')
    @user_cursor = Gosu::Image.new('assets/images/Sword_1.png')
    
    @lore_font = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",16)
    
    @pass_arrow = Gosu::Image.new('assets/images/pass_arrow.png')
        
    $button_press_sound = Gosu::Sample.new('assets/sounds/resurrect_sound.wav')
    
    @continue_font = Gosu::Image.new('assets/images/Continue.png')
    
    @exit_pass_arrow = Gosu::Image.new('assets/images/exit_pass_arrow.png')
    
    @exit_font = Gosu::Image.new('assets/images/Exit-Game.png')
    
    @sword_button = Gosu::Image.new('assets/images/Button_1.png')
    @sword_button_2 = Gosu::Image.new('assets/images/Button_2.png')
    @sword_button_3 = Gosu::Image.new('assets/images/Button_3.png')
    @sword_button_4 = Gosu::Image.new('assets/images/Button_4.png')
    @sword_button_5 = Gosu::Image.new('assets/images/Button_5.png')
    @sword_button_6 = Gosu::Image.new('assets/images/Button_6.png')
    
    @iris_crystal_button = Gosu::Image.new('assets/images/use_iris_crystal.png')
    @time_crystal_button = Gosu::Image.new('assets/images/use_time_crystal.png')
    @reverse_crystal_button = Gosu::Image.new('assets/images/use_reverse_crystal.png')
    @shield_button = Gosu::Image.new('assets/images/buy_armor.png')
    @magicka_cannon_button = Gosu::Image.new('assets/images/magicka_cannon_button.png')
    
    
  end
  
  def close
  end
  
  def arrows_drawn
    
    @pass_x = 825
    @pass_y = 580
    
    @exit_x = 50
    @exit_y = 580
    
    @pass_arrow.draw(@pass_x,@pass_y,1)
    @exit_pass_arrow.draw(@exit_x,@exit_y,1)
    @exit_font.draw(@exit_x + 10,@exit_y - 30,1)
    @continue_font.draw(@pass_x + 15,@pass_y - 30,1)
    
  end
  
  def draw
    
    arrows_drawn()
    
    @background_image.draw(0,0,0)
    
    @user_cursor.draw(mouse_x - 40, mouse_y - 10 , 2)
    
    @lore_font.draw_markup("Right click these buttons (during the Game) with your Sword or Shield Mouse icon to activate the upgrades!\n Each Sword DPS button shows how much of a '+' upgrade it gives to your Sword! It's listed on the buttons. \nEach Sword DPS button comes at the cost of EXP Points, they are also listed on the buttons.",150,60,1,1.0,1.0,Gosu::Color::YELLOW)
    
    @sword_button.draw(125,115,1)
    @sword_button_2.draw(250,115,1)
    @sword_button_3.draw(375,115,1)
    @sword_button_4.draw(500,115,1)
    @sword_button_5.draw(625,115,1)
    @sword_button_6.draw(750,115,1)
    
    @iris_crystal_button.draw(50,280,1)
    @lore_font.draw_markup("Right click this button (during the game) to spend \n& use the Iris Crystal!",210,295,1,1.0,1.0,Gosu::Color::YELLOW)
    
    @time_crystal_button.draw(50,355,1)
    @lore_font.draw_markup("Right click this button (during the game) to spend \n& use the Time Crystal!",210,370,1,1.0,1.0,Gosu::Color::YELLOW)
       
    @reverse_crystal_button.draw(50,430,1)
    @lore_font.draw_markup("Right click this button (during the game) to spend \n& use the Reverse Crystal!",210,445,1,1.0,1.0,Gosu::Color::YELLOW)
    
    @shield_button.draw(720,235,1)
    @lore_font.draw_markup("Right click this button (during the game) to\n spend 100 Gold and buy a new Shield.\n Each Shield has 3 Health's!",660,300,1,1.0,1.0,Gosu::Color::YELLOW)
    
    @magicka_cannon_button.draw(720,385,1)
    @lore_font.draw_markup("Right click this button (during the game) to\n use 30 Mana to unleash the Magicka Cannons!\n They are Turrets that help destroy the monsters.",630,455,1,1.0,1.0,Gosu::Color::YELLOW)
    
     
  end
  
  def button_up(third_LoreCheck)
    
    if (third_LoreCheck == Gosu::MsLeft)
      if Gosu.distance( mouse_x, mouse_y, @pass_x , @pass_y ) < 100
        $playing = true
        $start_time = Gosu.milliseconds
        $mana_deletion = Gosu.milliseconds
        $button_press_sound.play  
        $window_yolo.close!
      end
      if Gosu.distance(mouse_x,mouse_y,@exit_x,@exit_y) < 100
        Kernel.exit
      end
    end
  end
  
end


$window_yolo = Third_Lore_Page.new()
$window_yolo.show()



class Tap_Symphony < Gosu::Window
  
  WIDTH = 1280
  HEIGHT = 700
                           
  def initialize
      
    super(WIDTH,HEIGHT)
    self.caption = "Tap Symphony: Game!"
      
    @user_image = Gosu::Image.new('assets/images/Sword_1.png',:tileable => true)
    @user_image_2 = Gosu::Image.new('assets/images/armor_shield.png',:tileable => true)
    @display_reminder = Gosu::Image.new('assets/images/sword_display.png')
    @display_reminder_2 = Gosu::Image.new('assets/images/shield_display.png')    
    @button_image = Gosu::Image.new('assets/images/Button_1.png')
    @sec_button_image = Gosu::Image.new('assets/images/Button_2.png')
    @third_button_image = Gosu::Image.new('assets/images/Button_3.png')
    @four_button_image = Gosu::Image.new('assets/images/Button_4.png')
    @fifth_button_image = Gosu::Image.new('assets/images/Button_5.png')
    @sixth_button_image = Gosu::Image.new('assets/images/Button_6.png')
    @iris_button_image = Gosu::Image.new('assets/images/use_iris_crystal.png')
    @magic_image = Gosu::Image.new('assets/images/magicka_cannon_button.png')
    @magic_image_2 = Gosu::Image.new('assets/images/use_reverse_crystal.png')
    @magic_image_3 = Gosu::Image.new('assets/images/buy_armor.png')
    @magic_image_4 = Gosu::Image.new('assets/images/use_time_crystal.png')
    @magic_image_5 = Gosu::Image.new('assets/images/scorch_crystal.png')
    @magic_image_6 = Gosu::Image.new('assets/images/reverse_crystal.png')
    @magic_image_7 = Gosu::Image.new('assets/images/time_crystal.png')
    @spellbar_panel_2 = Gosu::Image.new('assets/images/spellbar_2.png')
    @spellbar_panel = Gosu::Image.new('assets/images/spell_bar_final.png')
    @healthorb = Gosu::Image.new('assets/images/healthorb.png')
    @healthorb_2 = Gosu::Image.new('assets/images/healthorb.png')
    @healthorb_3 = Gosu::Image.new('assets/images/healthorb.png')
      
      
    @growl = Gosu::Sample.new('assets/sounds/boss_growl.wav')
    @growl_2 = Gosu::Sample.new('assets/sounds/minion_growl.wav')
    @shatter = Gosu::Sample.new('assets/sounds/crystal_shatter.wav')
    @spell = Gosu::Sample.new('assets/sounds/aoe_spell.wav')
    @button_press = Gosu::Sample.new('assets/sounds/button_press.wav')
    @sword_slash = Gosu::Sample.new('assets/sounds/sword_slash.wav')
    @reverse_crystal_usage = Gosu::Sample.new('assets/sounds/reverse_crystal_usage.flac')
    @time_crystal_usage = Gosu::Sample.new('assets/sounds/time_crystal_usage.wav')
    @shield_slam = Gosu::Sample.new('assets/sounds/shield_hit.wav')
    @shield_buy = Gosu::Sample.new('assets/sounds/shield_bought.mp3')
    @background_music = Gosu::Song.new('assets/sounds/background_music.wav')
    @scorch_explosion = Gosu::Sample.new('assets/sounds/scorch_explosion.wav')
    @iris_appear = Gosu::Sample.new('assets/sounds/iris_appear.mp3')
    @sword_bar_replenish = Gosu::Sample.new('assets/sounds/sword_upgrade_replenish.wav')
    @laser_collison = Gosu::Sample.new('assets/sounds/laser_collision.wav')
    @running_out = Gosu::Sample.new('assets/sounds/running_out.wav')
    @sword_break = Gosu::Sample.new('assets/sounds/sword_break.wav')
    @shield_break = Gosu::Sample.new('assets/sounds/shield_break.wav')
    
    
    @goblin_death = Gosu::Sample.new('assets/sounds/goblin_death.wav')
    @fatty_death = Gosu::Sample.new('assets/sounds/fatty_death.wav')
    
    @hero_image = Gosu::Image.new('assets/images/Hero.gif')
    @ui_image = Gosu::Image.new('assets/images/boxNormal.png')
    @ui_image_2 = Gosu::Image.new('assets/images/uibox_2.png')
    @ui_image_3 = Gosu::Image.new('assets/images/nameplate.png')
    @ui_image_4 = Gosu::Image.new('assets/images/level_index.png')
    @enemy_image = Gosu::Image.new('assets/images/biomech.png') 
    @enemy_image_2 = Gosu::Image.new('assets/images/Ghost.png')
    @enemy_image_3 = Gosu::Image.new('assets/images/archon.gif')
    @enemy_image_4 = Gosu::Image.new('assets/images/bull.gif')
    @enemy_image_x1 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x2 = Gosu::Image.new('assets/images/minotaur.png')
    
    #Something to look into, to see if you can use the same image variables, just make different arrays. Not make multiple variables for multiple arrays.
            
    @enemies = [@enemy_image,@enemy_image_2,@enemy_image_3,@enemy_image_4].sample #bosses array
    
    @enemy_image_5 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_6 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_7 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x3 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x4 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array = [@enemy_image_5,@enemy_image_6,@enemy_image_7,@enemy_image_x3,@enemy_image_x4].sample
    
    @enemy_image_8 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_9 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_10 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x5 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x6 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_2 = [@enemy_image_8,@enemy_image_9,@enemy_image_10,@enemy_image_x5,@enemy_image_x6].sample
    
    @enemy_image_11 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_12 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_13 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x7 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x8 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_3 = [@enemy_image_11,@enemy_image_12,@enemy_image_13,@enemy_image_x7,@enemy_image_x8].sample
    
    @enemy_image_14 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_15 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_16 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x9 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x10 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_4 = [@enemy_image_14,@enemy_image_15,@enemy_image_16,@enemy_image_x9,@enemy_image_x10].sample
    
    @enemy_image_17 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_18 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_19 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x11 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x12 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_5 = [@enemy_image_17,@enemy_image_18,@enemy_image_19,@enemy_image_x11,@enemy_image_x12].sample
    
    @enemy_image_20 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_21 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_22 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x13 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x14 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_6 = [@enemy_image_20,@enemy_image_21,@enemy_image_22,@enemy_image_x13,@enemy_image_x14].sample
    
    @enemy_image_21 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_22 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_23 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x15 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x16 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_7 = [@enemy_image_21,@enemy_image_22,@enemy_image_23,@enemy_image_x15,@enemy_image_x16].sample
    
    @enemy_image_24 = Gosu::Image.new('assets/images/ogreguy.png') 
    @enemy_image_25 = Gosu::Image.new('assets/images/fishyskull.png')
    @enemy_image_26 = Gosu::Image.new('assets/images/snekk.png')
    @enemy_image_x17 = Gosu::Image.new('assets/images/helmetfish.gif')
    @enemy_image_x18 = Gosu::Image.new('assets/images/minotaur.png')
    
    @enemies_array_8 = [@enemy_image_24,@enemy_image_25,@enemy_image_26,@enemy_image_x17,@enemy_image_x18].sample
     
    @background_image = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_2 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_3 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_4 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_5 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_6 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_7 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds = [@background_image, @background_image_2,@background_image_3,@background_image_4,@background_image_5,@background_image_6,@background_image_7,@background_image_x].sample
    
    
     
    @background_image_8 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_9 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_10 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_11 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_12 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_13 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_14 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_2 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_2 = [@background_image_8, @background_image_9,@background_image_10,@background_image_11,@background_image_12,@background_image_13,@background_image_14,@background_image_x_2].sample
    
    
    @background_image_8 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_9 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_10 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_11 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_12 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_13 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_14 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_3 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_3 = [@background_image_8, @background_image_9,@background_image_10,@background_image_11,@background_image_12,@background_image_13,@background_image_14,@background_image_x_3].sample
      
      
    @background_image_15 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_16 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_17 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_18 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_19 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_20 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_21 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_4 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_4 = [@background_image_15, @background_image_16,@background_image_17,@background_image_18,@background_image_19,@background_image_20,@background_image_21,@background_image_x_4].sample
      
      
    @background_image_22 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_23 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_24 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_25 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_26 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_27 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_28 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_5 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_5 = [@background_image_22, @background_image_23,@background_image_24,@background_image_25,@background_image_26,@background_image_27,@background_image_28,@background_image_x_5].sample
    
    
    @background_image_29 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_30 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_31 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_32 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_33 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_34 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_35 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_6 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_6 = [@background_image_29, @background_image_30,@background_image_31,@background_image_32,@background_image_33,@background_image_34,@background_image_35,@background_image_x_6].sample
    
    @background_image_36 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_37 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_38 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_39 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_40 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_41 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_42 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_7 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_7 = [@background_image_36, @background_image_37,@background_image_38,@background_image_39,@background_image_40,@background_image_41,@background_image_42,@background_image_x_7].sample
    
    @background_image_43 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_44 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_45 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_46 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_47 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_48 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_49 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_8 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_8 = [@background_image_43, @background_image_44,@background_image_45,@background_image_46,@background_image_47,@background_image_48,@background_image_49,@background_image_x_8].sample
    
    
    @background_image_50 = Gosu::Image.new('assets/images/sunrise.jpg')
    @background_image_51 = Gosu::Image.new('assets/images/snowywoods.png')
    @background_image_52 = Gosu::Image.new('assets/images/sandy.jpeg')
    @background_image_53 = Gosu::Image.new('assets/images/moonlight.jpg')
    @background_image_54 = Gosu::Image.new('assets/images/cityscape.jpg') ##
    @background_image_55 = Gosu::Image.new('assets/images/crystal_lair.jpg') ##
    @background_image_56 = Gosu::Image.new('assets/images/caverns.jpg')
    @background_image_x_9 = Gosu::Image.new('assets/images/forest.jpg')
    
    @backgrounds_9 = [@background_image_50, @background_image_51,@background_image_52,@background_image_53,@background_image_54,@background_image_55,@background_image_56,@background_image_x_9].sample
    
    
            
      
    @spacebar_button = Gosu::Image.new('assets/images/spacebar_button.png')
   
    
    @ending_x = 480
    @ending_y = 345
  
    @ending_width = 144
    @ending_height = 65
      
     ###########
     
    @speedster_image = Gosu::Image.new('assets/images/speed_goblin.png') 
    
    
    @goblin_x = rand(400..900)
    @goblin_y = -5
     
    @goblin_x_2 = rand(400..900)
    @goblin_y_2 = -5
    
    @goblin_x_3 = rand(400..900)
    @goblin_y_3 = -5
    
    @goblin_x_4 = rand(400..900)
    @goblin_y_4 = -5
      
    @goblin_width = 64
    @goblin_height = 64
    
    @goblin_velocity = 2
    @goblin_velocity_2 = 2
    @goblin_velocity_3 = 2
    @goblin_velocity_4 = 2
     
     #########     
    
    @font = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",20)
    @font_2 = Gosu::Font.new(self,"assets/fonts/Chunkfive.otf",20)
    @font_3 = Gosu::Font.new(self,"assets/fonts/Chunkfive.otf",16)
    @font_4 = Gosu::Font.new(self,"assets/fonts/Chunkfive.otf",24)
    
    @font_5 = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",16)
    @font_6 = Gosu::Font.new(self,"assets/fonts/Lato-Black.ttf",17)
    
    
    @enemy_font = Gosu::Font.new(self,"assets/fonts/Chunkfive.otf",26)
    @enemy_font_2 = Gosu::Font.new(self,"assets/fonts/Chunkfive.otf",20)
    
    @hit = 3
    @shield_health = 3
    
    @score = 1
    @levels = 1
    @gold = 0
    @time_crystal = 1
    @reverse_crystal = 3
    @scorch_crystal = 1
    
    @time_crystal_hp = 30
    @reverse_crystal_hp = 30
    @scorch_crystal_hp = 50
    @iris_crystal_hp = 40
  
    @scorch_damage = 30
    
    @enemy_hp = 50 
    
    @goblin_hp = 125
    @goblin_hp_2 = 125
    @goblin_hp_3 = 125
    @goblin_hp_4 = 125
    
    @minion_hp = 25
    @minion_hp_2 = 25
    @minion_hp_3 = 25
    @minion_hp_4 = 25
    @minion_hp_5 = 25
    @minion_hp_6 = 25
    @minion_hp_7 = 25
    @minion_hp_8 = 25
    
    @timer = (30 - (Gosu.milliseconds / 1000 ))
         
    @enemy_destroy = false
    @enemy_stack = @enemy_hp + 25
    
    @minion_stack = @minion_hp + 25
    @minion_stack_2 = @minion_hp_2 + 25
    @minion_stack_3 = @minion_hp_3 + 25
    @minion_stack_4 = @minion_hp_4 + 25
    @minion_stack_5 = @minion_hp_5 + 25
    @minion_stack_6 = @minion_hp_6 + 25
    @minion_stack_7 = @minion_hp_7 + 25
    @minion_stack_8 = @minion_hp_8 + 25

         
    @enemy_x = rand(400..900)
    @enemy_y = 25
    @enemy_width = 118
    @enemy_height = 118
    
    #So the user cant hit the invisible monsters before they appear and start falling down with velocity. I put their coordinates off the window so the collision of the mouse would not hit the sprite.
        
    @minion_enemy_x = rand(400..900)
    @minion_enemy_y = -75
    
    @minion_enemy_x_2 = rand(400..900)
    @minion_enemy_y_2 = -75
    
    @minion_enemy_x_3 = rand(400..900)
    @minion_enemy_y_3 = -75
    
    @minion_enemy_x_4 = rand(400..900)
    @minion_enemy_y_4 = -75
    
    @minion_enemy_x_5 = rand(400..900)
    @minion_enemy_y_5 = -75
    
    @minion_enemy_x_5 = rand(400..900)
    @minion_enemy_y_5 = -75
    
    @minion_enemy_x_6 = rand(400..900)
    @minion_enemy_y_6 = -75
    
    @minion_enemy_x_7 = rand(400..900)
    @minion_enemy_y_7 = -75
    
    @minion_enemy_x_8 = rand(400..900)
    @minion_enemy_y_8 = -75
        
    @minion_enemy_width = 70
    @minion_enemy_height = 70
    
    @velocity_y = 0.5
    @velocity_y_2 = 0.5
    @velocity_y_3 = 0.5
    @velocity_y_4 = 0.5
    @velocity_y_5 = 0.5
    @velocity_y_6 = 0.5
    @velocity_y_7 = 0.5
    @velocity_y_8 = 0.5
    @velocity_y_9 = 0.5
        
    @gameover = Gosu::Image.new('assets/images/gameover.png')
    @gameover_voice = Gosu::Song.new('assets/sounds/game_over_sound.wav')
    @resurrect_sound = Gosu::Song.new('assets/sounds/resurrect_sound.wav')
    
    ########################################################################
    @iris_crystal = Gosu::Image.new('assets/images/iris_crystal.png')
    
    @iris_button_play = true
  
    @iris_crystal_x = 900
    @iris_crystal_y = 25
    @iris_crystal_height = 160
    @iris_crystal_width = 160  
    
    @iris_crystals = 0
    
    @iris_button_x = 300
    @iris_button_y = 610
    @iris_button_width = 126
    @iris_button_height = 126
    
    ######################################################################
    
    @magic_button_x = 460
    @magic_button_y = 610
    @magic_button_width = 126
    @magic_button_height = 126
    
    @sec_magic_button_x = 780
    @sec_magic_button_y = 610
    @sec_magic_button_width = 126
    @sec_magic_button_height = 126
    
    @third_magic_button_x = 620
    @third_magic_button_y = 610
    @third_magic_button_width = 126
    @third_magic_button_height = 126
    
    @fourth_magic_button_x = 940
    @fourth_magic_button_y = 610
    @fourth_magic_button_width = 126
    @fourth_magic_button_height = 126
    
    ########################################################################
     
    @time_crystal_x = 300
    @time_crystal_y = 0
    
    @reverse_crystal_x = 600
    @reverse_crystal_y = 0
    
    @scorch_crystal_x = 900
    @scorch_crystal_y = 0
    
    @crystal_velocity_y = 0.75
        
    @button_visibility = 1
    @sec_button_visibility = 1
    @third_button_visibility = 1
    @four_button_visibility = 1
    @fifth_button_visibility = 1
    @sixth_button_visibility = 1
    
    @magic_button_visibility = 1
        
    @button_play = true
    @sec_button_play = true
    @third_button_play = true
    @four_button_play = true
    @fifth_button_play = true
    @sixth_button_play = true
    
    @magic_button_play = true
    @magic_button_play_2 = true
    @magic_button_play_3 = true
    @magic_button_play_4 = true
    
    @time_crystal_visibility = 1 
    @reverse_crystal_visibility = 1
    @time_crystal_null = true
    @reverse_crystal_null = true
    
    @scorch_crystal_visibility = 1
    @scorch_crystal_null = true
    
    @iris_crystal_visibility = 0
    @iris_crystal_null = false
    
    @weapon_v = 1
    @shield_v = 0
    
    @weapon_change = true
    @shield_change = true
    
    @color_checker = 0  
    @sec_color_checker = 0    
    @third_color_checker = 0
    @four_color_checker = 0
    
    @truthy_troof = false
    @truthy = true
    
    @lives = 3
    
    @start_timah = 0
    
    @iris = Gosu::Image.new('assets/images/iris.png')
    @iris_appear_visibility = 0
    
    @iris_color_checker = 0
    @reverse_color_checker = 0
    @time_color_checker = 0
    @scorch_color_checker = 0
    
    @hit_condition = false
    @cannon_collision = false
    
    
    #the reverse_checkers other than the first one that is true, those will be made true in the later levels when the adjacent minion spawn with its checker.
    #the reason why I did this is because, If i had used a reverse crystal before a certain minion would have spawned, the y axis of that unspawned minion would still be affected.
    # I wrote that the reverse crystals will only work for unspawned minions when their reverse_checker is enabled to true (spawned/drawn), and they get enabled true in the , if @levels = int, section.
    # So when the minions spawn at their proper levels to spawn, their reverse_checker flips true and allows reverse crystal / reverse button to affect the minions and bounce back properly from the top boundary, all separate from each other.
    #The top boundary where all minions, goblins and bosses share are where they bounce back, but from completely different velocity and reverse_checker variables. So none of it is connected but it is shared a boundary.
    # the velocity that moves the minions also dont get incremented until they spawn at their proper levels as well. Also can be seen in the . if @levels = int section. So everything for reverse crystals seems done. For now!
    
    @reverse_checker = true
    @reverse_checker_2 = false
    @reverse_checker_3 = false
    @reverse_checker_4 = false
    @reverse_checker_5 = false
    @reverse_checker_6 = false
    @reverse_checker_7 = false
    @reverse_checker_8 = false
    @reverse_checker_9 = false
    @reverse_checker_10 = false
    @reverse_checker_11 = false
    @reverse_checker_12 = false
    @reverse_checker_13 = false
    
    @hit_checker = true
    @hit_checker_2 = false
    @hit_checker_3 = false
    @hit_checker_4 = false
    @hit_checker_5 = false
    @hit_checker_6 = false
    @hit_checker_7 = false
    @hit_checker_8 = false
    @hit_checker_9 = false
    @hit_checker_10 = false
    @hit_checker_11 = false
    @hit_checker_12 = false
    @hit_checker_13 = false
    @hit_checker_14 = false
    @hit_checker_15 = false
    @hit_checker_16 = false
    
    @scorch_checker = true
    @scorch_checker_2 = false
    @scorch_checker_3 = false
    @scorch_checker_4 = false
    @scorch_checker_5 = false
    @scorch_checker_6 = false
    @scorch_checker_7 = false
    @scorch_checker_8 = false
    @scorch_checker_9 = false
    @scorch_checker_10 = false
    @scorch_checker_11 = false
    @scorch_checker_12 = false
    
    @stage_font = Gosu::Image.new('assets/images/stage_font.png')
    @time_crystal_font = Gosu::Image.new('assets/images/time_crystal_font.png')
    @reverse_crystal_font = Gosu::Image.new('assets/images/reverse_crystal_font.png')
    @iris_crystal_font = Gosu::Image.new('assets/images/iris_crystal_font.png')
    @exp_font = Gosu::Image.new('assets/images/exp_font.png')
    @gold_font = Gosu::Image.new('assets/images/gold_font.png')
    @shield_health_font = Gosu::Image.new('assets/images/shield_health_font.png')
    @sword_dps_font = Gosu::Image.new('assets/images/sword_dps_font.png')
    @time_left_font = Gosu::Image.new('assets/images/time_left_font.png')
    @unbroken_font = Gosu::Image.new('assets/images/unbroken_font.png')  
    $mana_font = Gosu::Image.new('assets/images/mana_font.png')
    @boss_font = Gosu::Image.new('assets/images/boss_font.png')
    @time_crystal_spawn_font = Gosu::Image.new('assets/images/time_crystal_spawn_font.png')
    @reverse_crystal_spawn_font = Gosu::Image.new('assets/images/reverse_crystal_spawn_font.png')
    @iris_crystal_spawn_font = Gosu::Image.new('assets/images/iris_crystal_spawn_font.png')
    @scorch_crystal_spawn_font = Gosu::Image.new('assets/images/scorch_crystal_spawn_font.png')
    @minion_spawn_font = Gosu::Image.new('assets/images/minion_spawn_font.png')
    @goblin_spawn_font = Gosu::Image.new('assets/images/goblin_spawn_font.png')
    @game_exit_arrow = Gosu::Image.new('assets/images/game_exit_arrow.png')
    @game_exit_font = Gosu::Image.new('assets/images/game_exit_font.png')
    @sword_mouse_font = Gosu::Image.new('assets/images/sword_mouse_font.png')
    @shield_mouse_font = Gosu::Image.new('assets/images/shield_mouse_font.png')
    
    @iris_spawn_font = Gosu::Image.new('assets/images/iris_spawn_font.png')
    
    @a_key_font = Gosu::Image.new('assets/images/a_key_font.png')
    @s_key_font = Gosu::Image.new('assets/images/s_key_font.png')
    
    @gameover_font = Gosu::Image.new('assets/images/gameover_font.png')
    
    @boss_portal = Gosu::Image.new('assets/images/monster_portal.png')
    
    @magicka_cannon = Gosu::Image.new('assets/images/magicka_cannon.gif')
    @magicka_bullet = Gosu::Image.new('assets/images/magicka_bullet.png')
    
    @magicka_cannon_2 = Gosu::Image.new('assets/images/magicka_cannon.gif')
    @magicka_bullet_2 = Gosu::Image.new('assets/images/magicka_bullet.png')
    
    @magicka_cannon_3 = Gosu::Image.new('assets/images/magicka_cannon.gif')
    @magicka_bullet_3 = Gosu::Image.new('assets/images/magicka_bullet.png')
    
    @magicka_cannon_4 = Gosu::Image.new('assets/images/magicka_cannon.gif')
    @magicka_bullet_4 = Gosu::Image.new('assets/images/magicka_bullet.png')
    
    @shooting_v = 0
    @star_velocity = -3
    @star_velocity_2 = -3    
    @star_velocity_3 = -3
    @star_velocity_4 = -3
    
    
    @magicka_x = rand(400..900)
    @magicka_y = 475
    
    @magicka_x_2 = rand(400..900)
    @magicka_y_2 = 475
    
    @magicka_x_3 = rand(400..900)
    @magicka_y_3 = 475
    
    @magicka_x_4 = rand(400..900)
    @magicka_y_4 = 475
    
    @shooting_x = @magicka_x
    @shooting_x_2 = @magicka_x_2
    @shooting_x_3 = @magicka_x_3
    @shooting_x_4 = @magicka_x_4
    
    @shooting_y = @magicka_y
    @shooting_y_2 = @magicka_y_2
    @shooting_y_3 = @magicka_y_3
    @shooting_y_4 = @magicka_y_4
    
    @start_timurr = 0
    
    @cannons_leave_font = Gosu::Image.new('assets/images/cannons_leave_font.png')
    
    @crystal_portal = Gosu::Image.new('assets/images/crystal_portal.png')
    
    @big_fatty = Gosu::Image.new('assets/images/big_fatty.png')
    @big_fatty_2 = Gosu::Image.new('assets/images/big_fatty.png')
    @big_fatty_3 = Gosu::Image.new('assets/images/big_fatty.png')
    @big_fatty_font = Gosu::Image.new('assets/images/big_fatty_font.png')
    
    @fatty_x = rand(400..900)
    @fatty_y = -30   
    
    @fatty_x_2 = rand(400..900)
    @fatty_y_2 = -30
    
    @fatty_x_3 = rand(400..900)
    @fatty_y_3 = -30
    
    @fatty_velocity = 0.3
    @fatty_velocity_2 = 0.3
    @fatty_velocity_3 = 0.3
    
    @fatty_width = 77
    @fatty_height = 93
    
    @fatty_hp = 50
    @fatty_hp_2 = 50
    @fatty_hp_3 = 50
    
    @fatty_stack = @fatty_hp + 25
    @fatty_stack_2 = @fatty_hp_2 + 25
    @fatty_stack_3 = @fatty_hp_3 + 25
    
    @fatty_portal = Gosu::Image.new('assets/images/fatty_portal.png')
    
    @bullet_connect = true
    
    @time_running_font = Gosu::Image.new('assets/images/time_running_font.png')
    
    @in_use_button = Gosu::Image.new('assets/images/in_use_button.png')
    
    @sword_indicator = 1
    @shield_indicator = 0
    @indicator_border = Gosu::Image.new('assets/images/indicator_border.png')
    
    @time_sound = true
    
    @life_checker = 1
    @life_checker_2 = 1
    @life_checker_3 = 1
    
    
    #if the user uses up all of the shield, the sword gets put back into place and the 'S' key to go to the shield wont work until after the user buys another shield. I did this because if the user pressed the 'S' key without any shield health, it would just be a blank space. Dont want that.
    @shield_checker = true
    
    @first_background = true
    @second_background = false
    @third_background = false
    @fourth_background = false
    @fifth_background = false
    @sixth_background = false
    @seventh_background = false
    @eighth_background = false
    @nineth_background = false
    
    @symphony_crystal = Gosu::Image.new('assets/images/symphony_crystal.png')
    @symphony_crystal_2 = Gosu::Image.new('assets/images/symphony_crystal.png')
    @symphony_crystal_3 = Gosu::Image.new('assets/images/symphony_crystal.png')
    @symphony_actual_font = Gosu::Image.new('assets/images/symphony_actual_font.png')
    @symphony_crystal_font = Gosu::Image.new('assets/images/symphony_crystal_font.png')
    
    @symphony_x = rand(400..900)
    @symphony_y = rand(100..450)
    
    @symphony_x_2 = rand(400..900)
    @symphony_y_2 = rand(100..450)
    
    @symphony_x_3 = rand(400..900)
    @symphony_y_3 = rand(100..450)
    
    @symphony_width = 14  
    @symphony_height = 73
    
    @symphony_visibility = true
    @symphony_visibility_2 = true
    @symphony_visibility_3 = true
    
    @symphony_velocity_x = 1.75
    @symphony_velocity_y = 1.75
    
    @symphony_velocity_x_2 = 1.75
    @symphony_velocity_y_2 = 1.75
    
    @symphony_velocity_x_3 = 1.75
    @symphony_velocity_y_3 = 1.75
    
    @symphony_hp = 1000
    @symphony_hp_2 = 1500
    @symphony_hp_3 = 2000
    
    @symphony_tick = 0
    
    @symphony_appear = Gosu::Sample.new('assets/sounds/symphony_appear.wav')
    @symphony_destroyed = Gosu::Sample.new('assets/sounds/symphony_destroyed.mp3')
    
    @symphony_appear_checker = true
    @symphony_appear_checker_2 = true
    @symphony_appear_checker_3 = true
    
    @symphony_crystal_null = false
    @symphony_crystal_null_2 = false
    @symphony_crystal_null_3 = false
    
    @symphony_tick_boolean = true
    @symphony_tick_boolean_2 = true
    @symphony_tick_boolean_3 = true
    
    @symphony_counter = 0
    @symphony_hit = 100
    @symphony_hit_2 = 100
    @symphony_hit_3 = 100
    
    @reverse_portal_null = true
    @reverse_portal_null_2 = true
    @reverse_portal_null_3 = true
    @reverse_portal_null_4 = true
    @reverse_portal_null_5 = true
    @reverse_portal_null_6 = true
    @reverse_portal_null_7 = true
    @reverse_portal_null_8 = true
    @reverse_portal_null_9 = true
    @reverse_portal_null_10 = true
    @reverse_portal_null_11 = true
    
    @sound_equalizer = false
    @sound_equalizer_2 = false
    @sound_equalizer_3 = false
    @sound_equalizer_4 = false
    
  
  end
  
  def func_sword_buttons
      
    #Sword Upgrade 1
    @button_x = 300
    @button_y = 660
    @button_width = 126
    @button_height = 126

    #Sword Upgrade 2
    @sec_button_x = 435
    @sec_button_y = 660
    @sec_button_width = 126
    @sec_button_height = 126

    #Sword Upgrade 3
    @third_button_x = 570
    @third_button_y = 660
    @third_button_width = 126
    @third_button_height = 126

    #Sword Upgrade 4
    @four_button_x = 705
    @four_button_y = 660
    @four_button_width = 126
    @four_button_height = 126

    #Sword Upgrade 5
    @fifth_button_x = 840
    @fifth_button_y = 660
    @fifth_button_width = 126
    @fifth_button_height = 126

    #Sword Upgrade 6
    @sixth_button_x = 975
    @sixth_button_y = 660
    @sixth_button_width = 126
    @sixth_button_height = 126

  end
  
 
  def conjuring_crystals
    
    if $mana == 12
      @iris_crystal_visibility = 1
      @iris_crystal_y = -55
      @iris_crystal_x = rand(400..900)
      @iris_crystal_hp = 40
      @iris_crystal_null = true
    end 
    
    if $mana == 20 
      @time_crystal_hp = 30
      @time_crystal_visibility = 1
      @time_crystal_null = true
      @time_crystal_y = -70
      @time_crystal_x = rand(400..900)
      @time_crystal_y += @crystal_velocity_y      
    end 
    
    if $mana == 22 
      @scorch_crystal_hp = 50
      @scorch_crystal_visibility = 1
      @scorch_crystal_null = true
      @scorch_crystal_y = -55
      @scorch_crystal_x = rand(400..900)
      @scorch_crystal_y += @crystal_velocity_y      
    end 
        
    if $mana == 25 
      @reverse_crystal_hp = 30
      @reverse_crystal_visibility = 1
      @reverse_crystal_null = true
      @reverse_crystal_y = -55
      @reverse_crystal_x = rand(400..900)
      @reverse_crystal_y += @crystal_velocity_y
    end
    
    if $mana == 32
      @iris_crystal_visibility = 1
      @iris_crystal_y = -55
      @iris_crystal_x = rand(400..900)
      @iris_crystal_hp = 40
      @iris_crystal_null = true
    end 
    
    if $mana == 40 
      @time_crystal_hp = 30
      @time_crystal_visibility = 1
      @time_crystal_null = true
      @time_crystal_y = -70
      @time_crystal_x = rand(400..900)
      @time_crystal_y += @crystal_velocity_y
    end  
    
    if $mana == 42 
      @scorch_crystal_hp = 50
      @scorch_crystal_visibility = 1
      @scorch_crystal_null = true
      @scorch_crystal_y = -55
      @scorch_crystal_x = rand(400..900)
      @scorch_crystal_y += @crystal_velocity_y      
    end 
        
    if $mana == 45 
      @reverse_crystal_hp = 30
      @reverse_crystal_visibility = 1
      @reverse_crystal_null = true
      @reverse_crystal_y = -55
      @reverse_crystal_x = rand(400..900)
      @reverse_crystal_y += @crystal_velocity_y
    end
    
    if $mana == 52
      @iris_crystal_visibility = 1
      @iris_crystal_y = -55
      @iris_crystal_x = rand(400..900)
      @iris_crystal_hp = 40
      @iris_crystal_null = true
    end 
    
    if $mana == 60 
      @time_crystal_hp = 30
      @time_crystal_visibility = 1
      @time_crystal_null = true
      @time_crystal_y = -70
      @time_crystal_x = rand(400..900)
      @time_crystal_y += @crystal_velocity_y
    end  
    
    if $mana == 62 
      @scorch_crystal_hp = 50
      @scorch_crystal_visibility = 1
      @scorch_crystal_null = true
      @scorch_crystal_y = -55
      @scorch_crystal_x = rand(400..900)
      @scorch_crystal_y += @crystal_velocity_y      
    end 
    
    if $mana == 65 
      @reverse_crystal_hp = 30
      @reverse_crystal_visibility = 1
      @reverse_crystal_null = true
      @reverse_crystal_y = -55
      @reverse_crystal_x = rand(400..900)
      @reverse_crystal_y += @crystal_velocity_y
    end
    
    if $mana == 72
      @iris_crystal_visibility = 1
      @iris_crystal_y = -55
      @iris_crystal_x = rand(400..900)
      @iris_crystal_hp = 40
      @iris_crystal_null = true
    end 
    
    if $mana == 80 
      @time_crystal_hp = 30
      @time_crystal_visibility = 1
      @time_crystal_null = true
      @time_crystal_y = -70
      @time_crystal_x = rand(400..900)
      @time_crystal_y += @crystal_velocity_y
    end  
    
    if $mana == 82 
      @scorch_crystal_hp = 50
      @scorch_crystal_visibility = 1
      @scorch_crystal_null = true
      @scorch_crystal_y = -55
      @scorch_crystal_x = rand(400..900)
      @scorch_crystal_y += @crystal_velocity_y      
    end 
    
    if $mana == 85 
      @reverse_crystal_hp = 30
      @reverse_crystal_visibility = 1
      @reverse_crystal_null = true
      @reverse_crystal_y = -55
      @reverse_crystal_x = rand(400..900)
      @reverse_crystal_y += @crystal_velocity_y 
    end   
    
    if $mana == 92
      @iris_crystal_visibility = 1
      @iris_crystal_y = -55
      @iris_crystal_x = rand(400..900)
      @iris_crystal_hp = 40
      @iris_crystal_null = true
    end 
    
  end
  

  def background_changer #based on the levels.
    
    
    if @first_background == true
      @backgrounds.draw(0,0,0)
    end
 
    if @second_background == true
      @backgrounds_2.draw(0,0,0)
    end
    
    if @third_background == true
      @backgrounds_3.draw(0,0,0)
    end
    
    if @fourth_background == true
      @backgrounds_4.draw(0,0,0)
    end
    
    if @fifth_background == true
      @backgrounds_5.draw(0,0,0)
    end
    
    if @sixth_background == true
      @backgrounds_6.draw(0,0,0)
    end
    
    if @seventh_background == true
      @backgrounds_7.draw(0,0,0)
    end
    
    if @eighth_background == true
      @backgrounds_8.draw(0,0,0)
    end
    
    if @nineth_background == true
      @backgrounds_9.draw(0,0,0)
    end 
    
  end
  
  
  def minion_spawn
    
    if @levels > 1 #big fatty 1
      
      @fatty_y += @fatty_velocity
      @big_fatty_font.draw(@fatty_x - @fatty_width + 5,@fatty_y - 150,1)
      @enemy_font_2.draw_markup("HP: #{@fatty_hp}",@fatty_x - @fatty_width + 10 ,@fatty_y - 125,1,1.0,1.0,Gosu::Color::RED)
      @big_fatty.draw(@fatty_x - @fatty_width , @fatty_y - @fatty_height,1)
      @reverse_checker_10 = true
      @hit_checker_4 = true  
      @scorch_checker_10 = true
      if @fatty_y < 125 && @reverse_portal_null == true
        @fatty_portal.draw(@fatty_x - 12 - @fatty_width, -5, 1)
      end
      if @fatty_y > 130
        @reverse_portal_null = false
      end
    end
        
    if @levels > 2 
      
      @minion_enemy_y += @velocity_y_2      
      @minion_spawn_font.draw(@minion_enemy_x - 20,@minion_enemy_y - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp}",@minion_enemy_x - 20, @minion_enemy_y - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array.draw(@minion_enemy_x - @minion_enemy_width / 2 , @minion_enemy_y - @minion_enemy_height / 2, 1)      
      @reverse_checker_2 = true  
      @hit_checker_2 = true 
      @scorch_checker_2 = true
      if @minion_enemy_y < 125 && @reverse_portal_null_2 == true
        @boss_portal.draw(@minion_enemy_x - @minion_enemy_width / 2,-5,1)
      end 
      if @minion_enemy_y > 130
        @reverse_portal_null_2 = false
      end     
    end
    
    if @levels > 3
      @first_background = false
      @second_background = true
    end
    
    if @levels > 5
        
      @minion_enemy_y_2 += @velocity_y_3
      @minion_spawn_font.draw(@minion_enemy_x_2 - 20,@minion_enemy_y_2 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_2}",@minion_enemy_x_2 - 20, @minion_enemy_y_2 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_2.draw(@minion_enemy_x_2 - @minion_enemy_width / 2 , @minion_enemy_y_2 - @minion_enemy_height / 2, 1)
      @reverse_checker_3 = true 
      @hit_checker_3 = true 
      @scorch_checker_3 = true
      @scorch_damage = 100
      if @minion_enemy_y_2 < 125 && @reverse_portal_null_3 == true
        @boss_portal.draw(@minion_enemy_x_2 - @minion_enemy_width /2 ,-5,1)
      end  
      if @minion_enemy_y_2 > 130
        @reverse_portal_null_3 = false     
      end
            
    end
    
    if @levels > 7
      @second_background = false
      @third_background = true
    end
    
    
    if @levels > 9
      
      @minion_enemy_y_3 += @velocity_y_4
      @minion_spawn_font.draw(@minion_enemy_x_3 - 20,@minion_enemy_y_3 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_3}",@minion_enemy_x_3 - 20, @minion_enemy_y_3 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_3.draw(@minion_enemy_x_3 - @minion_enemy_width / 2 , @minion_enemy_y_3 - @minion_enemy_height / 2, 1)
      @reverse_checker_4 = true
      @hit_checker_5 = true 
      @scorch_damage = 200
      @scorch_checker_4 = true
      if @minion_enemy_y_3 < 125 && @reverse_portal_null_4 == true
        @boss_portal.draw(@minion_enemy_x_3 - @minion_enemy_width / 2,-5,1)
      end   
      if @minion_enemy_y_3 > 130
        @reverse_portal_null_4 = false
      end    
    end
    
    if @levels > 11
      
      @goblin_y += @goblin_velocity
      @goblin_spawn_font.draw(@goblin_x - 45,@goblin_y - 75,1)
      @enemy_font_2.draw_markup("HP: #{@goblin_hp}",@goblin_x - 25, @goblin_y - 45,1,1.0,1.0,Gosu::Color::RED)
      @speedster_image.draw(@goblin_x - @goblin_width / 2 , @goblin_y - @goblin_height / 2 , 1)
      @hit_checker_6 = true    
      @third_background = false
      @fourth_background = true
      if @goblin_y < 125 && @goblin_hp > 1  
        @boss_portal.draw(@goblin_x - @goblin_width/2,-5,1)
      end 
      
    end
    
    if @levels > 12
      
     @minion_enemy_y_4 += @velocity_y_5
     @minion_spawn_font.draw(@minion_enemy_x_4 - 20,@minion_enemy_y_4 - 95,1)
     @enemy_font_2.draw_markup("HP: #{@minion_hp_4}",@minion_enemy_x_4 - 20, @minion_enemy_y_4 - 65 ,1,1.0,1.0, Gosu::Color::RED)
     @enemies_array_4.draw(@minion_enemy_x_4 - @minion_enemy_width / 2 , @minion_enemy_y_4 - @minion_enemy_height / 2, 1)
     @reverse_checker_5 = true 
     @hit_checker_7 = true 
     @scorch_damage = 300
     @scorch_checker_5 = true
     if @minion_enemy_y_4 < 125 && @reverse_portal_null_5 == true
       @boss_portal.draw(@minion_enemy_x_4 - @minion_enemy_width/2,-5,1)
     end  
     if @minion_enemy_y_4 > 130 
       @reverse_portal_null_5 = false   
     end 
     
    end
    
    if @levels > 14 #big fatty 2
      
      @fatty_y_2 += @fatty_velocity_2
      @big_fatty_font.draw(@fatty_x_2 - @fatty_width + 5,@fatty_y_2 - 150,1)
      @enemy_font_2.draw_markup("HP: #{@fatty_hp_2}",@fatty_x_2 - @fatty_width + 10 ,@fatty_y_2 - 125,1,1.0,1.0,Gosu::Color::RED)
      @big_fatty.draw(@fatty_x_2 - @fatty_width , @fatty_y_2 - @fatty_height,1)
      @reverse_checker_11 = true
      @hit_checker_8 = true
      @scorch_checker_11 = true
     
      if @fatty_y_2 < 125 && @reverse_portal_null_6 == true
        @boss_portal.draw(@fatty_x_2 - 12 - @fatty_width , -5, 1)
      end
      if @fatty_y_2 > 130
        @reverse_portal_null_6 = false
      end
    end
    
    
    if @levels > 14#9 #stage 30, first health for the symphony crystal
      
      @symphony_crystal_null = true
      
      if @symphony_visibility == true
                
        @symphony_x += @symphony_velocity_x
        @symphony_y += @symphony_velocity_y
        @symphony_crystal_font.draw(361,400,1)
       
        if @symphony_appear_checker == true
          @symphony_appear.play
          @symphony_appear_checker = false
        end
        if @symphony_tick < 0 && @symphony_tick_boolean == true #the boolean has to be true for the flickering to happen. I make this false when the player destroys the crystal.
          @symphony_actual_font.draw(@symphony_x - 60 - @symphony_width / 2, @symphony_y - 100 ,1)
          @font.draw_markup("HP: #{@symphony_hp.to_s} (#{@symphony_counter} / 3)",@symphony_x - 55 - @symphony_width / 2 , @symphony_y - 70,2,1.0,1.0,Gosu::Color::CYAN)
          @symphony_crystal.draw(@symphony_x - @symphony_width / 2 , @symphony_y - @symphony_height / 2 , 1) 
        end  
      end
    end
    
    if @levels > 15
      
      @minion_enemy_y_5 += @velocity_y_6
      @minion_spawn_font.draw(@minion_enemy_x_5 - 20,@minion_enemy_y_5 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_5}",@minion_enemy_x_5 - 20, @minion_enemy_y_5 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_5.draw(@minion_enemy_x_5 - @minion_enemy_width / 2 , @minion_enemy_y_5 - @minion_enemy_height / 2, 1)   
      @reverse_checker_6 = true   
      @hit_checker_9 = true 
      @scorch_damage = 170
      @scorch_checker_6 = true
      @fourth_background = false
      @fifth_background = true
      if @minion_enemy_y_5 < 125 && @reverse_portal_null_7 == true
        @boss_portal.draw(@minion_enemy_x_5 - @minion_enemy_width/2,-5,1)
      end   
      if @minion_enemy_y_5 > 130
        @reverse_portal_null_7 = false
      end
      
    end
     
    if @levels > 16
      
      @goblin_y_2 += @goblin_velocity_2
      @goblin_spawn_font.draw(@goblin_x_2 - 45,@goblin_y_2 - 75,1)
      @enemy_font_2.draw_markup("HP: #{@goblin_hp_2}",@goblin_x_2 - 25, @goblin_y_2 - 45,1,1.0,1.0,Gosu::Color::RED)
      @speedster_image.draw(@goblin_x_2 - @goblin_width / 2 , @goblin_y_2 - @goblin_height / 2 , 1)
      @hit_checker_10 = true 
      if @goblin_y_2 < 125 && @goblin_hp_2 > 5 #If the Goblin has HP, it will spawn a portal and start moving down. If the goblins health is below 0, there will be no portal because 'if' condition no longer true, and goblins will be placed off the map for their 'death'. Because goblins are a one time kill without any regeneration and wont spawn back a second time.
        @boss_portal.draw(@goblin_x_2 - @goblin_width / 2 ,-5,1)
      end
    end
    
    if @levels > 18
      
      @minion_enemy_y_6 += @velocity_y_7
      @minion_spawn_font.draw(@minion_enemy_x_6 - 20,@minion_enemy_y_6 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_6}",@minion_enemy_x_6 - 20, @minion_enemy_y_6 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_6.draw(@minion_enemy_x_6 - @minion_enemy_width / 2 , @minion_enemy_y_6 - @minion_enemy_height / 2, 1)    
      @reverse_checker_7 = true  
      @hit_checker_11 = true 
      @scorch_checker_7 = true
      @scorch_damage = 400
      if @minion_enemy_y_6 < 125 && @reverse_portal_null_8 == true
        @boss_portal.draw(@minion_enemy_x_6 - @minion_enemy_width/2,-5,1)
      end  
      if @minion_enemy_y_6 > 130
        @reverse_portal_null_8 = false
      end
      
    end
    
    if @levels > 19
      @fifth_background = false
      @sixth_background = true
    end
    
    if @levels > 21
      
      @minion_enemy_y_7 += @velocity_y_8
      @minion_spawn_font.draw(@minion_enemy_x_7 - 20,@minion_enemy_y_7 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_7}",@minion_enemy_x_7 - 20, @minion_enemy_y_7 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_7.draw(@minion_enemy_x_7 - @minion_enemy_width / 2 , @minion_enemy_y_7 - @minion_enemy_height / 2, 1)  
      @reverse_checker_8 = true    
      @hit_checker_12 = true 
      @scorch_checker_8 = true
      if @minion_enemy_y_7 < 125 && @reverse_portal_null_9 == true
        @boss_portal.draw(@minion_enemy_x_7 - @minion_enemy_width/2,-5,1)
      end 
      if @minion_enemy_y_7 > 130
        @reverse_portal_null_9 = false
      end  
   
    end
    
    if @levels > 22
      
      @goblin_y_3 += @goblin_velocity_3
      @goblin_spawn_font.draw(@goblin_x_3 - 45,@goblin_y_3 - 75,1)
      @enemy_font_2.draw_markup("HP: #{@goblin_hp_3}",@goblin_x_3 - 25, @goblin_y_3 - 45,1,1.0,1.0,Gosu::Color::RED)
      @speedster_image.draw(@goblin_x_3 - @goblin_width / 2 , @goblin_y_3 - @goblin_height / 2 , 1)
      @scorch_damage = 500
      @hit_checker_13 = true 
      if @goblin_y_3 < 125 && @goblin_hp_3 > 5
        @boss_portal.draw(@goblin_x_3 - @goblin_width/2,-5,1)
      end       
    end
    
    if @levels > 23
      @sixth_background = false
      @seventh_background = true
      
      @symphony_crystal_null_2 = true
      
      if @symphony_visibility_2 == true
        
        @symphony_x_2 += @symphony_velocity_x_2
        @symphony_y_2 += @symphony_velocity_y_2
        @symphony_crystal_font.draw(361,400,1)
        
        if @symphony_appear_checker_2 == true
          @symphony_appear.play
          @symphony_appear_checker_2 = false
        end
        if @symphony_tick < 0 && @symphony_tick_boolean_2 == true
          @symphony_actual_font.draw(@symphony_x_2 - 60 - @symphony_width / 2 , @symphony_y_2 - 100, 1)
          @font.draw_markup("HP: #{@symphony_hp_2} (#{@symphony_counter} / 3)",@symphony_x_2 - 55 - @symphony_width / 2, @symphony_y_2 - 70,2,1.0,1.0,Gosu::Color::CYAN)
          @symphony_crystal_2.draw(@symphony_x_2 - @symphony_width / 2, @symphony_y_2 - @symphony_height / 2 , 1)
        end
      end
      
    end
    
    if @levels > 24
      
      @minion_enemy_y_8 += @velocity_y_9
      @minion_spawn_font.draw(@minion_enemy_x_8 - 20,@minion_enemy_y_8 - 95,1)
      @enemy_font_2.draw_markup("HP: #{@minion_hp_8}",@minion_enemy_x_8 - 20, @minion_enemy_y_8 - 65 ,1,1.0,1.0, Gosu::Color::RED)
      @enemies_array_8.draw(@minion_enemy_x_8 - @minion_enemy_width / 2 , @minion_enemy_y_8 - @minion_enemy_height / 2, 1) 
      @reverse_checker_9 = true  
      @hit_checker_14 = true  
      @scorch_checker_9 = true 
      if @minion_enemy_y_8 < 125 && @reverse_portal_null_10 == true
        @boss_portal.draw(@minion_enemy_x_8 - @minion_enemy_width/2,-5,1)
      end   
      if @minion_enemy_y_8 > 130
        @reverse_portal_null_10 = false
      end
    
    end
  
  
    if @levels > 26 #big fatty 3
      
      @fatty_y_3 += @fatty_velocity_3
      @big_fatty_font.draw(@fatty_x_3 - @fatty_width + 5,@fatty_y_3 - 150,1)
      @enemy_font_2.draw_markup("HP: #{@fatty_hp_3}",@fatty_x_3 - @fatty_width + 10 ,@fatty_y_3 - 125,1,1.0,1.0,Gosu::Color::RED)
      @big_fatty.draw(@fatty_x_3 - @fatty_width , @fatty_y_3 - @fatty_height,1)
      @reverse_checker_12 = true
      @scorch_damage = 600
      @hit_checker_15 = true
      @scorch_checker_12 = true
      if @fatty_y_3 < 125 && @reverse_portal_null_11 == true
        @boss_portal.draw(@fatty_x_3 - 12 - @fatty_width, -5, 1)
      end
      if @fatty_y_3 > 130
        @reverse_portal_null_11 = false
      end
    end
    
    if @levels > 27
      @seventh_background = false
      @eighth_background = true
    end
    
    if @levels > 28 #last speed goblin
      
    
      @goblin_y_4 += @goblin_velocity_4
      @speedster_image.draw(@goblin_x_4 - @goblin_width / 2 , @goblin_y_4 - @goblin_height / 2 , 1)
      @goblin_spawn_font.draw(@goblin_x_4 - 45,@goblin_y_4 - 75,1)
      @enemy_font_2.draw_markup("HP: #{@goblin_hp_4}",@goblin_x_4 - 25, @goblin_y_4 - 45,1,1.0,1.0,Gosu::Color::RED)
      @hit_checker_16 = true
      if @goblin_y_4 < 125 && @goblin_hp_4 > 5
        @boss_portal.draw(@goblin_x_4 - @goblin_width/2,-5,1)
      end       
    end
    
   
    
    
    if @levels > 29 #1 #stage 32, 
     
      @eighth_background = false
      @nineth_background = true
        
    end
    
  
    if @levels > 29#3  #stage 34, 
      
      @symphony_crystal_null_3 = true
      
      if @symphony_visibility_3 == true
        
        @symphony_x_3 += @symphony_velocity_x_3
        @symphony_y_3 += @symphony_velocity_y_3
        @symphony_crystal_font.draw(361,400,1)
                
        if @symphony_appear_checker_3 == true
          @symphony_appear.play
          @symphony_appear_checker_3 = false
        end
        
        if @symphony_tick < 0 && @symphony_tick_boolean_3 == true
          @symphony_actual_font.draw(@symphony_x_3 - 60 - @symphony_width / 2, @symphony_y_3 - 100,1)
          @font.draw_markup("HP: #{@symphony_hp_3} (#{@symphony_counter} / 3)",@symphony_x_3 - 55 - @symphony_width / 2,@symphony_y_3 - 70,2,1.0,1.0,Gosu::Color::CYAN)
          @symphony_crystal_3.draw(@symphony_x_3 - @symphony_width / 2, @symphony_y_3 - @symphony_height / 2 , 1)
        end
      end
    end
  
  end
 
  def goblin_death #goblins are the only monsters who dont keep spawning. Once you kill these fast creatures, they stay "dead".
    
    if @goblin_hp < 0
      @goblin_velocity = 0
      @goblin_hp = -10
      @goblin_y = -250
      @hit_checker_6 = false
    end  
    
    if @goblin_hp_2 < 0
      @goblin_velocity_2 = 0
      @goblin_hp_ = -10
      @goblin_y_2 = -250
      @hit_checker_10 = false
    end  
    
    if @goblin_hp_3 < 0
      @goblin_velocity_3 = 0
      @goblin_hp_3 = -10
      @goblin_y_3 = -250
      @hit_checker_13 = false
    end 
    
    if @goblin_hp_4 < 0
      @goblin_velocity_4 = 0
      @goblin_hp_4 = -10
      @goblin_y_4 = -250 
      @hit_checker_16 = false
    end
     
  end
  
  def close
  end
  
  def win_lose_indicators
    
    if @lives < 0 
      @growl.play
      $playing = false
      $lose = 1
      $window_2.close!
    end
    
    if @symphony_counter == 3
      $win = 1
      $window_2.close!
    end
    
  end
    
  def update
    
    cannon_enemy_collision()
    goblin_death()
    win_lose_indicators()
    
    if $playing == true
      
      @background_music.play
      conjuring_crystals()
          
      @enemy_y += @velocity_y 
     
      @time_crystal_y += @crystal_velocity_y
      @reverse_crystal_y += @crystal_velocity_y
      @scorch_crystal_y += @crystal_velocity_y
      @iris_crystal_y += @crystal_velocity_y
      
      @symphony_tick -= 1
      @symphony_tick = 50 if @symphony_tick < - 10 && rand < 0.01 #this is to make it randomly disappear. If i didnt add this then it would always always go invisible when symphony tick is < - 10. With the random it could go invisible theortically ( < - 50) or ( < - 150) for example. So it doesnt create a pattern for the times it goes invisible. This keeps it unpredictable on when it would go invisible.
      
      @symphony_velocity_x *= -1 if @symphony_x > 1000 || @symphony_x < 300
      @symphony_velocity_y *= -1 if @symphony_y > 470 || @symphony_y < 0
      
      @symphony_velocity_x_2 *= -1 if @symphony_x_2 > 1000 || @symphony_x_2 < 300
      @symphony_velocity_y_2 *= -1 if @symphony_y_2 > 470 || @symphony_y_2 < 0
     
      @symphony_velocity_x_3 *= -1 if @symphony_x_3 > 1000 || @symphony_x_3 < 300
      @symphony_velocity_y_3 *= -1 if @symphony_y_3 > 470 || @symphony_y_3 < 0
     
      $time_left = (200 - (Gosu.milliseconds - $start_time) / 1000 )
      
      @iris_timer = (1 + (Gosu.milliseconds - @start_timah) / 1000 )
      
      @cannon_timer = (1 + (Gosu.milliseconds - @start_timurr) / 1000 )
            
      $mana = (1 + (Gosu.milliseconds - $mana_deletion) / 1000 )
      
      if $mana >= 100 #To keep the mana staying at 100.
        $mana = 100
      end
      
      if @throw == 0
        @cannon_collision = false
      end
            
      $playing = false if $time_left < 0 || @time_crystal < 0 || @enemy_y > 750 || @reverse_crystal < 0 || @gold < -1 || @score < 0  #all the ways the player can lose the game.
      
    end
    
    if @minion_enemy_y > 750
      $playing = false
    end
    
    if @minion_enemy_y_2 > 750
      $playing = false
    end
    
    if @minion_enemy_y_3 > 750
      $playing = false
    end
    
    if @minion_enemy_y_4 > 750
      $playing = false
    end
    
    if @minion_enemy_y_5 > 750
      $playing = false
    end
    
    if @minion_enemy_y_6 > 750
      $playing = false
    end
    
    if @minion_enemy_y_7 > 750
      $playing = false
    end
    
    if @minion_enemy_y_8 > 750
      $playing = false
    end
    
    if @fatty_y > 750
      $playing = false
    end
    
    if @fatty_y_2 > 750
      $playing = false
    end
    
    if @fatty_y_3 > 750
      $playing = false
    end
    
    if @goblin_y > 750
      $playing = false
    end
    
    if @goblin_y_2 > 750
      $playing = false
    end
    
    if @goblin_y_3 > 750
      $playing = false
    end
    
    if @goblin_y_4 > 750
      $playing = false
    end
    
            
    if @enemy_y < -10 && @reverse_checker == true
      @velocity_y = 0.5
    end
    
    if @minion_enemy_y < -10 && @reverse_checker_2 == true 
      @velocity_y_2 = 0.5
    end
    
    if @minion_enemy_y_2 < -10 && @reverse_checker_3 == true
      @velocity_y_3 = 0.5
    end
    
    if @minion_enemy_y_3 < -10 && @reverse_checker_4 == true
      @velocity_y_4 = 0.5
    end
    
    if @minion_enemy_y_4 < -10 && @reverse_checker_5 == true
      @velocity_y_5 = 0.5
    end
    
    if @minion_enemy_y_5 < -10 && @reverse_checker_6 == true
      @velocity_y_6 = 0.5
    end
    
    if @minion_enemy_y_6 < -10 && @reverse_checker_7 == true
      @velocity_y_7 = 0.5
    end
    
    if @minion_enemy_y_7 < -10 && @reverse_checker_8 == true
      @velocity_y_8 = 0.5
    end
    
    if @minion_enemy_y_8 < -10 && @reverse_checker_9 == true
      @velocity_y_9 = 0.5
    end
        
    if @fatty_y < -10 && @reverse_checker_10 == true
      @fatty_velocity = 0.3
    end
    
    if @fatty_y_2 < -10 && @reverse_checker_11 == true
      @fatty_velocity_2 = 0.3
    end
    
    if @fatty_y_3 < -10 && @reverse_checker_12 == true
      @fatty_velocity_3 = 0.3
    end

    if @score < 0 # So score doesnt go into the negatives. Ugly af.
      @score = 0
    end
    
    if @shooting_y < 50
      @shooting_y = @magicka_y
      @bullet_connect = true
     
    end
    
    if @shooting_y_2 < 50
      @shooting_y_2 = @magicka_y_2
      @bullet_connect = true
     
    end
    if @shooting_y_3 < 50
      @shooting_y_3 = @magicka_y_3
      @bullet_connect = true
     
    end
    
    if @shooting_y_4 < 50
      @shooting_y_4 = @magicka_y_4
      @bullet_connect= true
    end
     
  end
  
  def ui_boxes
    
    @ui_image.draw(15,320,1)
    @ui_image_2.draw(1037,165,1)
    @ui_image_3.draw(11,102,1)
    @ui_image_4.draw(1077,105,1)
    @hero_image.draw(70,185,1)
       
  end
  
     
  def ui_font_coordinates
    
    @unbroken_font_x = 27
    @unbroken_font_y = 110
    
    @sword_dps_font_x = 45
    @sword_dps_font_y = 360
    
    @exp_font_x = 79
    @exp_font_y = 535
    
    @mana_font_x = 78
    @mana_font_y = 480
    
    @gold_font_x = 79
    @gold_font_y = 585
    
    @shield_health_font_x = 40
    @shield_health_font_y = 420
    
    @stage_font_x = 1095
    @stage_font_y = 114
    
    @reverse_crystal_font_x = 1062
    @reverse_crystal_font_y = 325
    
    @time_crystal_font_x = 1082
    @time_crystal_font_y = 385
    
    @iris_crystal_font_x = 1082
    @iris_crystal_font_y = 265
    
    @time_left_font_x = 1092
    @time_left_font_y = 200
    
  end   
     
  def ui_fonts
    
    ui_font_coordinates()
    
    @unbroken_font.draw(@unbroken_font_x,@unbroken_font_y,2)
    #@font_2.draw_markup("Alex The Unbroken",45,55,2,1.0,1.0,Gosu::Color::GREEN)
    #Left Side UI
    
    @sword_dps_font.draw(@sword_dps_font_x,@sword_dps_font_y,2)
    #@font_2.draw_markup("Sword DPS:",50,300,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@hit.to_s,95,395,2,1.0,1.0,Gosu::Color::YELLOW)
       
    @exp_font.draw(@exp_font_x,@exp_font_y,2)
    #@font_2.draw_markup("EXP:",79,475,3,1.0,1.0, Gosu::Color::GREEN)
    @font.draw_markup(@score.to_s,95,570,2,1.0,1.0, Gosu::Color::YELLOW)
    
    $mana_font.draw(@mana_font_x,@mana_font_y,2)
    #@font_2.draw_markup("Mana:",78,420,2,1.0,1.0, Gosu::Color::GREEN)
    @font.draw_markup($mana.to_s,95,515,2,1.0,1.0, Gosu::Color::YELLOW)
    
    @gold_font.draw(@gold_font_x,@gold_font_y,2)
    #@font_2.draw_markup("Gold:", 79,525,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@gold.to_s,95,623,2,1.0,1.0,Gosu::Color::YELLOW)
    
    @shield_health_font.draw(@shield_health_font_x,@shield_health_font_y,2)
    #@font_2.draw_markup("Shield Health:",45,360,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@shield_health.to_s,95,455,2,1.0,1.0,Gosu::Color::YELLOW)
    
    ##########
      
    #Right Side UI
    
    @stage_font.draw(@stage_font_x,@stage_font_y,2)
    #@font_2.draw_markup("Level:",1075,55,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@levels.to_s,1170,123,2,1.0,1.0, Gosu::Color::YELLOW)
    
    @reverse_crystal_font.draw(@reverse_crystal_font_x,@reverse_crystal_font_y,2)
    #@font_2.draw_markup("Reverse Crystals:",1050,325,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@reverse_crystal.to_s,1142,360,2,1.0,1.0,Gosu::Color::YELLOW)
    
    @time_crystal_font.draw(@time_crystal_font_x,@time_crystal_font_y,2)
    #@font_2.draw_markup("Time Crystals:",1070,385,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@time_crystal.to_s,1142,420,2,1.0,1.0,Gosu::Color::YELLOW)
    
    @iris_crystal_font.draw(@iris_crystal_font_x,@iris_crystal_font_y,2)
    #@font_2.draw_markup("Iris Crystals:",1070,265,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup(@iris_crystals.to_s,1142,300,2,1.0,1.0,Gosu::Color::YELLOW)
   
    @time_left_font.draw(@time_left_font_x,@time_left_font_y,2)
    #@font_2.draw_markup("Time Left:",1080,200,2,1.0,1.0,Gosu::Color::GREEN)
    @font.draw_markup($time_left.to_s,1130,240,2,1.0,1.0, Gosu::Color::YELLOW)
   
  end    
  
  def button_highlight_press
    
    if @iris_color_checker == 1
      c = Gosu::Color::GREEN
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c) # x,y x,y x,y x,y
      @iris_color_checker = 0
    end
    
    if @reverse_color_checker == 1
      c = Gosu::Color::BLUE
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c) # x,y x,y x,y x,y
      @reverse_color_checker = 0
    end
    
    if @time_color_checker == 1
      c = Gosu::Color::GRAY
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c) # x,y x,y x,y x,y
      @time_color_checker = 0
    end
    
    if @scorch_color_checker == 1
      c = Gosu::Color::YELLOW
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c) # x,y x,y x,y x,y
      @scorch_color_checker = 0
    end
    
    if @color_checker == 1      
      c = Gosu::Color::FUCHSIA
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c) # x,y x,y x,y x,y
      @color_checker = 0
    end
       
    if @third_color_checker == 1
      c = Gosu::Color::WHITE
      draw_quad(0, 0, c, 1250, 0, c, 1250, 700, c, 0, 700, c)
      @third_color_checker = 0
    end
        
    if @game_over_checker == 1
      c = Gosu::Color::BLACK
      draw_quad(0, 0, c, 1280, 0, c, 1280, 700, c, 0, 700, c) # x,y x,y x,y x,y  
    end
     
  end
  
  def sword_button_visibility
    
    func_sword_buttons()
    
    if @button_visibility == 1 
      @button_image.draw(@button_x - @button_width /2 , @button_y - @button_height /2 ,1)
    end
           
    if @sec_button_visibility == 1 
      @sec_button_image.draw(@sec_button_x  - @sec_button_width /2 , @sec_button_y - @sec_button_height /2 ,1)
    end
    
    if @third_button_visibility == 1 
      @third_button_image.draw(@third_button_x - @third_button_width /2 , @third_button_y - @third_button_height /2 ,1)
    end
    
    if @four_button_visibility == 1 
      @four_button_image.draw(@four_button_x - @four_button_width /2 , @four_button_y - @four_button_height /2 ,1)
    end
    
    if @fifth_button_visibility == 1 
      @fifth_button_image.draw(@fifth_button_x - @fifth_button_width /2 , @fifth_button_y - @fifth_button_height /2 ,1)
    end
    
    if @sixth_button_visibility == 1 
      @sixth_button_image.draw(@sixth_button_x - @sixth_button_width /2 , @sixth_button_y - @sixth_button_height /2 ,1)
    end
    
  end
  
  def iris_appearance
    
    @iris_appear_x = 860
    @iris_appear_y = 400
    @iris_buff = 15
    
    @real_timer = true
    @kaka = true
    @iris_stack_preventer = true # to prevent the iris buff stacking more than once. If it stacked more than once, the player keeps the previous buff permanently. I wrote a condition that the stack preventer is true before the button is clicked, when Iris is displayed, the preventer is false, and then it is made true again when the Iris Timer goes out. 
    
    #So when Iris is displayed and the buff is applied once, the button will no longer be able to be clicked to use its effect, only until after iris goes away.
            
    if @iris_appear_visibility == 1 
      @real_timer = true
      @iris_stack_preventer = false
      @hit_condition = true
      @hit_condition = false
      @iris_spawn_font.draw(@iris_appear_x - 50, @iris_appear_y - 45,2)
      @font.draw_markup(" (#{@iris_timer})",@iris_appear_x + 34,@iris_appear_y - 20,2,1.0,1.0,Gosu::Color::GREEN)
      @iris.draw(@iris_appear_x,@iris_appear_y,1)   
      if @iris_timer == 25 && @real_timer == true
        @iris_appear_visibility = 0
        @iris_stack_preventer = true
        @hit -= @iris_buff
      end
    end 
    
  end
  
  
  def crystal_visibility 
    
    if @time_crystal_visibility == 1 
      @magic_image_5.draw(@time_crystal_x,@time_crystal_y,1)  
      @time_crystal_spawn_font.draw(@time_crystal_x - 15,@time_crystal_y - 35,1) 
      @font_2.draw_markup("   HP: #{@time_crystal_hp.to_s}",@time_crystal_x - 15,@time_crystal_y - 10,1,1.0,1.0,Gosu::Color::BLACK)
      if @time_crystal_y > -60 && @time_crystal_y < 50
        @crystal_portal.draw(@time_crystal_x-10,-5,2)
      end
    end
    
    if @reverse_crystal_visibility == 1
      @magic_image_6.draw(@reverse_crystal_x,@reverse_crystal_y,1)
      @reverse_crystal_spawn_font.draw(@reverse_crystal_x - 30, @reverse_crystal_y - 50,1 )
      @font_2.draw_markup("   HP: #{@reverse_crystal_hp.to_s}", @reverse_crystal_x - 15, @reverse_crystal_y - 25,1,1.0,1.0,Gosu::Color::BLUE) 
      if @reverse_crystal_y > -50 && @reverse_crystal_y < 50
        @crystal_portal.draw(@reverse_crystal_x-15,-5,2)
      end     
    end
      
    if @scorch_crystal_visibility == 1
      @magic_image_7.draw(@scorch_crystal_x,@scorch_crystal_y,1)
      @scorch_crystal_spawn_font.draw(@scorch_crystal_x - 30,@scorch_crystal_y - 50,1)
      @font_2.draw_markup("   HP: #{@scorch_crystal_hp.to_s}",@scorch_crystal_x - 20, @scorch_crystal_y - 25,1,1.0,1.0,Gosu::Color::YELLOW)
      if @scorch_crystal_y > -50 && @scorch_crystal_y < 50
        @crystal_portal.draw(@scorch_crystal_x-15,-5,2)
      end
    end
    
    if @iris_crystal_visibility == 1
      @iris_crystal.draw(@iris_crystal_x, @iris_crystal_y ,1)
      @iris_crystal_spawn_font.draw(@iris_crystal_x - 15, @iris_crystal_y - 55,1)
      @font_2.draw_markup("   HP: #{@iris_crystal_hp.to_s}",@iris_crystal_x - 20, @iris_crystal_y - 30 ,1,1.0,1.0,Gosu::Color::GREEN)
      if @iris_crystal_y > -50 && @iris_crystal_y < 50
        @crystal_portal.draw(@iris_crystal_x-15,-5,2)
      end
    end
    
  end
  
  
  def sword_shield_display 
    
    @display_reminder.draw(1100,542,1)
    @a_key_font.draw(1095,511,2)
    @s_key_font.draw(1095,606,2)
    @display_reminder_2.draw(1100,636,1)
    
  end
  
  
  def game_tips
    
    if $time_left < 10
      @time_running_font.draw(405,305,1)
      if @time_sound == true
        @running_out.play
        @time_sound = false
      end
    end
        
    if $time_left > 180 && $time_left < 200
      @font_5.draw_markup("Tip: Every 20 Mana you conjure \na new Time Crystal.\n & Every 25 Mana you conjure a\n new Reverse Crystal.",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 160 && $time_left < 179
      @font_5.draw_markup("Tip: Breaking an Iris Crystal\n will help summon a\n helpful companion for a moment\n of time. Use wisely!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 140 && $time_left < 159
      @font_5.draw_markup("Tip: Don't forget to hit 'S'\n on the keyboard to switch to\n the shield! A shield lasts for 3 good hits.",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 120 && $time_left < 139
      @font_5.draw_markup("Tip: Using a Scorch Crystal will\n incinerate your foes that are\n on the screen! They are spawned every\n 15 conjured Mana.",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 100 && $time_left < 119
      @font_5.draw_markup("Tip: Not hitting a Boss, Minion, \nSpeed Goblin correctly on the \nmark to damage it will lower your\n EXP Points. Be precise!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 80 && $time_left < 99
      @font_5.draw_markup("Tip: You are given 3 lives to be \nresurrected from upon each death!\n Use these lives correctly to\n obtain the Symphony.",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 60 && $time_left < 79 #work on this tip, little boring
      @font_5.draw_markup("Tip: When you have less lives,\n all monsters increase in speed! More challenging now!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 40 && $time_left < 59
      @font_5.draw_markup("Tip: Trying to buy a shield without\n enough gold will also result in\n a life being taken. The armorers\n are vicious here, be wary!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 20 && $time_left < 39
      @font_5.draw_markup("Tip: If you try to buy a Sword\n Upgrade without enough EXP Points..\n The outcome can result in a death.",1005,20,2,1.0,1.0,Gosu::Color::BLUE)        
    end
    
    if $time_left > 10 && $time_left < 19
      @font_5.draw_markup("Tip: Reverse Crystals or Magicka Cannons have no\n effect on Speed Goblins. Kill them quick!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
    if $time_left > 1 && $time_left < 9
      @font_5.draw_markup("Tip: There are\n many ways to lose a life in Tap Symphony,\n such as, time running out. Which is happening.\n Now. Replenish it!",1005,20,2,1.0,1.0,Gosu::Color::BLUE)
    end
    
  end
  
  def defeat_reset #put in the rest of the minions,speed goblins, big fattys
    
    if @fatty_hp <= -1
      @fatty_death.play
      @fatty_x = rand(400..900)
      @fatty_y = 0
      @fatty_stack = @fatty_stack + 25
      @fatty_hp = @fatty_stack
      @reverse_portal_null = true
    end
    
    if @fatty_hp_2 <= -1
      @fatty_death.play
      @fatty_x_2 = rand(400..900)
      @fatty_y_2 = 0
      @fatty_stack_2 = @fatty_stack_2 + 25
      @fatty_hp_2 = @fatty_stack_2
      @reverse_portal_null_6 = true
    end
    
    if @fatty_hp_3 <= -1
      @fatty_death.play
      @fatty_x_3 = rand(400..900)
      @fatty_y_3 = 0
      @fatty_stack_3 = @fatty_stack_3 + 25
      @fatty_hp_3 = @fatty_stack_3
      @reverse_portal_null_11 = true
    end
    
    if @minion_hp_2 < -1
      @minion_enemy_x_2 = rand(400..900)
      @minion_enemy_y_2 = -5
      @minion_stack_2 = @minion_stack_2 + 20
      @minion_hp_2 += @minion_stack_2
      @growl_2.play
      @reverse_portal_null_3 = true
    end                  
            
    if @minion_hp_3 < -1
      @minion_enemy_x_3 = rand(400..900)
      @minion_enemy_y_3 = -5
      @minion_stack_3 = @minion_stack_3 + 20
      @minion_hp_3 += @minion_stack_3
      @growl_2.play
      @reverse_portal_null_4 = true
    end                  
            
    if @minion_hp_4 < -1
      @minion_enemy_x_4 = rand(400..900)
      @minion_enemy_y_4 = -5
      @minion_stack_4 = @minion_stack_4 + 20
      @minion_hp_4 += @minion_stack_4
      @growl_2.play
      @reverse_portal_null_5 = true
    end                  
      
    if @minion_hp_5 < -1
      @minion_enemy_x_5 = rand(400..900)
      @minion_enemy_y_5 = -5
      @minion_stack_5 = @minion_stack_5 + 20
      @minion_hp_5 += @minion_stack_5
      @growl_2.play
      @reverse_portal_null_7 = true
    end                  
      
    if @minion_hp_6 < -1
      @minion_enemy_x_6 = rand(400..900)
      @minion_enemy_y_6 = -5
      @minion_stack_6 = @minion_stack_6 + 20
      @minion_hp_6 += @minion_stack_6
      @growl_2.play
      @reverse_portal_null_8 = true
    end  
      
    if @minion_hp_7 < -1
      @minion_enemy_x_7 = rand(400..900)
      @minion_enemy_y_7 = -5
      @minion_stack_7 = @minion_stack_7 + 20
      @minion_hp_7 += @minion_stack_7
      @growl_2.play
      @reverse_portal_null_9 = true
    end  
      
    if @minion_hp_8 < -1
      @minion_enemy_x_8 = rand(400..900)
      @minion_enemy_y_8 = -5
      @minion_stack_8 = @minion_stack_8 + 20
      @minion_hp_8 += @minion_stack_8
      @growl_2.play
      @reverse_portal_null_10 = true
    end   
      
    if @minion_hp < 0
      @minion_enemy_x = rand(400..900)
      @minion_enemy_y = -5
      @minion_stack = @minion_stack + 20
      @minion_hp += @minion_stack
      @growl_2.play
      @reverse_portal_null_2 = true
    end                  
    
    if @enemy_hp < 0    
      @enemy_x = rand(400..900)
      @enemy_y = 0
      @levels += 1
      @growl.play
      @enemy_destroy = true
      if @enemy_destroy == true
        @enemy_stack = @enemy_stack + 50 #Each monster kill, next monsters hp is higher.
        @enemy_hp += @enemy_stack            
        @enemy_destroy = false
      end                                 
    end
    
  end    
  
  def in_use_indicator
    
    if @sword_indicator == 1
      @in_use_button.draw(1155,545,1)
    end
    
    if @shield_indicator == 1
      @in_use_button.draw(1155,638,1)
    end
    
    @indicator_border.draw(1012,405,1)
    
  end
  
  def healthorbs_drawn
    
   
    if @life_checker == 1
      @healthorb.draw(150,190,1)
    end
    if @life_checker_2 == 1
      @healthorb_2.draw(170,224,1)
    end
    if @life_checker_3 == 1
      @healthorb_3.draw(150,254,1)
    end
    
  end
  
  def game_exit_arrow_drawn
    
    @game_exit_x = 20
    @game_exit_y = 40
        
    @game_exit_arrow.draw(@game_exit_x,@game_exit_y,1)
    
    @game_exit_font.draw(@game_exit_x - 5,@game_exit_y - 25, 1)
    
  end
      
  def draw
      
    healthorbs_drawn  
    in_use_indicator()   
    game_tips()   
    ui_fonts() 
    ui_boxes() 
    iris_appearance()
    sword_shield_display() 
    defeat_reset()
    background_changer()
    game_exit_arrow_drawn()
     
    @spellbar_panel.draw(180,510,1) 
    @boss_font.draw(@enemy_x - 25,@enemy_y - 130,1)
    @enemy_font.draw_markup("HP: #{@enemy_hp.to_s}",@enemy_x - 30  ,@enemy_y - 100 ,1,1.0,1.0, Gosu::Color::RED)
                       
    @magic_image_2.draw(@sec_magic_button_x  - @sec_magic_button_width /2 , @sec_magic_button_y - @sec_magic_button_height /2 ,1)  
    @magic_image_3.draw(@fourth_magic_button_x - @fourth_magic_button_width /2, @fourth_magic_button_y - @fourth_magic_button_height /2 ,1)
    @magic_image_4.draw(@third_magic_button_x - @third_magic_button_width / 2, @third_magic_button_y - @third_magic_button_height /2 ,1)
    @magic_image.draw(@magic_button_x - @magic_button_width /2 , @magic_button_y - @magic_button_height /2 ,1) 
       
    @iris_button_image.draw(@iris_button_x - @iris_button_width / 2, @iris_button_y - @iris_button_height /2, 1)
                           
    sword_button_visibility()
    minion_spawn()
    button_highlight_press()
    crystal_visibility()
    
    @enemies.draw(@enemy_x - @enemy_width / 2 , @enemy_y - @enemy_height / 2, 1)
                
    if @weapon_v == 1
      @user_image.draw(mouse_x - 40, mouse_y - 10, 2)
      @sword_mouse_font.draw(mouse_x - 75, mouse_y + 70,2)
      @font_6.draw_markup("(#{@hit.to_s})",mouse_x + 10,mouse_y + 76,2,1.0,1.0,Gosu::Color::BLUE)
      @sword_indicator = 1
      @shield_indicator = 0
    end
    
    if @shield_v == 1 && @shield_health > 0
      @user_image_2.draw(mouse_x - 40, mouse_y - 10, 2)
      @shield_mouse_font.draw(mouse_x - 67, mouse_y + 55,2)
      @font_6.draw_markup("(#{@shield_health.to_s})",mouse_x + 28,mouse_y + 60.5,2,1.0,1.0,Gosu::Color::YELLOW)
      @sword_indicator = 0
      @shield_indicator = 1
    end
        
    if @shield_health == 0
      @shield_checker = false
    end
    
    if @throw == 1
      
      @cannon_collision = true
      
      @magicka_cannon.draw(@magicka_x,@magicka_y,1)
      @magicka_bullet.draw(@shooting_x,@shooting_y,1)
      @magicka_cannon_2.draw(@magicka_x_2,@magicka_y_2,1)
      @magicka_bullet_2.draw(@shooting_x_2,@shooting_y_2,1)
      @magicka_cannon_3.draw(@magicka_x_3,@magicka_y_3,1)
      @magicka_bullet_3.draw(@shooting_x_3,@shooting_y_3,1)
      @magicka_cannon_4.draw(@magicka_x_4,@magicka_y_4,1)
      @magicka_bullet_4.draw(@shooting_x_4,@shooting_y_4,1)
      @cannons_leave_font.draw(495,450,2)
      @font.draw_markup("(#{@cannon_timer})",740,452 ,2,1.0,1.0,Gosu::Color::BLUE)
      
      @shooting_y += @star_velocity 
      @shooting_y_2 += @star_velocity_2
      @shooting_y_3 += @star_velocity_3
      @shooting_y_4 += @star_velocity_4
      if @cannon_timer > 20
        @throw = 0
        @cannon_collision = false
      end  
    end
      
    unless $playing == true
      @resurrect_sound.play
      @velocity_y = 0
      @velocity_y_2 = 0
      @velocity_y_3 = 0
      @velocity_y_4 = 0
      @velocity_y_5 = 0
      @velocity_y_6 = 0
      @velocity_y_7 = 0
      @velocity_y_8 = 0
      @velocity_y_9 = 0
      @goblin_velocity = 0
      @goblin_velocity_2 = 0
      @goblin_velocity_3 = 0
      @fatty_velocity = 0
      @fatty_velocity_2 = 0
      @fatty_velocity_3 = 0
      @symphony_velocity_x = 0
      @symphony_velocity_y = 0
      @symphony_velocity_x_2 = 0
      @symphony_velocity_y_2 = 0
      @symphony_velocity_x_3 = 0
      @symphony_velocity_y_3 = 0
      @game_over_checker = 1
      @gameover.draw(375,135,1)
      @gameover_font.draw(445,190,1)
      @font_4.draw_markup("#{@lives}",707,236,2,1.0,1.0,Gosu::Color::YELLOW)
      @spacebar_button.draw(@ending_x,@ending_y,1)
      @user_image.draw(mouse_x - 40, mouse_y - 10, 1)
    end
  end
  
  def crystal_monster_distances
    
    @boss_distance = Gosu.distance(mouse_x, mouse_y, @enemy_x  , @enemy_y) 
    @minion_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x  , @minion_enemy_y)
    @minion_2_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_2  , @minion_enemy_y_2)
    @minion_3_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_3  , @minion_enemy_y_3)
    @minion_4_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_4  , @minion_enemy_y_4)
    @minion_5_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_5  , @minion_enemy_y_5)
    @minion_6_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_6  , @minion_enemy_y_6)
    @minion_7_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_7  , @minion_enemy_y_7)
    @minion_8_distance = Gosu.distance(mouse_x, mouse_y, @minion_enemy_x_8  , @minion_enemy_y_8)
    
    #4 speedsters.
    @goblin_distance = Gosu.distance(mouse_x,mouse_y,@goblin_x,@goblin_y)
    @goblin_distance_2 = Gosu.distance(mouse_x,mouse_y,@goblin_x_2,@goblin_y_2)
    @goblin_distance_3 = Gosu.distance(mouse_x,mouse_y,@goblin_x_3,@goblin_y_3)
    @goblin_distance_4 = Gosu.distance(mouse_x,mouse_y,@goblin_x_4,@goblin_y_4)
    
        
    #big fatty collision boundaries
    @fatty_distance = Gosu.distance(mouse_x,mouse_y,@fatty_x - @fatty_width,@fatty_y - @fatty_height) # im here
    @fatty_distance_2 = Gosu.distance(mouse_x,mouse_y,@fatty_x_2 - @fatty_width,@fatty_y_2 - @fatty_height)
    @fatty_distance_3 = Gosu.distance(mouse_x,mouse_y,@fatty_x_3 - @fatty_width,@fatty_y_3 - @fatty_height)
    
    
    @scorch_crystal_distance = Gosu.distance(mouse_x,mouse_y,@scorch_crystal_x,@scorch_crystal_y)
    @time_crystal_distance = Gosu.distance(mouse_x,mouse_y,@time_crystal_x,@time_crystal_y)
    @reverse_crystal_distance = Gosu.distance(mouse_x,mouse_y,@reverse_crystal_x,@reverse_crystal_y)
    @iris_crystal_distance = Gosu.distance(mouse_x,mouse_y,@iris_crystal_x,@iris_crystal_y)
    @symphony_crystal_distance = Gosu.distance(mouse_x, mouse_y, @symphony_x,@symphony_y)
    @symphony_crystal_distance_2 = Gosu.distance(mouse_x, mouse_y, @symphony_x_2,@symphony_y_2)
    @symphony_crystal_distance_3 = Gosu.distance(mouse_x, mouse_y, @symphony_x_3,@symphony_y_3)
      
  end
  
  def cannon_enemy_distances
    
    @cannon_distance = Gosu.distance(@enemy_x,@enemy_y,@shooting_x,@shooting_y)   
    @cannon_distance_2 = Gosu.distance(@enemy_x,@enemy_y,@shooting_x_2,@shooting_y_2)
    @cannon_distance_3 = Gosu.distance(@enemy_x,@enemy_y,@shooting_x_3,@shooting_y_3)
    @cannon_distance_4 = Gosu.distance(@enemy_x,@enemy_y,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_5 = Gosu.distance(@minion_enemy_x,@minion_enemy_y,@shooting_x,@shooting_y)   
    @cannon_distance_6 = Gosu.distance(@minion_enemy_x,@minion_enemy_y,@shooting_x_2,@shooting_y_2)
    @cannon_distance_7 = Gosu.distance(@minion_enemy_x,@minion_enemy_y,@shooting_x_3,@shooting_y_3)
    @cannon_distance_8 = Gosu.distance(@minion_enemy_x,@minion_enemy_y,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_9 = Gosu.distance(@minion_enemy_x_2,@minion_enemy_y_2,@shooting_x,@shooting_y)   
    @cannon_distance_10 = Gosu.distance(@minion_enemy_x_2,@minion_enemy_y_2,@shooting_x_2,@shooting_y_2)
    @cannon_distance_11 = Gosu.distance(@minion_enemy_x_2,@minion_enemy_y_2,@shooting_x_3,@shooting_y_3)
    @cannon_distance_12 = Gosu.distance(@minion_enemy_x_2,@minion_enemy_y_2,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_13 = Gosu.distance(@minion_enemy_x_3,@minion_enemy_y_3,@shooting_x,@shooting_y)   
    @cannon_distance_14 = Gosu.distance(@minion_enemy_x_3,@minion_enemy_y_3,@shooting_x_2,@shooting_y_2)
    @cannon_distance_15 = Gosu.distance(@minion_enemy_x_3,@minion_enemy_y_3,@shooting_x_3,@shooting_y_3)
    @cannon_distance_16 = Gosu.distance(@minion_enemy_x_3,@minion_enemy_y_3,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_17 = Gosu.distance(@minion_enemy_x_4,@minion_enemy_y_4,@shooting_x,@shooting_y)   
    @cannon_distance_18 = Gosu.distance(@minion_enemy_x_4,@minion_enemy_y_4,@shooting_x_2,@shooting_y_2)
    @cannon_distance_19 = Gosu.distance(@minion_enemy_x_4,@minion_enemy_y_4,@shooting_x_3,@shooting_y_3)
    @cannon_distance_20 = Gosu.distance(@minion_enemy_x_4,@minion_enemy_y_4,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_21 = Gosu.distance(@minion_enemy_x_5,@minion_enemy_y_5,@shooting_x,@shooting_y)   
    @cannon_distance_22 = Gosu.distance(@minion_enemy_x_5,@minion_enemy_y_5,@shooting_x_2,@shooting_y_2)
    @cannon_distance_23 = Gosu.distance(@minion_enemy_x_5,@minion_enemy_y_5,@shooting_x_3,@shooting_y_3)
    @cannon_distance_24 = Gosu.distance(@minion_enemy_x_5,@minion_enemy_y_5,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_25 = Gosu.distance(@minion_enemy_x_6,@minion_enemy_y_6,@shooting_x,@shooting_y)   
    @cannon_distance_26 = Gosu.distance(@minion_enemy_x_6,@minion_enemy_y_6,@shooting_x_2,@shooting_y_2)
    @cannon_distance_27 = Gosu.distance(@minion_enemy_x_6,@minion_enemy_y_6,@shooting_x_3,@shooting_y_3)
    @cannon_distance_28 = Gosu.distance(@minion_enemy_x_6,@minion_enemy_y_6,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_29 = Gosu.distance(@minion_enemy_x_7,@minion_enemy_y_7,@shooting_x,@shooting_y)   
    @cannon_distance_30 = Gosu.distance(@minion_enemy_x_7,@minion_enemy_y_7,@shooting_x_2,@shooting_y_2)
    @cannon_distance_31 = Gosu.distance(@minion_enemy_x_7,@minion_enemy_y_7,@shooting_x_3,@shooting_y_3)
    @cannon_distance_32 = Gosu.distance(@minion_enemy_x_7,@minion_enemy_y_7,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_33 = Gosu.distance(@minion_enemy_x_8,@minion_enemy_y_8,@shooting_x,@shooting_y)   
    @cannon_distance_34 = Gosu.distance(@minion_enemy_x_8,@minion_enemy_y_8,@shooting_x_2,@shooting_y_2)
    @cannon_distance_35 = Gosu.distance(@minion_enemy_x_8,@minion_enemy_y_8,@shooting_x_3,@shooting_y_3)
    @cannon_distance_36 = Gosu.distance(@minion_enemy_x_8,@minion_enemy_y_8,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_37 = Gosu.distance(@goblin_x,@goblin_y,@shooting_x,@shooting_y)
    @cannon_distance_38 = Gosu.distance(@goblin_x,@goblin_y,@shooting_x_2,@shooting_y_2)
    @cannon_distance_39 = Gosu.distance(@goblin_x,@goblin_y,@shooting_x_3,@shooting_y_3)
    @cannon_distance_40 = Gosu.distance(@goblin_x,@goblin_y,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_41 = Gosu.distance(@goblin_x_2,@goblin_y_2,@shooting_x,@shooting_y)
    @cannon_distance_42 = Gosu.distance(@goblin_x_2,@goblin_y_2,@shooting_x_2,@shooting_y_2)
    @cannon_distance_43 = Gosu.distance(@goblin_x_2,@goblin_y_2,@shooting_x_3,@shooting_y_3)
    @cannon_distance_44 = Gosu.distance(@goblin_x_2,@goblin_y_2,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_45 = Gosu.distance(@goblin_x_3,@goblin_y_3,@shooting_x,@shooting_y)
    @cannon_distance_46 = Gosu.distance(@goblin_x_3,@goblin_y_3,@shooting_x_2,@shooting_y_2)
    @cannon_distance_47 = Gosu.distance(@goblin_x_3,@goblin_y_3,@shooting_x_3,@shooting_y_3)
    @cannon_distance_48 = Gosu.distance(@goblin_x_3,@goblin_y_3,@shooting_x_4,@shooting_y_4)
    
    
    #big fatty cannon collisions.
    
    @cannon_distance_49 = Gosu.distance(@fatty_x - @fatty_width,@fatty_y - @fatty_height,@shooting_x,@shooting_y)
    @cannon_distance_50 = Gosu.distance(@fatty_x - @fatty_width,@fatty_y - @fatty_height,@shooting_x_2,@shooting_y_2)
    @cannon_distance_51 = Gosu.distance(@fatty_x - @fatty_width,@fatty_y - @fatty_height,@shooting_x_3,@shooting_y_3)
    @cannon_distance_52 = Gosu.distance(@fatty_x - @fatty_width,@fatty_y - @fatty_height,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_53 = Gosu.distance(@fatty_x_2 - @fatty_width,@fatty_y_2 - @fatty_height,@shooting_x,@shooting_y)
    @cannon_distance_54 = Gosu.distance(@fatty_x_2 - @fatty_width,@fatty_y_2 - @fatty_height,@shooting_x_2,@shooting_y_2)
    @cannon_distance_55 = Gosu.distance(@fatty_x_2 - @fatty_width,@fatty_y_2 - @fatty_height,@shooting_x_3,@shooting_y_3)
    @cannon_distance_56 = Gosu.distance(@fatty_x_2 - @fatty_width,@fatty_y_2 - @fatty_height,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_57 = Gosu.distance(@fatty_x_3 - @fatty_width,@fatty_y_3 - @fatty_height,@shooting_x,@shooting_y)
    @cannon_distance_58 = Gosu.distance(@fatty_x_3 - @fatty_width,@fatty_y_3 - @fatty_height,@shooting_x_2,@shooting_y_2)
    @cannon_distance_59 = Gosu.distance(@fatty_x_3 - @fatty_width,@fatty_y_3 - @fatty_height,@shooting_x_3,@shooting_y_3)
    @cannon_distance_60 = Gosu.distance(@fatty_x_3 - @fatty_width,@fatty_y_3 - @fatty_height,@shooting_x_4,@shooting_y_4)
    
    @cannon_distance_61 = Gosu.distance(@goblin_x_4,@goblin_y_4,@shooting_x,@shooting_y)
    @cannon_distance_62 = Gosu.distance(@goblin_x_4,@goblin_y_4,@shooting_x_2,@shooting_y_2)
    @cannon_distance_63 = Gosu.distance(@goblin_x_4,@goblin_y_4,@shooting_x_3,@shooting_y_3)
    @cannon_distance_64 = Gosu.distance(@goblin_x_4,@goblin_y_4,@shooting_x_4,@shooting_y_4)
    
  end
  
    
  def cannon_enemy_collision
    
    cannon_enemy_distances()
         
    if @cannon_distance < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @enemy_y -= 1
      @enemy_hp -= 1
      
   
    end

    if @cannon_distance_2 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @enemy_y -= 1
      @enemy_hp -= 1
      
   
    end

    if @cannon_distance_3 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02, speed = 0.5)
      @enemy_y -= 1
      @enemy_hp -= 1
      

    end

    if @cannon_distance_4 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @enemy_y -= 1
      @enemy_hp -= 1
      
  
    end
    
    if @cannon_distance_5 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y -= 1
      @minion_hp -= 1
      
  
    end
    
    if @cannon_distance_6 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y -= 1
      @minion_hp -= 1
      
  
    end
    
    if @cannon_distance_7 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y -= 1
      @minion_hp -= 1
     
  
    end
    
    if @cannon_distance_8 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y -= 1
      @minion_hp -= 1
      
  
    end
    
    if @cannon_distance_9 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_2 -= 1
      @minion_hp_2 -= 1
     
  
    end
    
    if @cannon_distance_10 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_2 -= 1
      @minion_hp_2 -= 1
     
  
    end
    
    if @cannon_distance_11 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_2 -= 1
      @minion_hp_2 -= 1
     
  
    end
    
    if @cannon_distance_12 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_2 -= 1
      @minion_hp_2 -= 1
      
  
    end
    
    if @cannon_distance_13 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_3 -= 1
      @minion_hp_3 -= 1
     
  
    end
    
    if @cannon_distance_14 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_3 -= 1
      @minion_hp_3 -= 1
     
  
    end
    
    if @cannon_distance_15 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_3 -= 1
      @minion_hp_3 -= 1
     
      
    end
    
    if @cannon_distance_16 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_3 -= 1
      @minion_hp_3 -= 1
     
  
    end
    
    if @cannon_distance_17 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_4 -= 1
      @minion_hp_4 -= 1
     
  
    end
    
    if @cannon_distance_18 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_4 -= 1
      @minion_hp_4 -= 1
     
  
    end
    
    if @cannon_distance_19 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_4 -= 1
      @minion_hp_4 -= 1
      
  
    end
    
    if @cannon_distance_20 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_4 -= 1
      @minion_hp_4 -= 1
     
  
    end
    
    if @cannon_distance_21 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_5 -= 1
      @minion_hp_5 -= 1
     
  
    end
    
    if @cannon_distance_22 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_5 -= 1
      @minion_hp_5 -= 1
     
      
    end
    
    if @cannon_distance_23 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_5 -= 1
      @minion_hp_5 -= 1
     
  
    end
    
    if @cannon_distance_24 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_5 -= 1
      @minion_hp_5 -= 1
     
  
    end
    
    if @cannon_distance_25 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_6 -= 1
      @minion_hp_6 -= 1
     
  
    end
    
    if @cannon_distance_26 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_6 -= 1
      @minion_hp_6 -= 1
     
  
    end
    
    if @cannon_distance_27 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_6 -= 1
      @minion_hp_6 -= 1
     
      
    end
    
    if @cannon_distance_28 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_6 -= 1
      @minion_hp_6 -= 1
     
  
    end
    
    if @cannon_distance_29 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_7 -= 1
      @minion_hp_7 -= 1
      
  
    end
    
    if @cannon_distance_30 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_7 -= 1
      @minion_hp_7 -= 1
     
  
    end
    
    if @cannon_distance_31 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_7 -= 1
      @minion_hp_7 -= 1
      
  
    end
    
    if @cannon_distance_32 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_7 -= 1
      @minion_hp_7 -= 1
    
  
    end
    
    if @cannon_distance_33 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_8 -= 1
      @minion_hp_8 -= 1
     
  
    end
    
    if @cannon_distance_34 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_8 -= 1
      @minion_hp_8 -= 1
      
  
    end
    
    if @cannon_distance_35 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_8 -= 1
      @minion_hp_8 -= 1
      
  
    end
    
    if @cannon_distance_36 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @minion_enemy_y_8 -= 1
      @minion_hp_8 -= 1
     
  
    end
    
    if @cannon_distance_37 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y -= 1
      @goblin_hp -= 1
     
  
    end
    
    if @cannon_distance_38 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y -= 1
      @goblin_hp -= 1
      
  
    end
    
    if @cannon_distance_39 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y -= 1
      @goblin_hp -= 1
     
  
    end
    
    if @cannon_distance_40 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y -= 1
      @goblin_hp -= 1
     
  
    end
    
    if @cannon_distance_41 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_2 -= 1
      @goblin_hp_2 -= 1
    
  
    end
    
    if @cannon_distance_42 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_2 -= 1
      @goblin_hp_2 -= 1
    
  
    end
    
    if @cannon_distance_43 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_2 -= 1
      @goblin_hp_2 -= 1
  
  
    end
    
    if @cannon_distance_44 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_2 -= 1
      @goblin_hp_2 -= 1
     
    end
    
    if @cannon_distance_45 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_3 -= 1
      @goblin_hp_3 -= 1
    
  
    end
    
    if @cannon_distance_46 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_3 -= 1
      @goblin_hp_3 -= 1
   
  
    end
    
    if @cannon_distance_47 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_3 -= 1
      @goblin_hp_3 -= 1
    
  
    end
    
    if @cannon_distance_48 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_3 -= 1
      @goblin_hp_3 -= 1
   
  
    end
    
    if @cannon_distance_49 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y -= 0.2
      @fatty_hp -= 1
   
    end
    
    if @cannon_distance_50 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y -= 0.2
      @fatty_hp -= 1
    
    end
    
    if @cannon_distance_51 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y -= 0.2
      @fatty_hp -= 1
    
    end
    
    if @cannon_distance_52 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y -= 0.2
      @fatty_hp -= 1
      
    end
    
    if @cannon_distance_53 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_2 -= 0.2
      @fatty_hp_2 -= 1
     
    end
    
    if @cannon_distance_54 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_2 -= 0.2
      @fatty_hp_2 -= 1
    
    end
    
    if @cannon_distance_55 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_2 -= 0.2
      @fatty_hp_2 -= 1
     
    end
    
    if @cannon_distance_56 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_2 -= 0.2
      @fatty_hp_2 -= 1
   
    end
    
    if @cannon_distance_57 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_3 -= 0.2
      @fatty_hp_3 -= 1
     
    end
    
    if @cannon_distance_58 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_3 -= 0.2
      @fatty_hp_3 -= 1
     
    end
    
    if @cannon_distance_59 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @fatty_y_3 -= 0.2
      @fatty_hp_3 -= 1
    
    end
    
    if @cannon_distance_60 < 50 && @cannon_collision == true 
      @laser_collison.play(volume = 0.02,speed = 0.5)   
      @fatty_y_3 -= 0.2
      @fatty_hp_3 -= 1
  
    end
    
    if @cannon_distance_61 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_4 -= 1
      @goblin_hp_4 -= 1
   
    end
    
    if @cannon_distance_62 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_4 -= 1
      @goblin_hp_4 -= 1
   
    end
    
    if @cannon_distance_63 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_4 -= 1
      @goblin_hp_4 -= 1

    end
    
    if @cannon_distance_64 < 50 && @cannon_collision == true
      @laser_collison.play(volume = 0.02,speed = 0.5)
      @goblin_y_4 -= 1
      @goblin_hp_4 -= 1     
    end
        
  end
            
  def button_down(buttonCheck) #button_down is a specific method needed in gosu for key press.
     
    crystal_monster_distances()
  
  
    if $playing == true      
      if (buttonCheck == Gosu::KB_A)
        @weapon_v = 1 
        @shield_v = 0
        
      end 
      
      if (buttonCheck == Gosu::KB_S) && @shield_checker == true
        @weapon_v  = 0
        @shield_v  = 1
        @truthy_troof = true
        
      end 
      
           
      if (buttonCheck == Gosu::MsLeft) 
        
        if @symphony_crystal_null == true
          if @symphony_crystal_distance < 50
            @score += 1
            @enemy_hp -= 1
            @symphony_y -= 2.5
            @symphony_hp -= @symphony_hit
            @sword_slash.play
            if @symphony_hp < 0
              @shatter.play
              @symphony_hp = 100000
              @symphony_tick_boolean = false
              @symphony_visibility = false
              @symphony_crystal_null = false
              @symphony_hit = 0
              @symphony_counter += 1
              
            end
          end
        end
        
        if @symphony_crystal_null_2 == true
          if @symphony_crystal_distance_2 < 50
            @score += 1
            @enemy_hp -= 1
            @symphony_y_2 -= 2.5
            @symphony_hp_2 -= @symphony_hit_2 
            @sword_slash.play
            if @symphony_hp_2 < 0
              @shatter.play
              @symphony_hp_2 = 100000
              @symphony_tick_boolean_2 = false
              @symphony_visibility_2 = false
              @symphony_crystal_null_2 = false
              @symphony_hit_2 = 0
              @symphony_counter += 1
             
            end
          end
        end
        
        if @symphony_crystal_null_3 == true
          if @symphony_crystal_distance_3 < 50
            @score += 1
            @enemy_hp -= 1
            @symphony_y_3 -= 2.5
            @symphony_hp_3 -= @symphony_hit_3
            @sword_slash.play
            if @symphony_hp_3 < 0
              @shatter.play
              @symphony_hp_3 = 100000
              @symphony_destroyed.play
              @symphony_tick_boolean_3 = false
              @symphony_visibility_3 = false
              @symphony_crystal_null_3 = false
              @symphony_hit_3 = 0
              @symphony_counter += 1
             
            end
          end
        end
        
                
        if @iris_crystal_null == true
         if @iris_crystal_distance < 50 #the collision for hitting the reverse crystals.
           @score += 1
           @enemy_hp -= 1
           @iris_crystal_y -= 2.5
           @iris_crystal_hp -= 3
           @sword_slash.play
           if @iris_crystal_hp < 0
             @shatter.play
             @iris_crystal_visibility -= 1
             @iris_crystals += 1
             @score += 1
             @iris_crystal_null = false
           end
         end
        end
        
        if @scorch_crystal_null == true
         if @scorch_crystal_distance < 50 #the collision for hitting the reverse crystals.
           @score += 1
           @enemy_hp -= 1 #just so the boss hp doesnt regen.
           @scorch_crystal_y -= 2.5
           @scorch_crystal_hp -= 3
           @sword_slash.play
             
           if @scorch_crystal_hp < 0 
             @shatter.play
             @scorch_explosion.play
             @scorch_color_checker = 1
             @scorch_crystal_visibility -= 1
             @score += 1
             @scorch_crystal_null = false
             if @scorch_checker == true 
               @enemy_hp -= @scorch_damage
             end
             if @scorch_checker_2 == true
               @minion_hp -= @scorch_damage
             end
             if @scorch_checker_3 == true
               @minion_hp_2 -= @scorch_damage
             end
             if @scorch_checker_4 == true
               @minion_hp_3 -= @scorch_damage
             end
             if @scorch_checker_5 == true
               @minion_hp_4 -= @scorch_damage
             end
             if @scorch_checker_6 == true
               @minion_hp_5 -= @scorch_damage
             end
             if @scorch_checker_7 == true
               @minion_hp_6 -= @scorch_damage
             end
             if @scorch_checker_8 == true
               @minion_hp_7 -= @scorch_damage
             end
             if @scorch_checker_9 == true
               @minion_hp_8 -= @scorch_damage
             end
             if @scorch_checker_10 == true
               @fatty_hp -= @scorch_damage
             end
             if @scorch_checker_11 == true
               @fatty_hp_2 -= @scorch_damage
             end
             if @scorch_checker_12 == true
               @fatty_hp_3 -= @scorch_damage
             end
           end
           
         end
        end  
              
        if @time_crystal_null == true
          if @time_crystal_distance < 50 #The collision for hitting the time crystals.
            @time_crystal_hp -= 3
            @time_crystal_y -= 2.5
            @enemy_hp -= 1
            @score += 1
            @sword_slash.play
            if @time_crystal_hp < 0
              @shatter.play
              @time_crystal += 1
              @time_crystal_visibility -= 1
              @score += 1
              @time_crystal_null = false 
            end           
          end           
        end  
        
         if @reverse_crystal_null == true
          if @reverse_crystal_distance < 50 #the collision for hitting the reverse crystals.
            @score += 1
            @enemy_hp -= 1
            @reverse_crystal_y -= 2.5
            @reverse_crystal_hp -= 3
            @sword_slash.play
            if @reverse_crystal_hp < 0
              @shatter.play 
              @reverse_crystal += 1
              @reverse_crystal_visibility -= 1
              @score += 1
              @reverse_crystal_null = false
            end
          end
          
        end
        
        if @truthy == true
          
          if Gosu.distance(mouse_x,mouse_y,@game_exit_x,@game_exit_y) < 50
            Kernel.exit
          end
             
          if @boss_distance < 50 && @hit_checker == true  #the collision for hitting the monsters with the sword.      
            @score += 2
            @enemy_y -= 2
            @enemy_hp -= @hit   
            @sword_slash.play             
            if @enemy_hp <= -1
              @enemy_x = rand(400..900)
              @enemy_y = 0
              @levels += 1
              @growl.play
            
              @enemy_destroy = true
              if @enemy_destroy == true
                @enemy_stack = @enemy_stack + 50 #Each monster kill, next monsters hp is higher.
                @enemy_hp += @enemy_stack
                @gold += 15              
                @enemy_destroy = false
              end
            end                    
          else
            @score -= 1 #if the user doesnt hit accurately onto monsters, and just elsewhere on the map. They lose exp. Cant play dull, it will cost you!
            @enemy_hp += 1       
          end 
          
          if @fatty_distance < 75 && @hit_checker_4 == true
            @sword_slash.play
            @score += 3
            @fatty_y -= 2
            @enemy_hp -= 1 #To make sure the boss hp doesnt rise up.
            @fatty_hp -= @hit
            if @fatty_hp <= -1
              @sword_break.play
              @fatty_death.play
              @fatty_x = rand(400..900)
              @fatty_y = 0
              @fatty_stack = @fatty_stack + 25
              @fatty_hp = @fatty_stack
              @reverse_portal_null = true #making this condition true so when the monster dies, a portal spawns for the next one. It becomes false when the monster moves beyond 130 on the y so when the reverse crystal is used, the portal wont spawn as the monster is reversed back.
              @hit -= 1
              @gold += 10
            end
          end
          
          if @fatty_distance_2 < 75 && @hit_checker_8 == true
            @sword_slash.play
            @score += 3 #accounting for the -1 on the else statement above. Therefore only +2 exp each hit.
            @fatty_y_2 -= 0.1
            @enemy_hp -= 1 #To make sure the boss hp doesnt rise up because of the else statement above.
            @fatty_hp_2 -= @hit
            if @fatty_hp_2 <= -1
              @sword_break.play
              @fatty_death.play
              @fatty_x_2 = rand(400..900)
              @fatty_y_2 = 0
              @fatty_stack_2 = @fatty_stack_2 + 25
              @fatty_hp_2 = @fatty_stack_2
              @reverse_portal_null_6 = true
              @hit -= 1
              @gold += 10
            end
          end
          
          if @fatty_distance_3 < 75 && @hit_checker_15 == true
            @sword_slash.play
            @score += 3 #accounting for the -1 on the else statement above. Therefore, only +2 exp each hit.
            @fatty_y_3 -= 0.1
            @enemy_hp -= 1 #To make sure the boss hp doesnt rise up because of the else statement above.
            @fatty_hp_3 -= @hit
            if @fatty_hp_3 <= -1
              @sword_break.play
              @fatty_death.play
              @fatty_x_3 = rand(400..900)
              @fatty_y_3 = 0
              @fatty_stack_3 = @fatty_stack_3 + 25
              @fatty_hp_3 += @fatty_stack_3
              @reverse_portal_null_11 = true
              @hit -= 1
              @gold += 10
            end
          end
          
          if @minion_distance  < 50 && @hit_checker_2 == true #minion 1 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y -= 2
            @minion_hp -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.   
            @sword_slash.play
            if @minion_hp <= -1
              @minion_enemy_x = rand(400..900)
              @minion_enemy_y = -5
              @minion_stack = @minion_stack + 20
              @minion_hp += @minion_stack
              @reverse_portal_null_2 = true
              @gold += 5 
              @growl_2.play
            end                  
          end
          
          if @minion_2_distance  < 50 && @hit_checker_3 == true #minion 2 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_2 -= 2
            @minion_hp_2 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_2 <= -1
              @minion_enemy_x_2 = rand(400..900)
              @minion_enemy_y_2 = -5
              @minion_stack_2 = @minion_stack_2 + 20
              @minion_hp_2 += @minion_stack_2
              @reverse_portal_null_3 = true
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_3_distance  < 50 && @hit_checker_5 == true #minion 3 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_3 -= 2
            @minion_hp_3 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_3 <= -1
              @minion_enemy_x_3 = rand(400..900)
              @minion_enemy_y_3 = -5
              @minion_stack_3 = @minion_stack_3 + 20
              @minion_hp_3 += @minion_stack_3
              @reverse_portal_null_4 = true
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_4_distance  < 50 && @hit_checker_7 == true #minion 4 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_4 -= 2
            @minion_hp_4 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_4 <= -1
              @minion_enemy_x_4 = rand(400..900)
              @minion_enemy_y_4 = -5
              @minion_stack_4 = @minion_stack_4 + 20
              @reverse_portal_null_5 = true
              @minion_hp_4 += @minion_stack_4
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_5_distance  < 50 && @hit_checker_9 == true #minion 4 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_5 -= 2
            @minion_hp_5 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_5 <= -1
              @minion_enemy_x_5 = rand(400..900)
              @minion_enemy_y_5 = -5
              @reverse_portal_null_7 = true
              @minion_stack_5 = @minion_stack_5 + 20
              @minion_hp_5 += @minion_stack_5
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_6_distance  < 50 && @hit_checker_11 == true #minion 4 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_6 -= 2
            @minion_hp_6 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_6 <= -1
              @minion_enemy_x_6 = rand(400..900)
              @minion_enemy_y_6 = -5
              @reverse_portal_null_8 = true
              @minion_stack_6 = @minion_stack_6 + 20
              @minion_hp_6 += @minion_stack_6
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_7_distance  < 50 && @hit_checker_12 == true #minion 7 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_7 -= 2
            @minion_hp_7 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_7 <= -1
              @minion_enemy_x_7 = rand(400..900)
              @minion_enemy_y_7 = -5
              @reverse_portal_null_9 = true
              @minion_stack_7 = @minion_stack_7 + 20
              @minion_hp_7 += @minion_stack_7
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @minion_8_distance  < 50 && @hit_checker_14 == true #minion 8 collision
            @score += 2 #accounting for the -1 on the else statement above. Therefore, only +1 exp each hit.
            @minion_enemy_y_8 -= 2
            @minion_hp_8 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @minion_hp_8 <= -1
              @minion_enemy_x_8 = rand(400..900)
              @minion_enemy_y_8 = -5
              @reverse_portal_null_10 = true
              @minion_stack_8 = @minion_stack_8 + 20
              @minion_hp_8 += @minion_stack_8
              @gold += 5
              @growl_2.play
            end              
          end
          
          if @goblin_distance  < 50 && @hit_checker_6 == true #goblin 1 collision
            @score += 4 #accounting for the -1 on the else statement above. Therefore, only +3 exp each hit.
            @goblin_y -= 5
            @goblin_hp -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @goblin_hp <= -1
              @goblin_death.play
              @goblin_velocity = 0
              @goblin_y = -25
              @gold += 10
            end              
          end
          
          if @goblin_distance_2  < 50 && @hit_checker_10 == true #goblin 1 collision
            @score += 4 #accounting for the -1 on the else statement above. Therefore, only +3 exp each hit.
            @goblin_y_2 -= 5
            @goblin_hp_2 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @goblin_hp_2 <= -1
              @goblin_death.play
              @goblin_velocity_2 = 0
              @goblin_y_2 = -25
              @gold += 10   
            end              
          end
          
          if @goblin_distance_3  < 50 && @hit_checker_13 == true #goblin 1 collision
            @score += 4 #accounting for the -1 on the else statement above. Therefore, only +3 exp each hit.
            @goblin_y_3 -= 5
            @goblin_hp_3 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @goblin_hp_3  <= -1
              @goblin_death.play
              @goblin_velocity_3 = 0
              @goblin_y_3 = -25
              @gold += 10
            end              
          end
          
          if @goblin_distance_4  < 50 && @hit_checker_16 == true #goblin 4 collision
            @score += 4 #accounting for the -1 on the else statement above. Therefore, only +3 exp each hit.
            @goblin_y_4 -= 5
            @goblin_hp_4 -= @hit
            @enemy_hp -= 1 #To make the enemy_hp not drop or increase when attacking a minion.
            @sword_slash.play
            if @goblin_hp_4  <= -1
              @goblin_death.play
              @goblin_velocity_4 = 0
              @goblin_y_4 = -25
              @gold += 10
            end              
          end
          
        end 
        
     end
    else
      if (buttonCheck == Gosu::KbSpace)
        $playing = true
        @game_over_checker = 0
        $start_time = Gosu.milliseconds
        @hit = 3
        @throw = 0
        @enemy_y = 0
        @minion_enemy_y = 0
        @minion_enemy_y_2 = 0
        @minion_enemy_y_3 = 0
        @minion_enemy_y_4 = 0
        @minion_enemy_y_5 = 0
        @minion_enemy_y_6 = 0
        @minion_enemy_y_7 = 0
        @minion_enemy_y_8 = 0
        @fatty_y = 0
        @fatty_y_2 = 0
        @fatty_y_3 = 0
        @goblin_y = 0
        @goblin_y_2 = 0
        @goblin_y_3 = 0
        @goblin_y_4 = 0
        @gold = 0
        @enemy_hp = 50
        @enemy_stack = 25
        @levels = 1
        @lives -= 1
        @time_crystal = 1
        @reverse_crystal = 3
        @iris_crystals = 0
        @shield_health = 3
        @velocity_y = 0.7
        @velocity_y_2 = 0.7
        @velocity_y_3 = 0.7
        @velocity_y_4 = 0.7
        @velocity_y_5 = 0.7
        @velocity_y_6 = 0.7
        @velocity_y_7 = 0.7
        @velocity_y_8 = 0.7
        @velocity_y_9 = 0.7
        @goblin_velocity = 2.2
        @goblin_velocity_2 = 2.2
        @goblin_velocity_3 = 2.2
        @fatty_velocity = 0.4
        @fatty_velocity_2 = 0.4
        @fatty_velocity_3 = 0.4
        $mana_deletion = Gosu.milliseconds
        @start_timurr = Gosu.milliseconds
        @button_visibility = 1
        @sec_button_visibility = 1
        @third_button_visibility = 1
        @four_button_visibility = 1
        @fifth_button_visibility = 1
        @sixth_button_visibility = 1
        @time_crystal_visibility = 1
        @iris_appear_visibility = 0
        @throw = 0
        @button_play = true
        @sec_button_play = true
        @third_button_play = true
        @four_button_play = true
        @fifth_button_play = true
        @sixth_button_play = true
        @minion_hp = 25
        @minion_hp_2 = 25
        @minion_hp_3 = 25
        @minion_hp_4 = 25
        @minion_hp_5 = 25
        @minion_hp_6 = 25
        @minion_hp_7 = 25
        @minion_hp_8 = 25
        @fatty_hp = 50
        @fatty_hp_2 = 50
        @fatty_hp_3 = 50
        @enemy_stack = @enemy_hp + 25
        @minion_stack = @minion_hp + 25
        @minion_stack_2 = @minion_hp_2 + 25
        @minion_stack_3 = @minion_hp_3 + 25
        @minion_stack_4 = @minion_hp_4 + 25
        @minion_stack_5 = @minion_hp_5 + 25
        @minion_stack_6 = @minion_hp_6 + 25
        @minion_stack_7 = @minion_hp_7 + 25
        @minion_stack_8 = @minion_hp_8 + 25
        @fatty_stack = @fatty_hp + 25
        @fatty_stack_2 = @fatty_hp_2 + 25
        @fatty_stack_3 = @fatty_hp_3 + 25
        @time_crystal_hp = 30
        @reverse_crystal_hp = 30
        @scorch_crystal_hp = 50
        @time_crystal_y = 0
        @time_crystal_x = rand(400..900)
        @time_crystal_null = true
        @reverse_crystal_visibility = 1
        @reverse_crystal_null = true
        @reverse_crystal_y = 0
        @reverse_crystal_x = rand(400..900)
        @scorch_crystal_y = 0
        @scorch_crystal_x = rand(400..900)
        @scorch_damage = 30
        @iris_crystal_y = 0
        @iris_cyrstal_x = rand(400..900)
        @life_checker = 0
        if @lives < 2
          @velocity_y += 0.1
          @velocity_y_2 += 0.1
          @velocity_y_3 += 0.1
          @velocity_y_4 += 0.1
          @velocity_y_5 += 0.1
          @velocity_y_6 += 0.1
          @velocity_y_7 += 0.1
          @velocity_y_8 += 0.1
          @velocity_y_9 += 0.1
          @goblin_velocity += 0.3
          @goblin_velocity_2 += 0.3
          @goblin_velocity_3 += 0.3
          @fatty_velocity += 0.1
          @fatty_velocity_2 += 0.1
          @fatty_velocity_3 = 0.1  
          @life_checker_2 = 0
        end     
        if @lives < 1
          @velocity_y += 0.1
          @velocity_y_2 += 0.1
          @velocity_y_3 += 0.1
          @velocity_y_4 += 0.1
          @velocity_y_5 += 0.1
          @velocity_y_6 += 0.1
          @velocity_y_7 += 0.1
          @velocity_y_8 += 0.1
          @velocity_y_9 += 0.1
          @goblin_velocity += 0.3
          @goblin_velocity_2 += 0.3
          @goblin_velocity_3 += 0.3
          @fatty_velocity += 0.1
          @fatty_velocity_2 += 0.1
          @fatty_velocity_3 = 0.1  
          @life_checker_3 = 0
        end
        #if @symphony_crystal == 1 && $playing == true
          #$win = 1
          #end
      end
    end
    
     
    def button_up(buttonPress)
           
      if $playing == true
        
        if @truthy_troof == true && @shield_v == 1 && @shield_health >= 1 #the collision for when the shield hits the monsters & boss.
          
          if (buttonPress == Gosu::MsLeft)
            if Gosu.distance(mouse_x,mouse_y, @enemy_x, @enemy_y) < 50
              @enemy_y -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x, @minion_enemy_y) < 50
              @minion_enemy_y -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_2, @minion_enemy_y_2) < 50
              @minion_enemy_y_2 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_3, @minion_enemy_y_3) < 50
              @minion_enemy_y_3 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_4, @minion_enemy_y_4) < 50
              @minion_enemy_y_4 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_5, @minion_enemy_y_5) < 50
              @minion_enemy_y_5 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_6, @minion_enemy_y_6) < 50
              @minion_enemy_y_6 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_7, @minion_enemy_y_7) < 50
              @minion_enemy_y_7 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
            
            if Gosu.distance(mouse_x,mouse_y, @minion_enemy_x_8, @minion_enemy_y_8) < 50
              @minion_enemy_y_8 -= 200
              @shield_health -= 1
              @shield_slam.play
              if @shield_health < 1
                @shield_break.play
                @weapon_v = 1
                @truthy_troof = false
                @truthy = true
              end
            end
         end   
        end  
        
        if(buttonPress == Gosu::MsRight)
          
          if @iris_button_play == true && @iris_stack_preventer == true 
            if Gosu.distance( mouse_x, mouse_y, @iris_button_x , @iris_button_y - 35) < 50 && @iris_crystals >= 1
          
              @iris_appear_visibility = 1
              @iris_crystals -= 1
              @start_timah = Gosu.milliseconds
              @iris_appear.play
              @iris_color_checker = 1
              @hit += @iris_buff
           
                          
            end
          end
          
          if @magic_button_play == true
            if Gosu.distance( mouse_x, mouse_y, @magic_button_x , @magic_button_y - 35) < 50 && $mana > 30
          
              @cannon_collision = true 
              $mana_deletion = Gosu.milliseconds
              @color_checker = 1
              @spell.play(volume = 0.2)
              @time_color_checker = 1
              @throw = 1
              
              @start_timurr = Gosu.milliseconds
          
              @magicka_x = rand(400..900)
              @shooting_x = @magicka_x
              
              @magicka_x_2 = rand(400..900)
              @shooting_x_2 = @magicka_x_2
              
              @magicka_x_3 = rand(400..900)
              @shooting_x_3 = @magicka_x_3
              
              @magicka_x_4 = rand(400..900)
              @shooting_x_4 = @magicka_x_4
                                     
            end
          end
      
          if @magic_button_play_2 == true 
            if Gosu.distance(mouse_x, mouse_y,@sec_magic_button_x,@sec_magic_button_y - 35) < 50
                   
              @reverse_crystal -= 1
              @velocity_y -= 1.5 
              @velocity_y_2 -= 1.5
              @velocity_y_3 -= 1.5
              @velocity_y_4 -= 1.5
              @velocity_y_5 -= 1.5
              @velocity_y_6 -= 1.5
              @velocity_y_7 -= 1.5
              @velocity_y_8 -= 1.5
              @velocity_y_9 -= 1.5
              @fatty_velocity -= 1
              @fatty_velocity_2 -= 1
              @fatty_velocity_3 -= 1
              @sec_color_checker = 1
              @reverse_crystal_usage.play
              @reverse_color_checker = 1
              
            end
        
          end
      
          if @magic_button_play_3 == true
            if Gosu.distance( mouse_x, mouse_y, @fourth_magic_button_x , @fourth_magic_button_y - 35) < 50 && @gold > -1
          
              @shield_health += 3
              @gold -= 100
              @third_color_checker = 1
              @shield_buy.play
              @shield_checker = true
              @shield_v = 0
              @sword_v = 1
                
            end
          end
      
          if @magic_button_play_4 == true
            if Gosu.distance( mouse_x, mouse_y, @third_magic_button_x , @third_magic_button_y - 35) < 50 
          
              @time_crystal -= 1
              $start_time = Gosu.milliseconds    
              @four_color_checker = 1
              @time_crystal_usage.play
              @time_color_checker = 1
                              
            end
          end
      
          if @button_play == true
            if Gosu.distance(mouse_x, mouse_y,@button_x,@button_y) < 50
          
              @score -= 50
              @hit += 1
              @button_visibility -= 1 
              @button_play = false
              @button_press.play
          
            end
          end 
      
          if @sec_button_play == true
            if Gosu.distance(mouse_x, mouse_y,@sec_button_x,@sec_button_y) < 50
          
              @score -= 100
              @hit += 2
              @sec_button_visibility -= 1 
              @sec_button_play = false
              @button_press.play
          
            end 
          end
      
          if @third_button_play == true
            if Gosu.distance(mouse_x, mouse_y,@third_button_x,@third_button_y) < 50
          
              @score -= 150
              @hit += 3
              @third_button_visibility -= 1 
              @third_button_play = false
              @button_press.play
          
            end 
          end
      
          if @four_button_play == true
            if Gosu.distance(mouse_x, mouse_y,@four_button_x,@four_button_y) < 50
          
              @score -= 200
              @hit += 4
              @four_button_visibility -= 1 
              @four_button_play = false
              @button_press.play
          
            end
          end
      
          if @fifth_button_play == true
            if Gosu.distance(mouse_x, mouse_y,@fifth_button_x,@fifth_button_y) < 50
          
              @score -= 250
              @hit += 5
              @fifth_button_visibility -= 1 
              @fifth_button_play = false
              @button_press.play
          
            end
          end
      
          if @sixth_button_play == true
            if Gosu.distance(mouse_x, mouse_y,@sixth_button_x,@sixth_button_y) < 50
          
              @score -= 300
              @hit += 6
              @sixth_button_visibility -= 1 
              @sixth_button_play = false  
              @sword_bar_replenish.play
              @button_play = true
              @sec_button_play = true
              @third_button_play = true
              @four_button_play = true
              @fifth_button_play = true
              @sixth_button_play = true
              @button_visibility = 1
              @sec_button_visibility = 1
              @third_button_visibility = 1
              @four_button_visibility = 1
              @fifth_button_visibility = 1
              @sixth_button_visibility = 1
          
            end
          end  
        end
      end
    end
  end  
end

$window_2 = Tap_Symphony.new()
$window_2.show


class Ending_Page < Gosu::Window
  
  def initialize
    
    super(800,600)
    self.caption = "Tap Symphony: Ending"
    
    @win_background = Gosu::Image.new('assets/images/sunset.jpg')
    @lose_background = Gosu::Image.new('assets/images/graveyard.jpeg')
    
    
    @graveyard_message = Gosu::Image.new('assets/images/graveyard_message.png')
    @graveyard_message_2 = Gosu::Image.new('assets/images/graveyard_message_2.png')
    @graveyard_message_3 = Gosu::Image.new('assets/images/graveyard_message_3.png')
    @graveyard_message_4 = Gosu::Image.new('assets/images/graveyard_message_4.png')
    
    @sunset_message = Gosu::Image.new('assets/images/sunset_message.png')
    @sunset_message_2 = Gosu::Image.new('assets/images/sunset_message_2.png')
    @sunset_message_3 = Gosu::Image.new('assets/images/graveyard_message_3.png')
    @sunset_message_4 = Gosu::Image.new('assets/images/graveyard_message_4.png')
    
    @mouse_image = Gosu::Image.new('assets/images/Sword_1.png')
    @arrow_image = Gosu::Image.new('assets/images/pass_arrow.png')
    
    @quit_font = Gosu::Image.new('assets/images/quit_font.png')
    
    @win_song = Gosu::Song.new('assets/sounds/win_song.mp3')
    @lose_song = Gosu::Song.new('assets/sounds/lose_song.wav')
    
    @quit_x = 660
    @quit_y = 510
    
    @word_velocity = 0.3
    
    @graveyard_x = 175
    @graveyard_x_2 = 145
    @graveyard_x_3 = 250
    @graveyard_x_4 = 215
    
    @graveyard_y = -150
    @graveyard_y_2 = -225
    @graveyard_y_3 = -360
    @graveyard_y_4 = -460
    
    @sunset_x = 75
    @sunset_x_2 = 325
    @sunset_x_3 = 250
    @sunset_x_4 = 215
    
    @sunset_y = -150
    @sunset_y_2 = -300
    @sunset_y_3 = -460
    @sunset_y_4 = -560
    
  end
  
  def update
    
    if $lose == 1
      @graveyard_y += @word_velocity
      @graveyard_y_2 += @word_velocity
      @graveyard_y_3 += @word_velocity
      @graveyard_y_4 += @word_velocity
    end
    
    if $win == 1
      @sunset_y += @word_velocity
      @sunset_y_2 += @word_velocity
      @sunset_y_3 += @word_velocity
      @sunset_y_4 += @word_velocity
    end
    
  end
  
  def draw
    
    if $win == 1
      
      @win_background.draw(0,0,0)
      @sunset_message.draw(@sunset_x,@sunset_y,1)
      @sunset_message_2.draw(@sunset_x_2,@sunset_y_2,1)
      @sunset_message_3.draw(@sunset_x_3,@sunset_y_3,1)
      @sunset_message_4.draw(@sunset_x_4,@sunset_y_4,1)
      @arrow_image.draw(@quit_x,@quit_y,1)
      @quit_font.draw(@quit_x + 35 , @quit_y - 30,1)
      @mouse_image.draw(mouse_x,mouse_y,1)
      @win_song.play
      
    end
    
    if $lose == 1
      
      @lose_background.draw(-150,-100,0)
      @graveyard_message.draw(@graveyard_x,@graveyard_y,1)
      @graveyard_message_2.draw(@graveyard_x_2,@graveyard_y_2,1)
      @graveyard_message_3.draw(@graveyard_x_3,@graveyard_y_3,1)
      @graveyard_message_4.draw(@graveyard_x_4,@graveyard_y_4,1)
      @arrow_image.draw(@quit_x,@quit_y,1)
      @quit_font.draw(@quit_x + 35 , @quit_y - 30,1)
      @mouse_image.draw(mouse_x,mouse_y,1)
      @lose_song.play
      
    end
    
  end
  
  def close
  end
  
  def button_up(endingCheck)
   
    if (endingCheck == Gosu::MsLeft)
      if Gosu.distance( mouse_x, mouse_y, @quit_x , @quit_y) < 100
        $playing = false
        $button_press_sound.play  
        $window_final.close!()
      end
    end
  end
   
end

$window_final = Ending_Page.new()
$window_final.show
