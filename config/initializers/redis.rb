$redis = nil
if Rails.env.production?
  $redis = Redis.new(url: "redis://h:pfde2ad96948dc464ca14d1ff22f7affb20e400abfdd6fe9228223b01e5cb0876@ec2-34-206-162-178.compute-1.amazonaws.com:34819")
end
