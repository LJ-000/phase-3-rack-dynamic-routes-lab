class Application

    @@items = [Item.new("Bananas", 4.50)]
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        item_name = req.path.split("/items").last 
          if item = @@items.find{ |t| t.name == item_name}
          resp.write item.price 
      
        else
        resp.status =400
        resp.write "Item not Found"
      end

        else resp.status=404
        resp.write "Route not Found"
    end 

    resp.finish
end 

end 

  
    