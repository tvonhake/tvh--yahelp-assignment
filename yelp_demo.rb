class Yahelp 
#class declaration for class and instance variable creation

  # a resturuant looks like this
  # res_data = {
  #   id: 0 *MUST BE UNIQUE,
  #   name: "",
  #   location: {
  #     city: "",
  #     state: "",
  #   },
  #   delivery: BOOLEAN,
  #   days_open: "" *DAYS SEPERATED BY COMMAS(NO SPACES),
  #   likes: 0,
  #   dishes: ARRAY OF OBJECTS/HASHES
  #     { name: "", price: 0.0, ingredients: ARRAY OF ""S },
  #   ],
  #   reviews: ARRAY OF HASHES [
  #     {user_id: 0 *id of user object, rating: 0 0-5}
  #   ]
  # }
  def initialize(x, y) #on creation, class will initialize with pre-existing restuarant hashes
    @res1, @res2 = x, y
  end

end

#restuarant hashes
@res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
@res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}


#create new class with existing restuarant entries
@yahelp = Yahelp.new(@res1, @res2) 

# create array of restuarants 
@res_array = [@res1, @res2]


# OBJECTIVES

#CRUD ACTIONS

#create new restuarant entry in array, and new instance variable in class @yahelp
def create_res (res_id, name_in) #params are new ID for new rest. and the name of the rest.

  #create string for name of new instance variable that will hold the new hash of rest. info
  array_entry_name = "res" 
  array_entry_name = (array_entry_name + (@res_array.length + 1).to_s)

  #create temporary hash that we will push to array and new instance var
  res_id = {
      id: (@res_array.length + 1),
      name: name_in,
      location: {
        city: "",
        state: "",
      },
      delivery: true,
      days_open: "",
      likes: 0,
      dishes: [
        { name: "", price: 0.0, ingredients: []},
      ],
      reviews: [
        {user_id: 0 , rating: 0 } #rating from 0-5
      ]
    }

    #create new instance variable holding hash data for array_entry_name
    @yahelp.instance_variable_set("@#{array_entry_name}", res_id) 

    return res_id #return hash 
end

#return a listing
def return_res (id_in)
  return @res_array[(id_in - 1)]
end


#update a listing
def update_res (id_in, hash_in) #params are ID for restuarant to be updated, and updated information
  updated_array = @res_array.map {|x| x == @res_array[(id_in - 1)] ? hash_in : x}
  @res_array = updated_array
  
  instance_name_update = ("res" + "#{id_in}")
  @yahelp.instance_variable_set("@#{instance_name_update}", hash_in) #update value for existing instance variable with name @res(id_in)

  return updated_array

end


#delete a restuarant listing
def delete_res (delete_res_id) #param is ID for restuarant to be deleted
  @res_array.delete_at((delete_res_id -1)) #delete item at correct index (input -1)

end


# method to return address of restaurant
def get_address (res_id)
  address = @res_array[(res_id - 1)][:location] #grab location for restuarant at index (res_id-1) in @res_array

  return address
end

# method to return days of operation for restuarant
def get_days_open (res_id)
  days_operation = @res_array[(res_id - 1)][:days_open] #grab days_open for restuarant at index (res_id-1) in @res_array

  return days_operation
end

# method w/ param restuarant, returns the menu of the param
def get_menu (res_id)
  menu = @res_array[(res_id - 1)][:dishes] #grab list of dishes for restuarant in @res_array at index (res_id -1)

  return menu #return list of dishes

end


# method param restuarant, return avg review
def get_avg_review (res_id)
  reviews = @res_array[(res_id - 1)][:reviews] #grab :reviews for restuarant at index (res_id-1) in @res_array
  sum = 0
  avg = 0

  reviews.each_with_index do |i, index|
    sum = sum + i[:rating]
  end

  avg = sum / reviews.length

  return avg

end

