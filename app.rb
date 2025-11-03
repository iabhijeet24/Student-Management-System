require 'sinatra'
require 'erb'

set :public_folder, 'public'
set :views, 'views'

# Array to store students
STUDENTS = []

get '/' do
  erb :index
end

get '/add' do
  erb :add
end

post '/save' do
  name = params[:name]
  age = params[:age]
  course = params[:course]
  marks = params[:marks].to_i

  grade = case marks
          when 90..100 then "A+"
          when 80..89 then "A"
          when 70..79 then "B"
          when 60..69 then "C"
          when 50..59 then "D"
          else "F"
          end

  STUDENTS << { name: name, age: age, course: course, marks: marks, grade: grade }
  redirect '/list'
end

get '/list' do
  erb :list
end
