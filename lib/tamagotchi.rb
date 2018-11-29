require('pry')

class Tamagotchi

    @@tamagotchi_db = []

    def self.show_gotchi(id)
      @@tamagotchi_db
    end

 attr_reader :name, :sleep_level, :happy_level
 attr_accessor :food_level, :poop_level


  def initialize (name)
    @name = name
    @birth_time = Time.now.to_i
    @food_level = 10
    @sleep_level = 10
    @happy_level = 10
    @poop_level = 0.0
    @time_since = {
      food: @birth_time,
      happy: @birth_time
    }
    @deceased = false

    @id = @@tamagotchi_db.length
    @@tamagotchi_db.push(self)
  end

  def status (check_attr)
    capture_time = Time.now.to_i
    interval = 10 #in seconds
    (capture_time - @time_since[:"#{check_attr}"]) / interval
  end



  def feed_me
    current_time = Time.now.to_i
    penalty_points = self.status('food')
    @food_level -= penalty_points
    if(@food_level < 10)
      @food_level += 1
      @poop_level += 0.5
      @time_since[:food] = current_time
      puts "om nom nommmm"
    else
      puts "I just ate :-)))"
    end
    @food_level
  end

  def play
    current_time = Time.now.to_i
    penalty_points = self.status('happy')
    @happy_level -= penalty_points
    if(@happy_level < 10)
      @happy_level += 1
      @food_level -= 1
      @time_since[:happy] = current_time
      puts "wheeee!"
    else
      puts "I'm all tuckered out!"
    end
    @happy_level
  end



    #
    # if !self.dead? && @food_level < 10
    #   self.keep_alive
    #   @food_level += 1
    #   @poop_level += 0.5
    #   puts "you feed me"
    # elsif !self.dead? && @food_level >= 10
    #   puts "I'm full!!!"
    # else
    #   puts "zombies only eat bwaaains."
    # end
  # def is_alive?
  #   @food_level > 0
  # end
  #
  # def dead?
  #   idle_time_in_secs = 60
  #   if Time.now.to_i - @elapsed_time > idle_time_in_secs
  #     @decased = true
  #     return true
  #   end
  #   false
  # end

end

# thing = Tamagotchi.new('jared')
