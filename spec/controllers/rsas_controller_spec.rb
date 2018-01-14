RSpec.describe RsasController  do
	it "create new keys" do
		post :create
		expect(response.body).to be_present
		id = JSON.parse(response.body)['id'].to_i
		expect(Rsa.where(id: id)).to be_present
	end

	it "create new keys with valid type" do
		post :create
		id = JSON.parse(response.body)['id']
		rsa = Rsa.find_by(id: id)
		expect(rsa.n).to be_an Integer
		expect(rsa.e).to be_an Integer
		expect(rsa.d).to be_an Integer
	end

	it "show keys" do
		post :create
		id = JSON.parse(response.body)['id']
		get :show, params: { id: id }
		expect(response.body).to be_present
		json = JSON.parse(response.body)
		expect(json['n']).to be_an Integer
		expect(json['e']).to be_an Integer
		expect(json['d']).to be_an Integer
	end

	it "valid show of keys" do
		post :create
		id = JSON.parse(response.body)['id']
		get :show, params: { id: id }
		json = JSON.parse(response.body)
		expect(Rsa.find_by(id: id).n).to eq json['n']
		expect(Rsa.find_by(id: id).e).to eq json['e']
		expect(Rsa.find_by(id: id).d).to eq json['d']
	end

	it "chek for valid keys" do
		post :create
		id = JSON.parse(response.body)['id']
		created_rsa = Rsa.find_by(id: id)
		rsa = RSA.new(created_rsa.n, created_rsa.e, created_rsa.d)
		expect(rsa.decrypt(rsa.encrypt("pe6oprogramista"))).to eq "pe6oprogramista"
	end

	it "check if create RSA with keys taken from params" do
		post :create, params: {n: 1, e: 2, d: 3}
		id = JSON.parse(response.body)['id']
		rsa = Rsa.find_by(id: id)
		expect(rsa.n).to eq 1
		expect(rsa.e).to eq 2
		expect(rsa.d).to eq 3
	end
end 