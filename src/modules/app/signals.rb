def sig_int(&callback)
  Signal.trap("INT") do
    puts "Exiting the app"
    callback.call
  end
end
