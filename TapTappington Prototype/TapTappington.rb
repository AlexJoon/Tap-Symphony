require 'gosu' # <-- Gosu module, like import graphics.py or import pygame

# local variable is: a = 2 (variables that are confined to the method that they are in)
# instance variable is: @a = 2 (variables that can be used around in all methods within the same class)
# class-level variable is: @@a = 2 (variables that can be used and passed around in different classes)
# global variable is: $a = 2 (global is global)

# 90% of all ruby syntax is the same as python, dictionaires(key, value pair) are called hashes here, lists are arrays

class TapTappington < Gosu::Window
  
  WIDTH = 400
  HEIGHT = 700

  def initialize
    super(WIDTH,HEIGHT)
    self.caption = "Tap Tappington"
    
    @user_image = Gosu::Image.new('Sword_1.png',:tileable => true)
    
    @enemy_image = Gosu::Image.new('biomech.png') 
    @enemy_image_2 = Gosu::Image.new('Ghost.png')
    @enemy_image_3 = Gosu::Image.new('archon.gif')
    @enemy_image_4 = Gosu::Image.new('bull.gif')
    
    @enemies = [@enemy_image,@enemy_image_2,@enemy_image_3,@enemy_image_4].sample
    
    
    @background_image = Gosu::Image.new('fortress.png')
    @background_image_2 = Gosu::Image.new('snowywoods.png')
    @background_image_3 = Gosu::Image.new('sandy.jpeg')
    @background_image_4 = Gosu::Image.new('haunted.jpg')
    
    @backgrounds = [@background_image, @background_image_2,@background_image_3,@background_image_4].sample
    
    @button_image = Gosu::Image.new('Button_1.png')
    @sec_button_image = Gosu::Image.new('Button_2.png')
    @third_button_image = Gosu::Image.new('Button_3.png')
    @four_button_image = Gosu::Image.new('Button_4.png')
    @fifth_button_image = Gosu::Image.new('Button_5.png')
    @sixth_button_image = Gosu::Image.new('Button_6.png')
    
    @hit = 1
    @font = Gosu::Font.new(30)
    @font_2 = Gosu::Font.new(25)
    
    @score = 0
    @levels = 1
    
    @playing = true
    
    @start_time = 0

    
    @enemy_x = 200
    @enemy_y = 160
    @enemy_width = 118
    @enemy_height = 118
    
    @enemy_hp = 50 
    @enemy_destroy = false
    @enemy_stack = @enemy_hp + 100

    
    #Sword Upgrade 1
    @button_x = 300
    @button_y = 525
    @button_width = 126
    @button_height = 126
    
    #Sword Upgrade 2
    @sec_button_x = 100
    @sec_button_y = 525
    @sec_button_width = 126
    @sec_button_height = 126
    
    #Sword Upgrade 3
    @third_button_x = 100
    @third_button_y = 585
    @third_button_width = 126
    @third_button_height = 126
    
    #Sword Upgrade 4
    @four_button_x = 300
    @four_button_y = 585
    @four_button_width = 126
    @four_button_height = 126
    
    #Sword Upgrade 5
    @fifth_button_x = 300
    @fifth_button_y = 645
    @fifth_button_width = 126
    @fifth_button_height = 126
    
    #Sword Upgrade 6
    @sixth_button_x = 100
    @sixth_button_y = 645
    @sixth_button_width = 126
    @sixth_button_height = 126
        
    @button_visibility = 1
    @sec_button_visibility = 1
    @third_button_visibility = 1
    @four_button_visibility = 1
    @fifth_button_visibility = 1
    @sixth_button_visibility = 1
       
    @button_play = true
    @sec_button_play = true
    @third_button_play = true
    @four_button_play = true
    @four_button_play = true
    @four_button_play = true
  
    
  end
  
  def update
    
    if @playing 
      
      @time_left = (200 - (Gosu.milliseconds/ 1000 ))
      @playing = false if @time_left < 0 || @score < -1
        
    end
    
  end
  
  def draw
               
    if @enemy_hp >= 2   
      @enemies.draw(@enemy_x - @enemy_width / 2 , @enemy_y - @enemy_height / 2, 1)
      @backgrounds.draw(0,0,0)  
    end
       
    if @button_visibility == 1
      @button_image.draw(@button_x - @button_width /2 , @button_y - @button_height /2 ,1)
    end
           
    if @sec_button_visibility == 1
      @sec_button_image.draw(@sec_button_x - @sec_button_width /2 , @sec_button_y - @sec_button_height /2 ,1)
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

    @user_image.draw(mouse_x - 40, mouse_y - 10, 1)
    
    
    @font_2.draw("Time Left:",275,300,2,1.0,1.0,Gosu::Color::YELLOW)
    @font_2.draw("EXP:",37,420,3,1.0,1.0, Gosu::Color::YELLOW)
    @font.draw(@score.to_s,52,450,2,1.0,1.0, Gosu::Color::BLUE)
    @font.draw(@time_left.to_s,300,325,2,1.0,1.0, Gosu::Color::BLUE)
    @font.draw("Boss HP:",100,50,2,1.0,1.0, Gosu::Color::RED)
    @font.draw(@enemy_hp.to_s,250,50,2,1.0,1.0, Gosu::Color::RED)
    @font.draw(@another_timer.to_s,200,600,2,1.0,1.0,Gosu::Color::BLUE)
    @font_2.draw("Sword DPS:",268,420,2,1.0,1.0,Gosu::Color::YELLOW)
    @font.draw(@hit.to_s,310,450,2,1.0,1.0,Gosu::Color::BLUE)
    @font_2.draw("Level:",30,300,2,1.0,1.0,Gosu::Color::YELLOW)
    @font.draw(@levels.to_s,50,325,2,1.0,1.0, Gosu::Color::BLUE)
    
    unless @playing == true
      @font.draw('Game Over',300,300,3)
      @font.draw('Want to Play again? Press Spacebar!',175,350,30)
    end
  end
  
  def button_down(buttonCheck) #button_down is a specific method needed in gosu for key press.
    
    if @playing
      if (buttonCheck == Gosu::MsLeft)        
        if Gosu.distance(mouse_x, mouse_y, @enemy_x , @enemy_y) < 50         
          @score += 2
          @enemy_hp -= @hit       
          if @enemy_hp <= -1
            @levels += 1
            @enemy_destroy = true
            if @enemy_destroy == true
              @enemy_stack = @enemy_stack + 50 #Each monster kill, next monsters hp is higher.
              @enemy_hp += @enemy_stack
              @enemy_destroy = false
            end
          end                    
        else
          @score -= 1
          @enemy_hp += 1
        end   
     end
    else
      if (button_Check == Gosu::KbSpace)
        @playing = true
        @start_time = Gosu.milliseconds
        @visible = -1
        @score = 0
      end
    end
    if(buttonCheck == Gosu::MsRight)
      if @button_play == true
        if Gosu.distance(mouse_x, mouse_y,@button_x,@button_y) < 30
          @score -= 50
          @hit += 1
          @button_visibility -= 1 
          @button_play = false
        end
      end 
      if @sec_button_play == true
        if Gosu.distance(mouse_x, mouse_y,@sec_button_x,@sec_button_y) < 30
          @score -= 100
          @hit += 2
          @sec_button_visibility -= 1 
          @sec_button_play = false
        end 
      end
      if @third_button_play == true
        if Gosu.distance(mouse_x, mouse_y,@third_button_x,@third_button_y) < 30
          @score -= 150
          @hit += 3
          @third_button_visibility -= 1 
          @third_button_play = false
        end 
      end
      if @four_button_play == true
        if Gosu.distance(mouse_x, mouse_y,@four_button_x,@four_button_y) < 30
          @score -= 200
          @hit += 4
          @four_button_visibility -= 1 
          @four_button_play = false
        end
      end
    end
  end
end


window = TapTappington.new()
window.show
      
    