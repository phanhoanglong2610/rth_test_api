# Module: API call
# Author: LongPH
# Date Created: 03/12/2019
# Usage: use to call API to register and get instruction from RTH
# 
# Please call our API to register your information and get the instructions:
#
# API endpoint: https://rth-recruitment.herokuapp.com/api/candidates/register
# App token (set on header): X-App-Token: 76524a53ee60602ac3528f38
# Params: email, first_name, last_name, candidate_type(ror), description
#


require 'uri'
require 'net/http'
require 'net/https'
require 'json'

endpoint = "https://rth-recruitment.herokuapp.com/api/candidates/register"
header = {
	"Content-Type" =>"x-www-form-urlencoded",
	"X-App-Token": "76524a53ee60602ac3528f38",
}
params = {
	"email" => "phanhoanglong2610@gmail.com",
	"first_name" => "Long",
	"last_name" => "Phan-Hoang",
	"candidate_type" => "ror",
	"description" => "Register for RoR position"
}

endpoint2 = "https://api.themoviedb.org/4/list"
header2 = {
	"Content-Type" =>"x-www-form-urlencoded",
	"X-App-Token": "76524a53ee60602ac3528f38",
}
header2["authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1MTk4NDYyNzYsInN1YiI6IjVhOGNhNDBmOTI1MTQxMGIwMTA4ZjUzNiIsImp0aSI6IjY5OTkxOCIsImF1ZCI6IjEyMDgyMWY2ZDIxOTE4Y2Y1NzA1MGNmOWU4Y2Q0ZDBhIiwic2NvcGVzIjpbImFwaV9yZWFkIiwiYXBpX3dyaXRlIl0sInZlcnNpb24iOjF9.4B-StWrStNmjIUI7f4BBKej4dGJCIW6oK3lR-W-5o8A"
params2 = {
	"name" => "Long",
	"iso_639_1" => "en"
}

def call_api(endpoint, header, params)
	# Conduct uri
	uri = URI.parse(endpoint)
	# Create https object
	https = Net::HTTP.new(uri.host, uri.port)
	https.use_ssl = true
	# Make request
	req = Net::HTTP::Post.new(uri.path, header)
	req.set_form_data(params)
	# Get response
	res = https.request(req)
	puts res.body
end

call_api(endpoint, header, params)
# call_api(endpoint2, header2, params2)