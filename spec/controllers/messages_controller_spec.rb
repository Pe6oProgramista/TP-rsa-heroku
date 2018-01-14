RSpec.describe MessagesController  do
	# before(:each) do
	# 	rsa_keys = RSA.new(0, 0, 0)
	# 	rsa_keys.new_key
 #    	@rsa = Rsa.new
 #    	@rsa.n = rsa_keys.n
 #    	@rsa.e = rsa_keys.e
 #    	@rsa.d = rsa_keys.d
 #    	@rsa.save
	# end
	
	 it "create message" do
        post :create, params: {id: 1, message: "pesho"}
        expect(response.body).to be_present
        json = JSON.parse(response.body)['id']
        expect(Message.where(id: json)).to be_present
	end 
	
	it "show message" do
        post :show, params: {id: 1, id2: 1}
        expect(response.body).to be_present
        json = JSON.parse(response.body)['message']
        expect(json).to eq "76689:28553:21702:11181:83245"
	end 

	it "should encrypt and decrypt a message" do   
       post :decrypt_message, params: {id: 1, message: "76689:28553:21702:11181:83245"}
       expect(JSON.parse(response.body)["message"]).to eq "pesho"
	end
end 
